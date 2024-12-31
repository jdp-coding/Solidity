// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Info_Student {

    struct Student {
        string name;
        uint id;
        uint score;
        string grade;
        string[] classes;
    }

    Student[] private students;
    mapping(uint => uint) private studentIndexById; 
    mapping(string => uint) private studentIndexByName; 
    

    // 학생 추가 기능
    function addStudent(string memory _name, uint _id, uint _score, string[] memory _classes) public {
        require(studentIndexById[_id] == 0, "ID exists");
        require(studentIndexByName[_name] == 0, "name exists");
        
        string memory grade = calcule_Grade(_score);
        students.push(Student(_name, _id, _score, grade, _classes));
        studentIndexById[_id] = students.length; 
        studentIndexByName[_name] = students.length;
    }

    // 학점 계산 함수
    function calcule_Grade(uint _score) private pure returns (string memory) {
        if (_score >= 90) {
            return "A";
        } else if (_score >= 80) {
            return "B";
        } else if (_score >= 70) {
            return "C";
        } else if (_score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }

    // 학생 조회 기능 (번호로 조회)
    function getStudentById(uint _id) public view returns (Student memory) {
        require(studentIndexById[_id] > 0, "NO Data");
        return students[studentIndexById[_id] - 1];
    }

    // 학생 조회 기능 (이름으로 조회)
    function getStudentByName(string memory _name) public view returns (Student memory) {
        require(studentIndexByName[_name] > 0, "Student not found");
        return students[studentIndexByName[_name] - 1];
    }


    // 학생 점수 조회 기능
    function getStudentScore(string memory _name) public view returns (uint) {
        require(studentIndexByName[_name] > 0, "Student not found");
        return students[studentIndexByName[_name] - 1].score;
    }

    // 학생 전체 숫자 조회
    function getStudentsCount() public view returns (uint) {
        return students.length;
    }

    // 학생 평균 점수 계산
    function getAverageScore() public view returns (uint) {
        uint totalScore;  // 점수 총 합계

        if (students.length == 0) {
            return 0;
        } else {
            
            for (uint i = 0; i < students.length; i++) {
                totalScore += students[i].score;
            }
            return totalScore / students.length;
        }
    }

    // 학생 전체 정보 조회 기능

}
