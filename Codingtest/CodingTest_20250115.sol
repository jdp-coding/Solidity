// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
숫자를 시분초로 변환하세요.
예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
*/

contract Test {
    function numToTime(uint n) public pure returns(uint hour, uint min, uint sec) {
        hour = n /3600;
        n %= 3600;
        min = n / 60;
        sec = n % 60;

        return (hour, min, sec);
    }
}
