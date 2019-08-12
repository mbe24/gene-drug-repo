pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

contract GeneDrugRepo {

    uint16[2**22] observations;

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

    function encodeObject(string memory outcome, bool suspectedRelation, bool seriousSideEffect) public view returns (uint8) {
        uint8 encoded = outcomes[outcome] << 2 
        | (suspectedRelation ? 0x01 : 0x00) << 1
        | (seriousSideEffect ? 0x01 : 0x00);
        return encoded;
    }

    function decodeObject(uint8 encoded) public view returns (string memory outcome, bool suspectedRelation, bool seriousSideEffect) {
        seriousSideEffect = encoded & 0x01 == 1;
        suspectedRelation = (encoded >> 1) & 0x01 == 1;
        outcome = outcomesReversed[(encoded >> 2) & 0x03];
    }

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
        // Code here
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
        // Code here
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
        // Code here
    }

    /** Return the total number of known relations, a.k.a. the number of unique geneName, variant-number, drug-name pairs
     */
    function getNumRelations() public view returns (uint256) {
        // Code here
    }

    /** Return the total number of recorded observations, regardless of sender.
     */
    function getNumObservations() public view returns (uint256) {
        // Code here
    }

    /** Takes: A wallet address.
        Returns: The number of observations recorded from the provided wallet address
     */
    function getNumObservationsFromSender(address sender)
        public
        view
        returns (uint256)
    {
        // Code here
    }

}
