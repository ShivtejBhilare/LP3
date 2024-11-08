// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Structure to hold student details
    struct Student {
        uint id;
        string name;
        uint age;
        string grade;
    }

    // Array to store students
    Student[] public students;
    uint public studentCount = 0;

    // Function to add a new student
    function addStudent(string memory _name, uint _age, string memory _grade) public {
        studentCount++;
        students.push(Student(studentCount, _name, _age, _grade));
    }

    // Function to get a student's details by id
    function getStudent(uint _id) public view returns (string memory, uint, string memory) {
        for (uint i = 0; i < students.length; i++) {
            if (students[i].id == _id) {
                return (students[i].name, students[i].age, students[i].grade);
            }
        }
        revert("Student not found");
    }

    // Fallback function to handle ether sent directly to the contract
    fallback() external payable {
        // This will just accept ether sent to the contract
    }

    // Receive function to handle plain ether transfers
    receive() external payable {
        // This will accept ether sent to the contract
    }

    // Function to check the balance of the contract
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}


