pragma solidity 0.6.3;

contract curd{
    struct userData{
        uint id;
        string name;
        address Address;
    }
    ArrayData[];

    mapping(address => uint) paymentDetails;
    mapping(address => ArrayData[]) data;


    //user should have 0.5 ether to open account on todolist
    function registerUser(uint _id, string memory _name) public payable returns(bool){
        require(msg.value >= 0.5 ether,"You Don't Have Enough Fund");
        paymentDetails[msg.sender] = msg.value;
        userData(_id,_name,msg.sender);
        return true;
    } 

    function create(string memory _data) public returns(bool){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
        data[msg.sender] = _data;
        return true;
    }

    function read() public returns(string memory){
        require(paymentDetails[msg.sender] >= 0.5 ether,"register yourself first");
        return data[msg.sender];
    
    }



}