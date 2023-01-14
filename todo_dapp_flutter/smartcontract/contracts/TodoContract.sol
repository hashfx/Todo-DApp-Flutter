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
        taskCount++; // increase count of task by 1
        emit TaskCreated(_taskName, taskCount - 1);
    }

    // function to update task data w.r.t. taskId
    function updateTask(uint256 _taskId, string memory _taskName) public {
        Task memory currTask = todos[_taskId]; // save data of current task in a variable
        todos[_taskId] = Task(_taskId, _taskName, currTask.isComplete); // replace updated task to that of previous task in mapping
        emit TaskUpdated(_taskName, _taskId);
    }

    // function to delete task w.r.t. taskId
    function deleteTask(uint256 _taskId) public {
        delete todos[_taskId]; // delete task object from todos mapping
        emit TaskDeleted(_taskId);
    }

    //
    function toggleComplete(uint256 _taskId) public {
        Task memory currTask = todos[_taskId]; // fetch task object from todos map
        todos[_taskId] = Task(_taskId, currTask.taskName, !currTask.isComplete); // create a new task with updated isComplete value

        emit TaskIsCompleteToggled(
            currTask.taskName,
            _taskId,
            !currTask.isComplete
        );
    }
}
