pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "./Util.sol";

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

    function detectKeyWildcards(
        uint24 encoded
    ) public pure returns (bool allGenes, bool allVariants, bool allDrugs) {
        allGenes = uint8(encoded & 0x0000007F) == 0x00;
        allVariants = uint8((encoded & 0x00003F80) >> 7) == 0x64;
        allDrugs = uint8((encoded & 0x003FC000) >> 14) == 0xe3;
    }

    function initializeGeneNames() internal {
        geneNamesReversed[0x01] = "ABCB1";
        geneNamesReversed[0x02] = "ABCC4";
        geneNamesReversed[0x03] = "ABCG2";
        geneNamesReversed[0x04] = "ABL2";
        geneNamesReversed[0x05] = "ACE";
        geneNamesReversed[0x06] = "ADD1";
        geneNamesReversed[0x07] = "ADORA2A";
        geneNamesReversed[0x08] = "ADRB2";
        geneNamesReversed[0x09] = "ANKK1";
        geneNamesReversed[0x0a] = "APOE";
        geneNamesReversed[0x0b] = "ASL";
        geneNamesReversed[0x0c] = "ASS1";
        geneNamesReversed[0x0d] = "ATIC";
        geneNamesReversed[0x0e] = "BCHE";
        geneNamesReversed[0x0f] = "C11orf65";
        geneNamesReversed[0x10] = "C8orf34";
        geneNamesReversed[0x11] = "CACNA1S";
        geneNamesReversed[0x12] = "CALU";
        geneNamesReversed[0x13] = "CBR3";
        geneNamesReversed[0x14] = "CCHCR1";
        geneNamesReversed[0x15] = "CES1";
        geneNamesReversed[0x16] = "CETP";
        geneNamesReversed[0x17] = "CFTR";
        geneNamesReversed[0x18] = "CHRNA3";
        geneNamesReversed[0x19] = "COL22A1";
        geneNamesReversed[0x1a] = "COMT";
        geneNamesReversed[0x1b] = "COQ2";
        geneNamesReversed[0x1c] = "CPS1";
        geneNamesReversed[0x1d] = "CRHR1";
        geneNamesReversed[0x1e] = "CRHR2";
        geneNamesReversed[0x1f] = "CYB5R1";
        geneNamesReversed[0x20] = "CYB5R2";
        geneNamesReversed[0x21] = "CYB5R3";
        geneNamesReversed[0x22] = "CYB5R4";
        geneNamesReversed[0x23] = "CYP2A7P1";
        geneNamesReversed[0x24] = "CYP2B6";
        geneNamesReversed[0x25] = "CYP2C19";
        geneNamesReversed[0x26] = "CYP2C8";
        geneNamesReversed[0x27] = "CYP2C9";
        geneNamesReversed[0x28] = "CYP2D6";
        geneNamesReversed[0x29] = "CYP3A4";
        geneNamesReversed[0x2a] = "CYP3A5";
        geneNamesReversed[0x2b] = "CYP4F2";
        geneNamesReversed[0x2c] = "DPYD";
        geneNamesReversed[0x2d] = "DRD2";
        geneNamesReversed[0x2e] = "DYNC2H1";
        geneNamesReversed[0x2f] = "EGF";
        geneNamesReversed[0x30] = "EPHX1";
        geneNamesReversed[0x31] = "ERCC1";
        geneNamesReversed[0x32] = "F5";
        geneNamesReversed[0x33] = "FCGR3A";
        geneNamesReversed[0x34] = "FDPS";
        geneNamesReversed[0x35] = "FKBP5";
        geneNamesReversed[0x36] = "FLOT1";
        geneNamesReversed[0x37] = "G6PD";
        geneNamesReversed[0x38] = "GBA";
        geneNamesReversed[0x39] = "GGCX";
        geneNamesReversed[0x3a] = "GNB3";
        geneNamesReversed[0x3b] = "GP1BA";
        geneNamesReversed[0x3c] = "GRIK4";
        geneNamesReversed[0x3d] = "GSTM1";
        geneNamesReversed[0x3e] = "GSTP1";
        geneNamesReversed[0x3f] = "HAS3";
        geneNamesReversed[0x40] = "HLA-A";
        geneNamesReversed[0x41] = "HLA-B";
        geneNamesReversed[0x42] = "HLA-C";
        geneNamesReversed[0x43] = "HLA-DPB1";
        geneNamesReversed[0x44] = "HLA-DQA1";
        geneNamesReversed[0x45] = "HLA-DRB1";
        geneNamesReversed[0x46] = "HMGCR";
        geneNamesReversed[0x47] = "HPRT1";
        geneNamesReversed[0x48] = "HTR1A";
        geneNamesReversed[0x49] = "HTR2A";
        geneNamesReversed[0x4a] = "HTR2C";
        geneNamesReversed[0x4b] = "IFNL3";
        geneNamesReversed[0x4c] = "IFNL4";
        geneNamesReversed[0x4d] = "ITPA";
        geneNamesReversed[0x4e] = "KCNIP4";
        geneNamesReversed[0x4f] = "KIF6";
        geneNamesReversed[0x50] = "LDLR";
        geneNamesReversed[0x51] = "LPA";
        geneNamesReversed[0x52] = "LTC4S";
        geneNamesReversed[0x53] = "MC4R";
        geneNamesReversed[0x54] = "MT-RNR1";
        geneNamesReversed[0x55] = "MTHFR";
        geneNamesReversed[0x56] = "MTRR";
        geneNamesReversed[0x57] = "NAGS";
        geneNamesReversed[0x58] = "NAT1";
        geneNamesReversed[0x59] = "NAT2";
        geneNamesReversed[0x5a] = "NEDD4L";
        geneNamesReversed[0x5b] = "NQO1";
        geneNamesReversed[0x5c] = "NT5C2";
        geneNamesReversed[0x5d] = "NUDT15";
        geneNamesReversed[0x5e] = "OPRM1";
        geneNamesReversed[0x5f] = "OTC";
        geneNamesReversed[0x60] = "POLG";
        geneNamesReversed[0x61] = "PRKCA";
        geneNamesReversed[0x62] = "PROC";
        geneNamesReversed[0x63] = "PROS1";
        geneNamesReversed[0x64] = "PTGFR";
        geneNamesReversed[0x65] = "PTGS1";
        geneNamesReversed[0x66] = "RYR1";
        geneNamesReversed[0x67] = "SCN1A";
        geneNamesReversed[0x68] = "SEMA3C";
        geneNamesReversed[0x69] = "SERPINC1";
        geneNamesReversed[0x6a] = "SLC28A3";
        geneNamesReversed[0x6b] = "SLC47A2";
        geneNamesReversed[0x6c] = "SLC6A4";
        geneNamesReversed[0x6d] = "SLCO1B1";
        geneNamesReversed[0x6e] = "SOD2";
        geneNamesReversed[0x6f] = "TANC1";
        geneNamesReversed[0x70] = "TCF7L2";
        geneNamesReversed[0x71] = "TMEM43";
        geneNamesReversed[0x72] = "TNF";
        geneNamesReversed[0x73] = "TP53";
        geneNamesReversed[0x74] = "TPMT";
        geneNamesReversed[0x75] = "TXNRD2";
        geneNamesReversed[0x76] = "TYMS";
        geneNamesReversed[0x77] = "UGT1A1";
        geneNamesReversed[0x78] = "UGT1A4";
        geneNamesReversed[0x79] = "UGT2B15";
        geneNamesReversed[0x7a] = "UMPS";
        geneNamesReversed[0x7b] = "VDR";
        geneNamesReversed[0x7c] = "VKORC1";
        geneNamesReversed[0x7d] = "XPC";
        geneNamesReversed[0x7e] = "XRCC1";
        geneNamesReversed[0x7f] = "YEATS4";
        geneNamesReversed[0x80] = "*";

        for (uint8 i = 0x01; i < 129; i++) {
            string memory geneName = geneNamesReversed[i];
            geneNames[geneName] = i;
        } 
    }

    function initializeDrugNames() internal {
        drugNamesReversed[0x01] = "abacavir";
        drugNamesReversed[0x02] = "Ace Inhibitors";
        drugNamesReversed[0x03] = "acenocoumarol";
        drugNamesReversed[0x04] = "alfentanil";
        drugNamesReversed[0x05] = "Alkylating Agents";
        drugNamesReversed[0x06] = "allopurinol";
        drugNamesReversed[0x07] = "aminoglycoside antibacterials";
        drugNamesReversed[0x08] = "amitriptyline";
        drugNamesReversed[0x09] = "anthracyclines and related substances";
        drugNamesReversed[0x0a] = "antidepressants";
        drugNamesReversed[0x0b] = "antipsychotics";
        drugNamesReversed[0x0c] = "aripiprazole";
        drugNamesReversed[0x0d] = "aspirin";
        drugNamesReversed[0x0e] = "ataluren";
        drugNamesReversed[0x0f] = "atazanavir";
        drugNamesReversed[0x10] = "atomoxetine";
        drugNamesReversed[0x11] = "atorvastatin";
        drugNamesReversed[0x12] = "azathioprine";
        drugNamesReversed[0x13] = "belinostat";
        drugNamesReversed[0x14] = "Bisphosphonates";
        drugNamesReversed[0x15] = "brexpiprazole";
        drugNamesReversed[0x16] = "brivaracetam";
        drugNamesReversed[0x17] = "budesonide";
        drugNamesReversed[0x18] = "bupropion";
        drugNamesReversed[0x19] = "caffeine";
        drugNamesReversed[0x1a] = "capecitabine";
        drugNamesReversed[0x1b] = "captopril";
        drugNamesReversed[0x1c] = "carbamazepine";
        drugNamesReversed[0x1d] = "carbimazole";
        drugNamesReversed[0x1e] = "carboplatin";
        drugNamesReversed[0x1f] = "carglumic acid";
        drugNamesReversed[0x20] = "carisoprodol";
        drugNamesReversed[0x21] = "carvedilol";
        drugNamesReversed[0x22] = "celecoxib";
        drugNamesReversed[0x23] = "cerivastatin";
        drugNamesReversed[0x24] = "cetuximab";
        drugNamesReversed[0x25] = "cevimeline";
        drugNamesReversed[0x26] = "chloramphenicol";
        drugNamesReversed[0x27] = "chloroquine";
        drugNamesReversed[0x28] = "chlorpropamide";
        drugNamesReversed[0x29] = "ciprofloxacin";
        drugNamesReversed[0x2a] = "cisplatin";
        drugNamesReversed[0x2b] = "citalopram";
        drugNamesReversed[0x2c] = "clobazam";
        drugNamesReversed[0x2d] = "clomipramine";
        drugNamesReversed[0x2e] = "clopidogrel";
        drugNamesReversed[0x2f] = "clozapine";
        drugNamesReversed[0x30] = "codeine";
        drugNamesReversed[0x31] = "cyclophosphamide";
        drugNamesReversed[0x32] = "cyclosporine";
        drugNamesReversed[0x33] = "dabrafenib";
        drugNamesReversed[0x34] = "dapsone";
        drugNamesReversed[0x35] = "darifenacin";
        drugNamesReversed[0x36] = "desflurane";
        drugNamesReversed[0x37] = "desipramine";
        drugNamesReversed[0x38] = "dexlansoprazole";
        drugNamesReversed[0x39] = "dextromethorphan";
        drugNamesReversed[0x3a] = "diazepam";
        drugNamesReversed[0x3b] = "diclofenac";
        drugNamesReversed[0x3c] = "digoxin";
        drugNamesReversed[0x3d] = "dimercaprol";
        drugNamesReversed[0x3e] = "divalproex sodium";
        drugNamesReversed[0x3f] = "dolasetron";
        drugNamesReversed[0x40] = "dolutegravir";
        drugNamesReversed[0x41] = "donepezil";
        drugNamesReversed[0x42] = "doxepin";
        drugNamesReversed[0x43] = "duloxetine";
        drugNamesReversed[0x44] = "efavirenz";
        drugNamesReversed[0x45] = "eliglustat";
        drugNamesReversed[0x46] = "eltrombopag";
        drugNamesReversed[0x47] = "enflurane";
        drugNamesReversed[0x48] = "epirubicin";
        drugNamesReversed[0x49] = "erythromycin";
        drugNamesReversed[0x4a] = "escitalopram";
        drugNamesReversed[0x4b] = "esomeprazole";
        drugNamesReversed[0x4c] = "ethanol";
        drugNamesReversed[0x4d] = "etoposide";
        drugNamesReversed[0x4e] = "fentanyl";
        drugNamesReversed[0x4f] = "fesoterodine";
        drugNamesReversed[0x50] = "flecainide";
        drugNamesReversed[0x51] = "flibanserin";
        drugNamesReversed[0x52] = "fluorouracil";
        drugNamesReversed[0x53] = "fluoxetine";
        drugNamesReversed[0x54] = "flurbiprofen";
        drugNamesReversed[0x55] = "fluticasone propionate";
        drugNamesReversed[0x56] = "fluticasone/salmeterol";
        drugNamesReversed[0x57] = "fluvoxamine";
        drugNamesReversed[0x58] = "furosemide";
        drugNamesReversed[0x59] = "galantamine";
        drugNamesReversed[0x5a] = "gemcitabine";
        drugNamesReversed[0x5b] = "glibenclamide";
        drugNamesReversed[0x5c] = "glimepiride";
        drugNamesReversed[0x5d] = "glipizide";
        drugNamesReversed[0x5e] = "haloperidol";
        drugNamesReversed[0x5f] = "halothane";
        drugNamesReversed[0x60] = "hmg coa reductase inhibitors";
        drugNamesReversed[0x61] = "hormonal contraceptives for systemic use";
        drugNamesReversed[0x62] = "hydralazine";
        drugNamesReversed[0x63] = "hydrochlorothiazide";
        drugNamesReversed[0x64] = "hydroxychloroquine";
        drugNamesReversed[0x65] = "iloperidone";
        drugNamesReversed[0x66] = "imipramine";
        drugNamesReversed[0x67] = "interferon alfa-2b";
        drugNamesReversed[0x68] = "irinotecan";
        drugNamesReversed[0x69] = "isoflurane";
        drugNamesReversed[0x6a] = "isoniazid";
        drugNamesReversed[0x6b] = "isosorbide dinitrate";
        drugNamesReversed[0x6c] = "ivacaftor";
        drugNamesReversed[0x6d] = "lamotrigine";
        drugNamesReversed[0x6e] = "lansoprazole";
        drugNamesReversed[0x6f] = "lapatinib";
        drugNamesReversed[0x70] = "latanoprost";
        drugNamesReversed[0x71] = "lesinurad";
        drugNamesReversed[0x72] = "leucovorin";
        drugNamesReversed[0x73] = "levofloxacin";
        drugNamesReversed[0x74] = "lidocaine";
        drugNamesReversed[0x75] = "mafenide";
        drugNamesReversed[0x76] = "mefloquine";
        drugNamesReversed[0x77] = "mercaptopurine";
        drugNamesReversed[0x78] = "mesalazine";
        drugNamesReversed[0x79] = "metformin";
        drugNamesReversed[0x7a] = "methadone";
        drugNamesReversed[0x7b] = "methazolamide";
        drugNamesReversed[0x7c] = "methimazole";
        drugNamesReversed[0x7d] = "methotrexate";
        drugNamesReversed[0x7e] = "methoxyflurane";
        drugNamesReversed[0x7f] = "methylene blue";
        drugNamesReversed[0x80] = "methylphenidate";
        drugNamesReversed[0x81] = "metoclopramide";
        drugNamesReversed[0x82] = "metoprolol";
        drugNamesReversed[0x83] = "midazolam";
        drugNamesReversed[0x84] = "mirtazapine";
        drugNamesReversed[0x85] = "modafinil";
        drugNamesReversed[0x86] = "morphine";
        drugNamesReversed[0x87] = "moxifloxacin";
        drugNamesReversed[0x88] = "mycophenolic acid";
        drugNamesReversed[0x89] = "nalidixic acid";
        drugNamesReversed[0x8a] = "naloxone";
        drugNamesReversed[0x8b] = "naltrexone";
        drugNamesReversed[0x8c] = "nevirapine";
        drugNamesReversed[0x8d] = "nicotine";
        drugNamesReversed[0x8e] = "nilotinib";
        drugNamesReversed[0x8f] = "nitrofurantoin";
        drugNamesReversed[0x90] = "norfloxacin";
        drugNamesReversed[0x91] = "nortriptyline";
        drugNamesReversed[0x92] = "olanzapine";
        drugNamesReversed[0x93] = "omeprazole";
        drugNamesReversed[0x94] = "ondansetron";
        drugNamesReversed[0x95] = "oxaliplatin";
        drugNamesReversed[0x96] = "oxazepam";
        drugNamesReversed[0x97] = "oxcarbazepine";
        drugNamesReversed[0x98] = "oxycodone";
        drugNamesReversed[0x99] = "palonosetron";
        drugNamesReversed[0x9a] = "pantoprazole";
        drugNamesReversed[0x9b] = "paroxetine";
        drugNamesReversed[0x9c] = "pazopanib";
        drugNamesReversed[0x9d] = "peginterferon alfa-2a";
        drugNamesReversed[0x9e] = "peginterferon alfa-2b";
        drugNamesReversed[0x9f] = "pegloticase";
        drugNamesReversed[0xa0] = "perphenazine";
        drugNamesReversed[0xa1] = "phenazopyridine";
        drugNamesReversed[0xa2] = "phenprocoumon";
        drugNamesReversed[0xa3] = "phenytoin";
        drugNamesReversed[0xa4] = "pimozide";
        drugNamesReversed[0xa5] = "platinum";
        drugNamesReversed[0xa6] = "Platinum compounds";
        drugNamesReversed[0xa7] = "pravastatin";
        drugNamesReversed[0xa8] = "primaquine";
        drugNamesReversed[0xa9] = "probenecid";
        drugNamesReversed[0xaa] = "propafenone";
        drugNamesReversed[0xab] = "propranolol";
        drugNamesReversed[0xac] = "propylthiouracil";
        drugNamesReversed[0xad] = "protriptyline";
        drugNamesReversed[0xae] = "quinidine";
        drugNamesReversed[0xaf] = "quinine";
        drugNamesReversed[0xb0] = "rabeprazole";
        drugNamesReversed[0xb1] = "radiotherapy";
        drugNamesReversed[0xb2] = "rasburicase";
        drugNamesReversed[0xb3] = "ribavirin";
        drugNamesReversed[0xb4] = "risperidone";
        drugNamesReversed[0xb5] = "rituximab";
        drugNamesReversed[0xb6] = "rosiglitazone";
        drugNamesReversed[0xb7] = "rosuvastatin";
        drugNamesReversed[0xb8] = "salbutamol";
        drugNamesReversed[0xb9] = "salmeterol";
        drugNamesReversed[0xba] = "Selective serotonin reuptake inhibitors";
        drugNamesReversed[0xbb] = "sertraline";
        drugNamesReversed[0xbc] = "sevoflurane";
        drugNamesReversed[0xbd] = "sildenafil";
        drugNamesReversed[0xbe] = "simvastatin";
        drugNamesReversed[0xbf] = "sirolimus";
        drugNamesReversed[0xc0] = "sodium nitrite";
        drugNamesReversed[0xc1] = "spironolactone";
        drugNamesReversed[0xc2] = "succinylcholine";
        drugNamesReversed[0xc3] = "sulfacetamide";
        drugNamesReversed[0xc4] = "sulfadiazine";
        drugNamesReversed[0xc5] = "sulfamethoxazole / trimethoprim";
        drugNamesReversed[0xc6] = "sulfasalazine";
        drugNamesReversed[0xc7] = "sulfisoxazole";
        drugNamesReversed[0xc8] = "sulfonamides";
        drugNamesReversed[0xc9] = "sunitinib";
        drugNamesReversed[0xca] = "tacrolimus";
        drugNamesReversed[0xcb] = "tamoxifen";
        drugNamesReversed[0xcc] = "tamsulosin";
        drugNamesReversed[0xcd] = "tegafur";
        drugNamesReversed[0xce] = "tenofovir";
        drugNamesReversed[0xcf] = "terbinafine";
        drugNamesReversed[0xd0] = "tetrabenazine";
        drugNamesReversed[0xd1] = "thioguanine";
        drugNamesReversed[0xd2] = "thioridazine";
        drugNamesReversed[0xd3] = "timolol";
        drugNamesReversed[0xd4] = "tiotropium";
        drugNamesReversed[0xd5] = "tolterodine";
        drugNamesReversed[0xd6] = "tramadol";
        drugNamesReversed[0xd7] = "triamcinolone";
        drugNamesReversed[0xd8] = "trimipramine";
        drugNamesReversed[0xd9] = "tropisetron";
        drugNamesReversed[0xda] = "Tumor necrosis factor alpha (TNF-alpha) inhibitors";
        drugNamesReversed[0xdb] = "valproic acid";
        drugNamesReversed[0xdc] = "velaglucerase alfa";
        drugNamesReversed[0xdd] = "venlafaxine";
        drugNamesReversed[0xde] = "vitamin c";
        drugNamesReversed[0xdf] = "voriconazole";
        drugNamesReversed[0xe0] = "vortioxetine";
        drugNamesReversed[0xe1] = "warfarin";
        drugNamesReversed[0xe2] = "zuclopenthixol";
        drugNamesReversed[0xe3] = "*";
        
        for (uint8 i = 0x01; i < 229; i++) {
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
    ) public view returns (uint24 encoded) {
        encoded = 0x00000000;

        // 7 bit for gene name
        uint8 gn = geneNames[geneName];
        require(gn > 0x00 && gn <= 0x80, "gene name is not valid");

        // set to zero, because of 7 bit overflow at 0x80
        if (gn == 0x80)
            gn = 0;

        // 7 bit for variant number
        uint8 vn;
        if (Util.strcmp(variantNumber, "*"))
            vn = 0x64;
        else
            vn = uint8(Util.stoi(variantNumber) % 256);

        require(vn > 0x00 && vn <= 0x64, "variant number is not valid");

        // 8 bit for drug name
        uint8 dn = drugNames[drug];
        require(dn > 0x00 && dn <= 0xe3, "drug name is not valid");

        encoded |= uint24(gn);
        encoded |= uint24(vn) << 7;
        encoded |= uint24(dn) << 14;
    }

    function decodeKey(
        uint24 encoded
    ) public view returns (string memory geneName, string memory variantNumber, string memory drugName) {
        uint8 gn = uint8(encoded & 0x0000007F);
        uint8 vn = uint8((encoded & 0x00003F80) >> 7);
        uint8 dn = uint8((encoded & 0x003FC000) >> 14);

        geneName = geneNamesReversed[gn];
        variantNumber = Util.itos(vn);
        drugName = drugNamesReversed[dn];
    }

}