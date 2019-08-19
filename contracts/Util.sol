pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;


library Util {

    /**
        @notice Convert string to uint256
        @dev https://ethereum.stackexchange.com/a/18035/4376
     */
    function stoi(string memory s) public pure returns (uint256 result) {
        result = 0;

        bytes memory b = bytes(s);
        uint256 i;
        for (i = 0; i < b.length; i++) {
            uint8 c = uint8(b[i]);
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
    }

    /**
        @notice Convert string to uint256
        @dev https://ethereum.stackexchange.com/a/40977/4376
     */
    function itos(uint256 n) public pure returns (string memory) {
        if (n == 0) {
            return "0";
        }

        uint256 j = n;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }

        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (n != 0) {
            bstr[k--] = byte(uint8(48 + n % 10));
            n /= 10;
        }

        return string(bstr);
    }

    /**
        @notice Test if bit is set
     */
    function testBit(uint256 n, uint8 pos) public pure returns (bool) {
        return (n & (uint256(1) << pos)) > 0;
    }
}