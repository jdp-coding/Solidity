// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
로또 프로그램을 만드려고 합니다. 
숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 맞으면 0.75이더, 
4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. (순서는 상관없음)

참가 금액은 0.05이더입니다.

당첨번호 : 7,3,2,5,B,C
예시 1  : 8,2,4,7,D,A -> 맞은 번호 : 2     (1개)
예시 2  : 9,1,4,2,F,B -> 맞은 번호 : 2,B   (2개)
예시 3  : 2,3,4,6,A,B -> 맞은 번호 : 2,3,B (3개)
*/

contract TEST_20250107 {

    uint8[4] public winningNumbers;
    bytes1[2] public winningLetters;

    uint public constant ENTRY_FEE = 0.05 ether;
    uint public constant PRIZE_6 = 1 ether;
    uint public constant PRIZE_5 = 0.75 ether;
    uint public constant PRIZE_4 = 0.25 ether;
    uint public constant PRIZE_3 = 0.1 ether;



    // 당첨된 숫자,문자를 상태변수에 입력
    function getWinNumber(uint8[4] memory numbers, bytes1[2] memory letters) public {
        winningNumbers = numbers;
        winningLetters = letters;
    }

    // 상태변수에 입력된 값과 내 번호 비교
    function checkMatches(uint8[4] memory numbers, bytes1[2] memory letters) public view returns(uint) {
        
        // matching numbers 수량
        uint numberMatches = 0;
        for (uint i = 0; i < numbers.length; i++) {
            for (uint j = 0; j < winningNumbers.length; j++) {
                if (numbers[i] == winningNumbers[j]) {
                    numberMatches++;
                    break;
                }
            }
        }

        // matching letters 수량
        uint letterMatches = 0;
        for (uint i = 0; i < letters.length; i++) {
            for (uint j = 0; j < winningLetters.length; j++) {
                if (letters[i] == winningLetters[j]) {
                    letterMatches++;
                    break;
                }
            }
        }

        // 전체 맞은 수량
        uint totalMatches = numberMatches + letterMatches;
        uint prize = 0;

        // 상금
        if (totalMatches == 6) {
            prize = PRIZE_6;
        } else if (totalMatches == 5) {
            prize = PRIZE_5;
        } else if (totalMatches == 4) {
            prize = PRIZE_4;
        } else if (totalMatches == 3) {
            prize = PRIZE_3;
        }

        return prize;
    }    



}
