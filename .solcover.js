module.exports = {
    port: 7545,
    testrpcOptions: '-p 7545 -u 0x54fd80d6ae7584d8e9a19fe1df43f04e5282cc43',
    testCommand: 'mocha --timeout 5000',
    norpc: true,
    dir: './solcover-workdir',
    copyPackages: ['openzeppelin-solidity'],
    skipFiles: ['contracts/Migrations.sol']
};