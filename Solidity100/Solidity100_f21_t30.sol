// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 1. 3의 배수만 들어갈 수 있는 array를 구현하세요.
contract Sol21 {
    uint[] public numbers;

    function num3(uint number) public {
        require(number %3 == 0, "Number is not a multiple of 3");
        numbers.push(number);
    }
}

// 2. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
//     예) 2,5 input → 5-2=3(output)
contract Sol22 {
    
    function subtract1(uint a, uint b) public pure returns(uint) {
        if (a > b) {
            return a - b;
        } else{
            return b-a;
        }
    } 
}


// 3. 5의 배수라면 “A”를, 나머지가 1이면 “B”를, 나머지가 2면 “C”를, 나머지가 3이면 “D”, 
//    나미저가 4면 “E”를 반환하는 함수를 구현하세요.
contract Sol23 {
    function sol23(uint a) public pure returns(string memory) {
        uint b = a % 5;

        if (b == 0) {
            return "A";
        } else if (b ==1) {
            return "B";
        } else if (b ==2) {
            return "C";
        } else if (b ==3) {
            return "D";
        } else {
            return "E";
        }
    }
}


// 4. string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
contract Sol24 {
    function isAlice(string memory s) public pure returns(bool) {
        return keccak256(abi.encodePacked(s)) == keccak256(abi.encodePacked("Alice"));
    }
}


// 5. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
contract Sol25 {

    uint[] public A;

    function array1(uint n) public {

        for (uint i=n; i > 0; i--) {
            A.push(i);
        }
    }
}


// 6. 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 
//    숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
contract Sol26 {
    uint[] public oddArray;
    uint[] public evenArray;

    function addArray(uint a) public {
        if (a%2 == 0) {
            evenArray.push(a);
        } else {
            oddArray.push(a);
        }
    }
}

// 7. string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 
//    해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
contract Sol27 {
    mapping(string => bytes32) public data;

    function setData(string memory key, bytes32 value) public {
        data[key] = value;
    }

    function getData(string memory key) public view returns(bytes32) {
        require(data[key] != bytes32(0), "Key does not exist");
        return data[key];
    }
}

// 8. ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
contract Sol28 {
    function hashIDPW(string memory id, string memory pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(id, pw));
    }
}

// 9. 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
contract Sol29 {
    uint public a;
    string public b;

    constructo
    
}



// 10. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
// (sorting 코드 응용 → 약간 까다로움)
//     예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]

contract Sol30 {

    uint[] public numbers;

    function arrangeNumber(uint[] memory a) public {
        delete numbers;

        for (uint i =0; i < a.length; i++) {
            numbers.push(a[i]);
        }
        
        sortDescending();
    }

    function sortDescending() internal {
        uint length = numbers.length;

        for (uint i = 0; i < length; i++) {
            for (uint j = i+1; j < length; j++) {
                if (numbers[i] < numbers[j]) {
                    uint temp = numbers[i];
                    numbers[i] = numbers[j];
                    numbers[j] = temp;
                }
            }
        }
    }

    function test() public view returns(uint[] memory) {
        return numbers;
    }

}














