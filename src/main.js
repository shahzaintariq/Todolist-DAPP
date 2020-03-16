const web3 = new Web3('HTTP://127.0.0.1:8545');

const abi = [{
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "uint256"
    }],
    "name": "task",
    "outputs": [{
      "name": "value",
      "type": "string"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "address"
    }],
    "name": "paymentDetails",
    "outputs": [{
      "name": "",
      "type": "uint256"
    }],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "constant": true,
    "inputs": [{
      "name": "",
      "type": "address"
    }],
    "name": "finalData",
    "outputs": [{
        "name": "id",
        "type": "uint256"
      },
      {
        "name": "name",
        "type": "string"
      },
      {
        "name": "Address",
        "type": "address"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  },
  {
    "anonymous": false,
    "inputs": [{
        "indexed": false,
        "name": "",
        "type": "uint256"
      },
      {
        "indexed": false,
        "name": "",
        "type": "string"
      },
      {
        "indexed": false,
        "name": "",
        "type": "address"
      }
    ],
    "name": "user",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [{
        "indexed": false,
        "name": "",
        "type": "uint256"
      },
      {
        "indexed": false,
        "name": "",
        "type": "string"
      },
      {
        "indexed": false,
        "name": "",
        "type": "address"
      },
      {
        "indexed": false,
        "name": "",
        "type": "string"
      }
    ],
    "name": "addedTask",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_name",
      "type": "string"
    }],
    "name": "registerUser",
    "outputs": [{
      "name": "",
      "type": "bool"
    }],
    "payable": true,
    "stateMutability": "payable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_data",
      "type": "string"
    }],
    "name": "create",
    "outputs": [{
      "name": "",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "constant": false,
    "inputs": [{
      "name": "_index",
      "type": "uint256"
    }],
    "name": "deleteItem",
    "outputs": [{
      "name": "",
      "type": "bool"
    }],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  }
]

const contractAddress = '0x8b557c013939771030C7dd63eFd3aeb9a8A95282'

let contract = new web3.eth.Contract(abi, contractAddress);

let account;
web3.eth.getAccounts().then((r) => {
  account = r[0];
})

function registerYourSelf(_name) {
  contract.methods.registerUser(_name).send({
    from: account,
    gas: 400000,
    value: web3.utils.toWei("1", "ether")
  }).then(
    (r) => {console.log(r)}
  )
}

function addTask(){
  value = document.getElementById('input').value;
  contract.methods.create(value).send({ from: account, gas: 400000 }).then( (r) => {console.log(r)});
}

function deleteTask() {
  contract.methods.deleteItem().send( { from: account, gas: 400000} ).then( (r) => {console.log(r)})
}

function fetchData() {
  var ul = document.getElementById("list");
  var li = document.createElement("li");
  li.appendChild(document.createTextNode("Four"));
  var button = document.createElement("button");
  button.innerHTML = "Delete Task";
  li.appendChild(button);
  li.setAttribute('class', 'list-group-item');
  button.setAttribute('class', 'btn btn-outline-danger')
  button.setAttribute('id', 'deleteBtn')
  ul.appendChild(li);
}















