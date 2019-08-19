pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "./Encoder.sol";
import "./Util.sol";

contract GeneDrugRepo is Encoder {

    uint16[2**22] observations;
    uint256 uniqueKeys;
    uint256 size;

    mapping(address => uint256) observationsBySender;

    // This structure is how the data should be returned from the query function.
    // You do not have to store relations this way in your contract, only return them.
    // geneName and drugName must be in the same capitalization as it was entered.
    // E.g. if the original entry was GyNx3 then GYNX3 would be considered incorrect.
    // Percentage values must be acurrate to 6 decimal places and will not include a % sign. E.g. "35.123456"
    struct GeneDrugRelation {
        string geneName;
        uint256 variantNumber;
        string drugName;
        uint256 totalCount;
        uint256 improvedCount;
        string improvedPercent;
        uint256 unchangedCount;
        string unchangedPercent;
        uint256 deterioratedCount;
        string deterioratedPercent;
        uint256 suspectedRelationCount;
        string suspectedRelationPercent;
        uint256 sideEffectCount;
        string sideEffectPercent;
    }

    /** Insert an observation into your contract, following the format defined in the data readme. 
        This function has no return value. If it completes it will be assumed the observations was recorded successfully. 

        Note: case matters for geneName and drugName. GyNx3 and gynx3 are treated as different genes.
     */
    function insertObservation(
        string memory geneName,
        uint256 variantNumber,
        string memory drugName,
        string memory outcome, // IMPROVED, UNCHANGED, DETERIORATED. This will always be capitalized, you don't have to worry about case.
        bool suspectedRelation,
        bool seriousSideEffect
    ) public {
        uint24 key = encodeKey(geneName, Util.itos(variantNumber), drugName);
        uint8 data = encodeData(outcome, suspectedRelation, seriousSideEffect);

        uint16 dataMask = data; // translate data (only 4 bits) to single bit set in uint16

        uint16 objects = observations[key];
        observations[key] = objects | dataMask;

        if (objects == 0)
            uniqueKeys++;

        size++;
        observationsBySender[msg.sender]++;
    }

    /** Takes geneName, variant-number, and drug-name as strings.
        A value of "*" for any name should be considered as a wildcard or alternatively as a null parameter.
        Returns: An array of GeneDrugRelation Structs which match the query parameters

        To clarify here are some example queries:
        query("CYP3A5", "52", "pegloticase") => An array of the one relation that matches all three parameters
        query("CYP3A5","52","*") => An array of all relations between geneName, CYP3A5, variant 52, and any drug
        query("CYP3A5","*","pegloticase") => An array of all relations between geneName, CYP3A5 and drug pegloticase, regardless of variant
        query("*","*","*") => An array of all known relations. 

        Note that capitalization matters. 
    */
    function query(
        string memory geneName,
        string memory variantNumber,
        string memory drug
    ) public view returns (GeneDrugRelation[] memory) {
        uint24 key = encodeKey(geneName, variantNumber, drug);
        uint16 objects = observations[key];

        GeneDrugRelation[16] memory relations;

        // iterate over bits
        for (uint8 i = 0; i < 16; i++) {
            if (Util.testBit(objects, i)) {
                GeneDrugRelation memory relation = getRelationForBit(key, i);
                relations[i] = relation;
            }
        }
    }

    function getRelationForBit(uint24 key, uint8 object) public view returns (GeneDrugRelation memory) {
        (string memory geneName, string memory variantNumber, string memory drugName) = decodeKey(key);
        (string memory outcome, bool suspectedRelation, bool seriousSideEffect) = decodeData(object);

        GeneDrugRelation memory relation = GeneDrugRelation(
            {
                geneName: geneName, 
                variantNumber: Util.stoi(variantNumber),
                drugName: drugName,
                totalCount: size,
                improvedCount: 0,
                improvedPercent: "0.0",
                unchangedCount: 0,
                unchangedPercent: "0.0",
                deterioratedCount: 0,
                deterioratedPercent: "0.0",
                suspectedRelationCount: 0,
                suspectedRelationPercent: "0.0",
                sideEffectCount: 0,
                sideEffectPercent: "0.0"
            }
        );
        return relation;
    }

    /** Takes: geneName, variant-number, and drug-name as strings. Accepts "*" as a wild card, same rules as query
        Returns: A boolean value. True if the relation exists, false if not. If a wild card was used,
        then true if any relation exists which meets the non-wildcard criteria.
     */
    function entryExists(
        string memory geneName,
        string memory variantNumber,
        string memory drug
    ) public view returns (bool) {
        uint24 key = encodeKey(geneName, variantNumber, drug);
        uint16 objects = observations[key];
        return objects > 0;
    }

    /** Return the total number of known relations, a.k.a. the number of unique geneName, variant-number, drug-name pairs
     */
    function getNumRelations() public view returns (uint256) {
        return uniqueKeys;
    }

    /** Return the total number of recorded observations, regardless of sender.
     */
    function getNumObservations() public view returns (uint256) {
        return size;
    }

    /** Takes: A wallet address.
        Returns: The number of observations recorded from the provided wallet address
     */
    function getNumObservationsFromSender(address sender)
        public
        view
        returns (uint256)
    {
        return observationsBySender[sender];
    }

}
