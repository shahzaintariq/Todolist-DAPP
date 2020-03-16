pragma solidity 0.6.3;
pragma experimental ABIEncoderV2;

contract todolist{
    struct userData{
        uint id;
        string name;
        address Address;
    }
    struct tasks{
        string value;
    }
    tasks[] task;
    userData[] usersData;


    mapping(address => uint) paymentDetails;
    //mapping(address => string[]) data;


    //user should have 0.5 ether to open account on todolist
    function registerUser(uint _id, string memory _name) public payable returns(bool){
        require(msg.value >= 0.5 ether,"You should have minimun of 0.5 ether");
        paymentDetails[msg.sender] = msg.value;
        usersData.push(userData(_id,_name,msg.sender));
        return true;
    }

    function create(string memory _data) public returns(bool){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
        task.push(tasks(_data));
        return true;
    }

    function read() public view returns(string[] memory){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");

        string[] memory item = new string[](task.length);
        for(uint i=0; i<task.length; i++){
            item[i] = task[i].value;
        }
        return item;
    }

    // function delete() public returns(bool){
    //     require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
    // }



}