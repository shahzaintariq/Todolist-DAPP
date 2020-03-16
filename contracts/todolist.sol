pragma solidity 0.5.9;
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
    tasks[] public  task;
    userData[] public usersData;


    mapping(address => uint) public paymentDetails;
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

    function deleteItem(uint _index) public returns(bool){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
        if(_index >= task.length) return false;

        for(uint i=_index; i<task.length -1; i++){
            task[i] = task[i+1];
        }
        delete task[task.length-1];
        task.length -= 1;
        return true;

    }



}