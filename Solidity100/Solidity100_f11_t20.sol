// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


// 1. uint 형이 들어가는 array를 선언하고, 짝수만 들어갈 수 있게 걸러주는 함수를 구현하세요.

contract Sol11 {
    // uint 배열 선언
    uint[] public numbers;

    // 짝수만 들어갈 수 있게 걸러주는 함수
    function addEvenNumber(uint number) public {
        require(number % 2 == 0, "Only even numbers are allowed"); 
        numbers.push(number); 
    }

}


// 2. 숫자 3개를 더해주는 함수, 곱해주는 함수 그리고 순서에 따라서 a*b+c를 반환해주는 함수 3개를 각각 구현하세요.
contract Sol12 {
    function add(uint a, uint b, uint c) public pure returns(uint) {
        return a+b+c;
    }
    
    function mul(uint a, uint b, uint c) public pure returns(uint) {
        return a*b*c;
    }
    
    function mulNAdd(uint a, uint b, uint c) public pure returns(uint) {
        return a*b+c;
    }
}


// 3. 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
contract Sol13 {
    function dividedBy3(uint num) public pure returns(string memory) {
        if(num % 3 == 0) {
            return "A";
        } else if (num % 3 == 1) {
            return "B";   
        } else {
            return "C";
        }
    }
}


// 4. 학번, 이름, 듣는 수험 목록을 포함한 학생 구조체를 선언하고 학생들을 관리할 수 있는 array를 구현하세요. 
//    array에 학생을 넣는 함수도 구현하는데 학생들의 학번은 1번부터 순서대로 2,3,4,5 
//    자동 순차적으로 증가하는 기능도 같이 구현하세요.
contract Sol14 {
    struct Student {
        uint number;
        string name;
        string[] subjects;
    }

    Student[] public students;

    function addStudent(string memory _name, string[] memory _subjects) public {
        Student memory _s = Student({
            number: students.length+1,
            name: _name,
            subjects: _subjects
        });
        students.push(_s);
    }
}



// 5. 배열 A를 선언하고 해당 배열에 0부터 n까지 자동으로 넣는 함수를 구현하세요.
contract Sol15 {
    uint[] public A;

    function setNumbers(uint n) public {
        for(uint i = 0 ; i <= n ; i++){
            A.push(i);
        }
    }
}


// 6. 숫자들만 들어갈 수 있는 array를 선언하고 해당 array에 숫자를 넣는 함수도 구현하세요. 
//   또 array안의 모든 숫자의 합을 더하는 함수를 구현하세요.
contract Sol16 {
    uint[] public numbers;

    function addNumber(uint num) public {
        numbers.push(num);
    }

    function getSum() public view returns(uint) {
        uint len = numbers.length;
        uint sum;
        
        for(uint i = 0 ; i < len ; i++){
            sum += numbers[i];
        }
        return sum;
    }
}


// 7. string을 input으로 받는 함수를 구현하세요. 
//    이 함수는 true 혹은 false를 반환하는데 Bob이라는 이름이 들어왔을 때에만 true를 반환합니다. 
contract Sol17 {
    function isBob(string memory name) public pure returns(bool) {
        if(keccak256(abi.encodePacked("Bob")) == keccak256(abi.encodePacked(name))) {
            return true;
        } else {
            return false;
        }
    }
}


// 8. 이름을 검색하면 생일이 나올 수 있는 자료구조를 구현하세요. 
//    (매핑) 해당 자료구조에 정보를 넣는 함수, 정보를 볼 수 있는 함수도 구현하세요.
contract Sol18 {
    mapping(string => string) public births;
    
    function addBirth(string memory name, string memory birth) public {
        births[name] = birth;
    }

    function getBirth(string memory name) public view returns(string memory) {
        return births[name];
    }
}


// 9. 숫자를 넣으면 2배를 반환해주는 함수를 구현하세요. 
//    단 숫자는 1000이상 넘으면 함수를 실행시키지 못하게 합니다.
contract Sol19 {
    function double(uint num) public pure returns(uint) {
        require(num<1000, "no more than 1000");
        return num*2;
    }
}


// 10. 숫자만 들어가는 배열을 선언하고 숫자를 넣는 함수를 구현하세요. 
//     15개의 숫자가 들어가면 3의 배수 위치에 있는 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현하세요. 
//     (for 문 응용 → 약간 까다로움)
contract Sol20 {
    uint[] public numbers;

    function setNumber(uint _num) public {
        for(uint i = 0 ; i < _num ; i++){
            if( (i+1) % 3 == 0 && _num == 15){
                delete numbers[i];
            } else {
                numbers[i] = i+1;
            }
        }
    }
}
