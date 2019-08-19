pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

contract Encoder {

    mapping(string => uint8) geneNames;
    mapping(uint8 => string) geneNamesReversed;
    
    mapping(string => uint8) drugNames;
    mapping(uint8 => string) drugNamesReversed;

    mapping(string => uint8) outcomes;
    mapping(uint8 => string) outcomesReversed;

    constructor() public {
        initializeGeneNames();
        initializeDrugNames();
        initializeOutcomes();
    }

    function initializeGeneNames() internal {
        geneNamesReversed[0x00] = "ABCB1";
        geneNamesReversed[0x01] = "ABCC4";
        geneNamesReversed[0x02] = "ABCG2";
        geneNamesReversed[0x03] = "ABL2";
        geneNamesReversed[0x04] = "ACE";
        geneNamesReversed[0x05] = "ADD1";
        geneNamesReversed[0x06] = "ADORA2A";
        geneNamesReversed[0x07] = "ADRB2";
        geneNamesReversed[0x08] = "ANKK1";
        geneNamesReversed[0x09] = "APOE";
        geneNamesReversed[0x0a] = "ASL";
        geneNamesReversed[0x0b] = "ASS1";
        geneNamesReversed[0x0c] = "ATIC";
        geneNamesReversed[0x0d] = "BCHE";
        geneNamesReversed[0x0e] = "C11orf65";
        geneNamesReversed[0x0f] = "C8orf34";
        geneNamesReversed[0x10] = "CACNA1S";
        geneNamesReversed[0x11] = "CALU";
        geneNamesReversed[0x12] = "CBR3";
        geneNamesReversed[0x13] = "CCHCR1";
        geneNamesReversed[0x14] = "CES1";
        geneNamesReversed[0x15] = "CETP";
        geneNamesReversed[0x16] = "CFTR";
        geneNamesReversed[0x17] = "CHRNA3";
        geneNamesReversed[0x18] = "COL22A1";
        geneNamesReversed[0x19] = "COMT";
        geneNamesReversed[0x1a] = "COQ2";
        geneNamesReversed[0x1b] = "CPS1";
        geneNamesReversed[0x1c] = "CRHR1";
        geneNamesReversed[0x1d] = "CRHR2";
        geneNamesReversed[0x1e] = "CYB5R1";
        geneNamesReversed[0x1f] = "CYB5R2";
        geneNamesReversed[0x20] = "CYB5R3";
        geneNamesReversed[0x21] = "CYB5R4";
        geneNamesReversed[0x22] = "CYP2A7P1";
        geneNamesReversed[0x23] = "CYP2B6";
        geneNamesReversed[0x24] = "CYP2C19";
        geneNamesReversed[0x25] = "CYP2C8";
        geneNamesReversed[0x26] = "CYP2C9";
        geneNamesReversed[0x27] = "CYP2D6";
        geneNamesReversed[0x28] = "CYP3A4";
        geneNamesReversed[0x29] = "CYP3A5";
        geneNamesReversed[0x2a] = "CYP4F2";
        geneNamesReversed[0x2b] = "DPYD";
        geneNamesReversed[0x2c] = "DRD2";
        geneNamesReversed[0x2d] = "DYNC2H1";
        geneNamesReversed[0x2e] = "EGF";
        geneNamesReversed[0x2f] = "EPHX1";
        geneNamesReversed[0x30] = "ERCC1";
        geneNamesReversed[0x31] = "F5";
        geneNamesReversed[0x32] = "FCGR3A";
        geneNamesReversed[0x33] = "FDPS";
        geneNamesReversed[0x34] = "FKBP5";
        geneNamesReversed[0x35] = "FLOT1";
        geneNamesReversed[0x36] = "G6PD";
        geneNamesReversed[0x37] = "GBA";
        geneNamesReversed[0x38] = "GGCX";
        geneNamesReversed[0x39] = "GNB3";
        geneNamesReversed[0x3a] = "GP1BA";
        geneNamesReversed[0x3b] = "GRIK4";
        geneNamesReversed[0x3c] = "GSTM1";
        geneNamesReversed[0x3d] = "GSTP1";
        geneNamesReversed[0x3e] = "HAS3";
        geneNamesReversed[0x3f] = "HLA-A";
        geneNamesReversed[0x40] = "HLA-B";
        geneNamesReversed[0x41] = "HLA-C";
        geneNamesReversed[0x42] = "HLA-DPB1";
        geneNamesReversed[0x43] = "HLA-DQA1";
        geneNamesReversed[0x44] = "HLA-DRB1";
        geneNamesReversed[0x45] = "HMGCR";
        geneNamesReversed[0x46] = "HPRT1";
        geneNamesReversed[0x47] = "HTR1A";
        geneNamesReversed[0x48] = "HTR2A";
        geneNamesReversed[0x49] = "HTR2C";
        geneNamesReversed[0x4a] = "IFNL3";
        geneNamesReversed[0x4b] = "IFNL4";
        geneNamesReversed[0x4c] = "ITPA";
        geneNamesReversed[0x4d] = "KCNIP4";
        geneNamesReversed[0x4e] = "KIF6";
        geneNamesReversed[0x4f] = "LDLR";
        geneNamesReversed[0x50] = "LPA";
        geneNamesReversed[0x51] = "LTC4S";
        geneNamesReversed[0x52] = "MC4R";
        geneNamesReversed[0x53] = "MT-RNR1";
        geneNamesReversed[0x54] = "MTHFR";
        geneNamesReversed[0x55] = "MTRR";
        geneNamesReversed[0x56] = "NAGS";
        geneNamesReversed[0x57] = "NAT1";
        geneNamesReversed[0x58] = "NAT2";
        geneNamesReversed[0x59] = "NEDD4L";
        geneNamesReversed[0x5a] = "NQO1";
        geneNamesReversed[0x5b] = "NT5C2";
        geneNamesReversed[0x5c] = "NUDT15";
        geneNamesReversed[0x5d] = "OPRM1";
        geneNamesReversed[0x5e] = "OTC";
        geneNamesReversed[0x5f] = "POLG";
        geneNamesReversed[0x60] = "PRKCA";
        geneNamesReversed[0x61] = "PROC";
        geneNamesReversed[0x62] = "PROS1";
        geneNamesReversed[0x63] = "PTGFR";
        geneNamesReversed[0x64] = "PTGS1";
        geneNamesReversed[0x65] = "RYR1";
        geneNamesReversed[0x66] = "SCN1A";
        geneNamesReversed[0x67] = "SEMA3C";
        geneNamesReversed[0x68] = "SERPINC1";
        geneNamesReversed[0x69] = "SLC28A3";
        geneNamesReversed[0x6a] = "SLC47A2";
        geneNamesReversed[0x6b] = "SLC6A4";
        geneNamesReversed[0x6c] = "SLCO1B1";
        geneNamesReversed[0x6d] = "SOD2";
        geneNamesReversed[0x6e] = "TANC1";
        geneNamesReversed[0x6f] = "TCF7L2";
        geneNamesReversed[0x70] = "TMEM43";
        geneNamesReversed[0x71] = "TNF";
        geneNamesReversed[0x72] = "TP53";
        geneNamesReversed[0x73] = "TPMT";
        geneNamesReversed[0x74] = "TXNRD2";
        geneNamesReversed[0x75] = "TYMS";
        geneNamesReversed[0x76] = "UGT1A1";
        geneNamesReversed[0x77] = "UGT1A4";
        geneNamesReversed[0x78] = "UGT2B15";
        geneNamesReversed[0x79] = "UMPS";
        geneNamesReversed[0x7a] = "VDR";
        geneNamesReversed[0x7b] = "VKORC1";
        geneNamesReversed[0x7c] = "XPC";
        geneNamesReversed[0x7d] = "XRCC1";
        geneNamesReversed[0x7e] = "YEATS4";

        for (uint8 i = 0x00; i < 3; i++) {
            string memory geneName = geneNamesReversed[i];
            geneNames[geneName] = i;
        } 
    }

    function initializeDrugNames() internal {
        drugNamesReversed[0x00] = "abacavir";
        drugNamesReversed[0x01] = "Ace Inhibitors";
        drugNamesReversed[0x02] = "acenocoumarol";
        drugNamesReversed[0x03] = "alfentanil";
        drugNamesReversed[0x04] = "Alkylating Agents";
        drugNamesReversed[0x05] = "allopurinol";
        drugNamesReversed[0x06] = "aminoglycoside antibacterials";
        drugNamesReversed[0x07] = "amitriptyline";
        drugNamesReversed[0x08] = "anthracyclines and related substances";
        drugNamesReversed[0x09] = "antidepressants";
        drugNamesReversed[0x0a] = "antipsychotics";
        drugNamesReversed[0x0b] = "aripiprazole";
        drugNamesReversed[0x0c] = "aspirin";
        drugNamesReversed[0x0d] = "ataluren";
        drugNamesReversed[0x0e] = "atazanavir";
        drugNamesReversed[0x0f] = "atomoxetine";
        drugNamesReversed[0x10] = "atorvastatin";
        drugNamesReversed[0x11] = "azathioprine";
        drugNamesReversed[0x12] = "belinostat";
        drugNamesReversed[0x13] = "Bisphosphonates";
        drugNamesReversed[0x14] = "brexpiprazole";
        drugNamesReversed[0x15] = "brivaracetam";
        drugNamesReversed[0x16] = "budesonide";
        drugNamesReversed[0x17] = "bupropion";
        drugNamesReversed[0x18] = "caffeine";
        drugNamesReversed[0x19] = "capecitabine";
        drugNamesReversed[0x1a] = "captopril";
        drugNamesReversed[0x1b] = "carbamazepine";
        drugNamesReversed[0x1c] = "carbimazole";
        drugNamesReversed[0x1d] = "carboplatin";
        drugNamesReversed[0x1e] = "carglumic acid";
        drugNamesReversed[0x1f] = "carisoprodol";
        drugNamesReversed[0x20] = "carvedilol";
        drugNamesReversed[0x21] = "celecoxib";
        drugNamesReversed[0x22] = "cerivastatin";
        drugNamesReversed[0x23] = "cetuximab";
        drugNamesReversed[0x24] = "cevimeline";
        drugNamesReversed[0x25] = "chloramphenicol";
        drugNamesReversed[0x26] = "chloroquine";
        drugNamesReversed[0x27] = "chlorpropamide";
        drugNamesReversed[0x28] = "ciprofloxacin";
        drugNamesReversed[0x29] = "cisplatin";
        drugNamesReversed[0x2a] = "citalopram";
        drugNamesReversed[0x2b] = "clobazam";
        drugNamesReversed[0x2c] = "clomipramine";
        drugNamesReversed[0x2d] = "clopidogrel";
        drugNamesReversed[0x2e] = "clozapine";
        drugNamesReversed[0x2f] = "codeine";
        drugNamesReversed[0x30] = "cyclophosphamide";
        drugNamesReversed[0x31] = "cyclosporine";
        drugNamesReversed[0x32] = "dabrafenib";
        drugNamesReversed[0x33] = "dapsone";
        drugNamesReversed[0x34] = "darifenacin";
        drugNamesReversed[0x35] = "desflurane";
        drugNamesReversed[0x36] = "desipramine";
        drugNamesReversed[0x37] = "dexlansoprazole";
        drugNamesReversed[0x38] = "dextromethorphan";
        drugNamesReversed[0x39] = "diazepam";
        drugNamesReversed[0x3a] = "diclofenac";
        drugNamesReversed[0x3b] = "digoxin";
        drugNamesReversed[0x3c] = "dimercaprol";
        drugNamesReversed[0x3d] = "divalproex sodium";
        drugNamesReversed[0x3e] = "dolasetron";
        drugNamesReversed[0x3f] = "dolutegravir";
        drugNamesReversed[0x40] = "donepezil";
        drugNamesReversed[0x41] = "doxepin";
        drugNamesReversed[0x42] = "duloxetine";
        drugNamesReversed[0x43] = "efavirenz";
        drugNamesReversed[0x44] = "eliglustat";
        drugNamesReversed[0x45] = "eltrombopag";
        drugNamesReversed[0x46] = "enflurane";
        drugNamesReversed[0x47] = "epirubicin";
        drugNamesReversed[0x48] = "erythromycin";
        drugNamesReversed[0x49] = "escitalopram";
        drugNamesReversed[0x4a] = "esomeprazole";
        drugNamesReversed[0x4b] = "ethanol";
        drugNamesReversed[0x4c] = "etoposide";
        drugNamesReversed[0x4d] = "fentanyl";
        drugNamesReversed[0x4e] = "fesoterodine";
        drugNamesReversed[0x4f] = "flecainide";
        drugNamesReversed[0x50] = "flibanserin";
        drugNamesReversed[0x51] = "fluorouracil";
        drugNamesReversed[0x52] = "fluoxetine";
        drugNamesReversed[0x53] = "flurbiprofen";
        drugNamesReversed[0x54] = "fluticasone propionate";
        drugNamesReversed[0x55] = "fluticasone/salmeterol";
        drugNamesReversed[0x56] = "fluvoxamine";
        drugNamesReversed[0x57] = "furosemide";
        drugNamesReversed[0x58] = "galantamine";
        drugNamesReversed[0x59] = "gemcitabine";
        drugNamesReversed[0x5a] = "glibenclamide";
        drugNamesReversed[0x5b] = "glimepiride";
        drugNamesReversed[0x5c] = "glipizide";
        drugNamesReversed[0x5d] = "haloperidol";
        drugNamesReversed[0x5e] = "halothane";
        drugNamesReversed[0x5f] = "hmg coa reductase inhibitors";
        drugNamesReversed[0x60] = "hormonal contraceptives for systemic use";
        drugNamesReversed[0x61] = "hydralazine";
        drugNamesReversed[0x62] = "hydrochlorothiazide";
        drugNamesReversed[0x63] = "hydroxychloroquine";
        drugNamesReversed[0x64] = "iloperidone";
        drugNamesReversed[0x65] = "imipramine";
        drugNamesReversed[0x66] = "interferon alfa-2b";
        drugNamesReversed[0x67] = "irinotecan";
        drugNamesReversed[0x68] = "isoflurane";
        drugNamesReversed[0x69] = "isoniazid";
        drugNamesReversed[0x6a] = "isosorbide dinitrate";
        drugNamesReversed[0x6b] = "ivacaftor";
        drugNamesReversed[0x6c] = "lamotrigine";
        drugNamesReversed[0x6d] = "lansoprazole";
        drugNamesReversed[0x6e] = "lapatinib";
        drugNamesReversed[0x6f] = "latanoprost";
        drugNamesReversed[0x70] = "lesinurad";
        drugNamesReversed[0x71] = "leucovorin";
        drugNamesReversed[0x72] = "levofloxacin";
        drugNamesReversed[0x73] = "lidocaine";
        drugNamesReversed[0x74] = "mafenide";
        drugNamesReversed[0x75] = "mefloquine";
        drugNamesReversed[0x76] = "mercaptopurine";
        drugNamesReversed[0x77] = "mesalazine";
        drugNamesReversed[0x78] = "metformin";
        drugNamesReversed[0x79] = "methadone";
        drugNamesReversed[0x7a] = "methazolamide";
        drugNamesReversed[0x7b] = "methimazole";
        drugNamesReversed[0x7c] = "methotrexate";
        drugNamesReversed[0x7d] = "methoxyflurane";
        drugNamesReversed[0x7e] = "methylene blue";
        drugNamesReversed[0x7f] = "methylphenidate";
        drugNamesReversed[0x80] = "metoclopramide";
        drugNamesReversed[0x81] = "metoprolol";
        drugNamesReversed[0x82] = "midazolam";
        drugNamesReversed[0x83] = "mirtazapine";
        drugNamesReversed[0x84] = "modafinil";
        drugNamesReversed[0x85] = "morphine";
        drugNamesReversed[0x86] = "moxifloxacin";
        drugNamesReversed[0x87] = "mycophenolic acid";
        drugNamesReversed[0x88] = "nalidixic acid";
        drugNamesReversed[0x89] = "naloxone";
        drugNamesReversed[0x8a] = "naltrexone";
        drugNamesReversed[0x8b] = "nevirapine";
        drugNamesReversed[0x8c] = "nicotine";
        drugNamesReversed[0x8d] = "nilotinib";
        drugNamesReversed[0x8e] = "nitrofurantoin";
        drugNamesReversed[0x8f] = "norfloxacin";
        drugNamesReversed[0x90] = "nortriptyline";
        drugNamesReversed[0x91] = "olanzapine";
        drugNamesReversed[0x92] = "omeprazole";
        drugNamesReversed[0x93] = "ondansetron";
        drugNamesReversed[0x94] = "oxaliplatin";
        drugNamesReversed[0x95] = "oxazepam";
        drugNamesReversed[0x96] = "oxcarbazepine";
        drugNamesReversed[0x97] = "oxycodone";
        drugNamesReversed[0x98] = "palonosetron";
        drugNamesReversed[0x99] = "pantoprazole";
        drugNamesReversed[0x9a] = "paroxetine";
        drugNamesReversed[0x9b] = "pazopanib";
        drugNamesReversed[0x9c] = "peginterferon alfa-2a";
        drugNamesReversed[0x9d] = "peginterferon alfa-2b";
        drugNamesReversed[0x9e] = "pegloticase";
        drugNamesReversed[0x9f] = "perphenazine";
        drugNamesReversed[0xa0] = "phenazopyridine";
        drugNamesReversed[0xa1] = "phenprocoumon";
        drugNamesReversed[0xa2] = "phenytoin";
        drugNamesReversed[0xa3] = "pimozide";
        drugNamesReversed[0xa4] = "platinum";
        drugNamesReversed[0xa5] = "Platinum compounds";
        drugNamesReversed[0xa6] = "pravastatin";
        drugNamesReversed[0xa7] = "primaquine";
        drugNamesReversed[0xa8] = "probenecid";
        drugNamesReversed[0xa9] = "propafenone";
        drugNamesReversed[0xaa] = "propranolol";
        drugNamesReversed[0xab] = "propylthiouracil";
        drugNamesReversed[0xac] = "protriptyline";
        drugNamesReversed[0xad] = "quinidine";
        drugNamesReversed[0xae] = "quinine";
        drugNamesReversed[0xaf] = "rabeprazole";
        drugNamesReversed[0xb0] = "radiotherapy";
        drugNamesReversed[0xb1] = "rasburicase";
        drugNamesReversed[0xb2] = "ribavirin";
        drugNamesReversed[0xb3] = "risperidone";
        drugNamesReversed[0xb4] = "rituximab";
        drugNamesReversed[0xb5] = "rosiglitazone";
        drugNamesReversed[0xb6] = "rosuvastatin";
        drugNamesReversed[0xb7] = "salbutamol";
        drugNamesReversed[0xb8] = "salmeterol";
        drugNamesReversed[0xb9] = "Selective serotonin reuptake inhibitors";
        drugNamesReversed[0xba] = "sertraline";
        drugNamesReversed[0xbb] = "sevoflurane";
        drugNamesReversed[0xbc] = "sildenafil";
        drugNamesReversed[0xbd] = "simvastatin";
        drugNamesReversed[0xbe] = "sirolimus";
        drugNamesReversed[0xbf] = "sodium nitrite";
        drugNamesReversed[0xc0] = "spironolactone";
        drugNamesReversed[0xc1] = "succinylcholine";
        drugNamesReversed[0xc2] = "sulfacetamide";
        drugNamesReversed[0xc3] = "sulfadiazine";
        drugNamesReversed[0xc4] = "sulfamethoxazole / trimethoprim";
        drugNamesReversed[0xc5] = "sulfasalazine";
        drugNamesReversed[0xc6] = "sulfisoxazole";
        drugNamesReversed[0xc7] = "sulfonamides";
        drugNamesReversed[0xc8] = "sunitinib";
        drugNamesReversed[0xc9] = "tacrolimus";
        drugNamesReversed[0xca] = "tamoxifen";
        drugNamesReversed[0xcb] = "tamsulosin";
        drugNamesReversed[0xcc] = "tegafur";
        drugNamesReversed[0xcd] = "tenofovir";
        drugNamesReversed[0xce] = "terbinafine";
        drugNamesReversed[0xcf] = "tetrabenazine";
        drugNamesReversed[0xd0] = "thioguanine";
        drugNamesReversed[0xd1] = "thioridazine";
        drugNamesReversed[0xd2] = "timolol";
        drugNamesReversed[0xd3] = "tiotropium";
        drugNamesReversed[0xd4] = "tolterodine";
        drugNamesReversed[0xd5] = "tramadol";
        drugNamesReversed[0xd6] = "triamcinolone";
        drugNamesReversed[0xd7] = "trimipramine";
        drugNamesReversed[0xd8] = "tropisetron";
        drugNamesReversed[0xd9] = "Tumor necrosis factor alpha (TNF-alpha) inhibitors";
        drugNamesReversed[0xda] = "valproic acid";
        drugNamesReversed[0xdb] = "velaglucerase alfa";
        drugNamesReversed[0xdc] = "venlafaxine";
        drugNamesReversed[0xdd] = "vitamin c";
        drugNamesReversed[0xde] = "voriconazole";
        drugNamesReversed[0xdf] = "vortioxetine";
        drugNamesReversed[0xe0] = "warfarin";
        drugNamesReversed[0xe1] = "zuclopenthixol";

        for (uint8 i = 0x00; i < 226; i++) {
            string memory drugName = drugNamesReversed[i];
            drugNames[drugName] = i;
        } 
    }

    function initializeOutcomes() internal {
        outcomesReversed[0x00] = "IMPROVED";
        outcomesReversed[0x01] = "UNCHANGED";
        outcomesReversed[0x02] = "DETERIORATED";

        for (uint8 i = 0x00; i < 3; i++) {
            string memory outcome = outcomesReversed[i];
            outcomes[outcome] = i;
        } 
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
