pragma solidity ^0.4.25;

contract ClassExample {
    struct Student{
        string name;
        uint score;
        bool active;
    }

    mapping(uint => Student) students;

    modifier activeStudent(uint id) {
        require(students[id].active,"Students is inactive.");
        _;
    }

    function register(uint id,string name) public {
        students[id] = Student({name: name,score: 0,active: true});
    }

    function modifyScore(uint id,uint score) public activeStudent(id) {
        students[id].score = score;
    }

    function getStudent(uint id) public activeStudent(id) view returns (string,uint){
        return (students[id].name,students[id].score);
    }
}