module.exports = {
    compileCommand: 'node --max-old-space-size=4096 ../node_modules/.bin/truffle compile',
    testCommand: 'node --max-old-space-size=4096 ../node_modules/.bin/truffle test --network coverage',
    norpc: false,
    dir: '.',
    port: 8545,
    skipFiles: ['contracts/Migrations.sol']
};