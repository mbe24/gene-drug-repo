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

    /**
        @notice Test if bit is set
        @dev Brian Kernighan's algorithm
     */
    function countSetBits(uint256 n) public pure returns (uint256 count) {
        count = 0;

        uint256 _n = n;
        while (_n != 0) {
            _n = _n & (_n - 1);
            count++;
        }
    }

    /**
        @notice Count digits of a given number
     */
    function digits(uint256 number) internal pure returns (uint8 d) {
        while (number != 0) {
            number /= 10;
            d++;
        }
    }

    /**
        @notice Compute fractions with 6 decimals in percent
     */
    function fraction(uint256 numerator, uint256 denominator) public pure returns (string memory) {
        uint256 decimals = 6;
        uint256 percentFactor = 10**(decimals + 2);

        uint256 quotient = (percentFactor * numerator) / denominator;
        
        uint256 realQuotient = (100 * quotient) / percentFactor;
        uint256 realRemainder = quotient % (percentFactor / 100);

        // round up number
        if ((quotient % (percentFactor / 10)) % 10 >= 5)
            realRemainder++;

        string memory remainderString;
        uint8 fillUp = 6 - digits(realRemainder);
        if (fillUp > 0) {
            if (realRemainder == 0)
                fillUp--;

            string memory pad = new string(fillUp);
            bytes memory bytePad = bytes(pad);
            for (uint8 i = 0; i < fillUp; i++)
                bytePad[i] = "0";
            
            remainderString = strcat(itos(realRemainder), string(bytePad));
        } else
            remainderString = itos(realRemainder);
        
        return strcat(strcat(itos(realQuotient), "."), remainderString);
    }

    /**
        @notice Concatenate two strings
     */
    function strcat(string memory first, string memory second) public pure  returns (string memory) {
        bytes memory byteFirst = bytes(first);
        bytes memory byteSecond = bytes(second);

        string memory concatenated = new string(byteFirst.length + byteSecond.length);
        bytes memory byteConcatenated = bytes(concatenated);

        uint k = 0;
        for (uint i = 0; i < byteFirst.length; i++) byteConcatenated[k++] = byteFirst[i];
        for (uint i = 0; i < byteSecond.length; i++) byteConcatenated[k++] = byteSecond[i];

        return string(byteConcatenated);
    }

    /**
        @notice Compare two strings
     */
    function strcmp (string memory a, string memory b) public pure  returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

}