const fs= require('fs');
const Web3 = require('web3');
const readline = require('readline');
const once = require('events').once;

const config = JSON.parse(fs.readFileSync("config.json"));

const web3Options = {
	defaultAccount: config.account,
	defaultBlock: 'latest',
	transactionConfirmationBlocks: 1
}
const web3 = new Web3('http://localhost:8545',null,web3Options);
const defaultAccount = config.account

const abi = JSON.parse(fs.readFileSync(config.abiFile));
const contract = new web3.eth.Contract(abi);
contract.options = {
    address: config.contractAddress,
    from: defaultAccount,
    gasPrice: 1000000000,
    transactionConfirmationBlocks : 1
}
contract.options.jsonInterface = abi;   //Just incase. Sometimes it doesn't set

const inputFile = config.inputFile;


async function setContractGasLimit(){
	let gasLimit = await web3.eth.getBlock('latest').then( block => {gasLimit = block.gasLimit});
	contract.options.gasLimit = gasLimit;
}


var timers=[];
function diffTimeSeconds(start, end){
		return Math.round((end - start)/1000)
}

var unlockDuration = 6000;
async function unlock() {
	resetTimer("unlock");
	return web3.eth.personal.unlockAccount(defaultAccount,config.password,0); //0 should leave unlocked forever
}

function startTimer(key){
	timers[key] = new Date();
}

function secondsElapsed(key){
	return diffTimeSeconds(timers[key], new Date())
}
function endTimer(key) {
	let start = timers[key];
	let end = new Date();
	delete timers[key];
	return diffTimeSeconds(start, end)
}
function resetTimer(key) {
	if (!timers[key] instanceof Date) {
		timers[key] = new Date();
		return 0;
	}
	let start = timers[key];
	let end = timers[key] = new Date();
	let passed = diffTimeSeconds(start, end);
	return passed;
}




async function insertObservations() {
	await unlock();
	try {
    const rl = readline.createInterface({
      input: fs.createReadStream(inputFile),
      crlfDelay: Infinity
    });
    let insertPromises = [];
    let curLine = 0;
    let numToWaitFor=10;
    console.log("Beginning Insertion");
    for await (const line of rl) {
		insertPromises.push(insertObservation(line,curLine));
		curLine++;
		if (curLine % 10 == 0) {
			console.log("Pushed line:" + curLine);
		}
      if(curLine % numToWaitFor == 0){
      	console.log("Waiting for transactions to resolve before continuing");
      	await Promise.all(insertPromises);
      	insertPromises=[]; // Empty promises array
      }
	}

    await once(rl, 'close');
    console.log('File processed.');
    console.log('All Transactions resolved');
  } catch (err) {
    console.error(err);
  }
}


async function insertObservation (line, lineNum) {
	//Break line into pieces
	let [gene,variant,drug,outcome,suspectedRelation,seriousSideEffect]
	=  line.split('\t');
	let gasEstimate = await contract.methods.insertObservation(
				gene,
				variant,
				drug,
				outcome,
				suspectedRelation,
				seriousSideEffect
			).estimateGas();
	let gas = Math.round(gasEstimate*1.2);
	if (secondsElapsed("unlock") > unlockDuration-120) {
		await unlock();
	}
	try {
		let receipt = await contract.methods
			.insertObservation(
				gene,
				variant,
				drug,
				outcome,
				suspectedRelation,
				seriousSideEffect
			).send({"from":defaultAccount,"gas":gas}
		);
		if (receipt.status == false) {
			console.log("ERROR: Line near "+lineNum+" rejected transaction")
			console.log(receipt);
		}
	} catch(e) {
		console.log("ERROR: Web3 threw an error while inserting line "+lineNum)
		console.log(e);
	}
}

insertObservations();