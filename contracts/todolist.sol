pragma solidity 0.5.9;
pragma experimental ABIEncoderV2;

contract todolist{
    uint ranId;
    struct userData{
        uint id;
        string name;
        address Address;
    }
    struct tasks{
        string value;
    }
    tasks[] public task;
    uint public length;

    mapping(address => userData) public finalData;
    mapping(address => uint) public paymentDetails;
    
    event user(uint,string,address);
    event addedTask(uint,string,address,string);

    //user should have 0.5 ether to open account on todolist
    function registerUser(string memory _name) public payable returns(bool){
        require(msg.value >= 0.5 ether,"You should have minimun of 0.5 ether");
        ranId++;
        paymentDetails[msg.sender] = msg.value;
        finalData[msg.sender].id = ranId;
        finalData[msg.sender].name = _name;
        finalData[msg.sender].Address = msg.sender; 
        emit user(ranId,_name,msg.sender);
        return true;
    }

    function create(string memory _data) public returns(bool){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
        task.push(tasks(_data));
        length = task.length;
        emit addedTask(finalData[msg.sender].id,finalData[msg.sender].name,finalData[msg.sender].Address,_data);
        return true;
    }

    // function read() public view returns(string[] memory){
    //     require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");

    //     string[] memory item = new string[](task.length);
    //     for(uint i=0; i<task.length; i++){
    //         item[i] = task[i].value;
    //     }
    //     return item;
    // }

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