pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

contract Encoder {

    mapping(string => uint8) geneNames;
    mapping(string => uint8) drugNames;

    mapping(string => uint8) outcomes;
    mapping(uint8 => string) outcomesReversed;

    constructor() public {
        initializeGeneNames();
        initializeDrugNames();
        initializeOutcomes();
    }

    function initializeGeneNames() internal {
        geneNames["HLA-B"] = 0;
    }

    function initializeDrugNames() internal {
        drugNames["abacavir"] = 0;
    }

    function initializeOutcomes() internal {
        outcomes["IMPROVED"] = 0x00;
        outcomes["UNCHANGED"] = 0x01;
        outcomes["DETERIORATED"] = 0x02;

        outcomesReversed[0x00] = "IMPROVED";
        outcomesReversed[0x01] = "UNCHANGED";
        outcomesReversed[0x02] = "DETERIORATED";
    }

    function encodeData(
        string memory outcome,
        bool suspectedRelation,
        bool seriousSideEffect
    ) public view returns (uint8) {
        uint8 encoded = outcomes[outcome] << 2 
        | (suspectedRelation ? 0x01 : 0x00) << 1
        | (seriousSideEffect ? 0x01 : 0x00);
        return encoded;
    }

    function decodeData(
        uint8 encoded
    ) public view returns (string memory outcome, bool suspectedRelation, bool seriousSideEffect) {
        seriousSideEffect = encoded & 0x01 == 1;
        suspectedRelation = encoded & 0x02 == 2;
        outcome = outcomesReversed[(encoded >> 2) & 0x03];
    }

    function encodeKey(
        string memory geneName,
        string memory variantNumber,
        string memory drug
    ) public view returns (uint24) {
        // Code here
    }

    function decodeKey(
        uint24 encoded
    ) public view returns (string memory geneName, string memory variantNumber, string memory drugName) {
        // Code here
    }

}
