// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoContract {
    uint256 public taskCount = 0; // stores the total number of todo items in the smart contract

    // stores information about each todo
    struct Task {
        uint256 index; // id of todo
        string taskName; // name of todo task
        bool isComplete; // whether task is complete or not
    }

    // mmaping to store all todos
    mapping(uint256 => Task) public todos;

    // events for dapp to be listened on blockchain
    event TaskCreated(string task, uint256 taskNumber);
    event TaskUpdated(string task, uint256 taskId);
    event TaskIsCompleteToggled(string task, uint256 taskId, bool isComplete);
    event TaskDeleted(uint256 taskNumber);

    // function to create task from Task struct
    function createTask(string memory _taskName) public {
        todos[taskCount] = Task(taskCount, _taskName, false);
        taskCount++;  // increase count of task by 1
        emit TaskCreated(_taskName, taskCount - 1);
    }
}
