// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 학생 점수관리 프로그램입니다.
// 여러분은 한 학급을 맡았습니다.
// 학생은 번호, 이름, 점수로 구성되어 있고(구조체)
// 가장 점수가 낮은 사람을 집중관리하려고 합니다.

// 가장 점수가 낮은 사람의 정보를 보여주는 기능,
// 총 점수 합계, 총 점수 평균을 보여주는 기능,
// 특정 학생을 반환하는 기능, -> 숫자로 반환
// 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)


contract Info_Student {

    struct Student {
        uint id;        // 학생 번호
        string name;    // 학생 이름
        uint score;     // 학생 점수
    }

    Student[] private students;

    // 새로운 학생 추가
    function addStudent(uint _id, string memory _name, uint _score) public {
        students.push(Student(_id, _name, _score));
    }

    // 가장 점수가 낮은 사람의 정보를 보여주는 기능
    function getLowestScoreStudent() public view returns (uint, string memory, uint) {
        require(students.length > 0, "No Data");
        uint lowestIndex = 0;
        
        for (uint i = 1; i < students.length; i++) {
            if (students[i].score < students[lowestIndex].score) {
                lowestIndex = i;
            }
        }
        return (students[lowestIndex].id, students[lowestIndex].name, students[lowestIndex].score);
    }

    // 총 점수 합계, 총 점수 평균을 보여주는 기능
    function getTotalnAverageScore() public view returns (uint, uint) {

        require(students.length > 0, "No Data");

        uint totalScore = 0;
        uint averageScore = 0;

        for (uint i = 0; i < students.length; i++) {
            totalScore += students[i].score;
        }

        averageScore = totalScore / students.length;

        return (totalScore, averageScore);
    }

   
    // 특정 학생을 반환하는 기능, -> 숫자로 반환 // 
    // 
    function getStudent(bytes memory _a) public view returns (uint, string memory, uint) {

        // 숫자와 문자 구분 (id인지 name 인지 구분)



        // for (uint i = 0; i < students.length; i++) {
        //     if (students[i].id == _id) {
        //         return (students[i].id, students[i].name, students[i].score);
        //     }
        // }
        revert ("No Data");
    }



    // 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
    function getAllStudents() public view returns (Student[] memory) {
        return students;
    }


}
