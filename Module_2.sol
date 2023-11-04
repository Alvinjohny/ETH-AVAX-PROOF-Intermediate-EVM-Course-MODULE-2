// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyBank {
    uint public balance;
    address public AccHolder;
    mapping(address => uint) public AvailableBalance;


     modifier onlyAccHolder() {
        require(msg.sender == AccHolder, "UNAUTHORIZED ACCESS, ACCESS DENIED."); // access is granted only to the account holder
        _;
    }

    constructor(uint initialSupply) {
        balance = initialSupply;
        AvailableBalance[msg.sender] = balance;
       AccHolder = msg.sender;
    }
    function CheckBalance () view public returns (uint){
        return balance;
    }  

    function Deposite(address WalletAddress, uint Amount) public {
       AvailableBalance[WalletAddress] = AvailableBalance[WalletAddress] + Amount;
        balance = balance + Amount;
    }

     function Withdraw(address WalletAddress, uint Amount) public onlyAccHolder{
        if (AvailableBalance[WalletAddress] >= Amount) {
            AvailableBalance[WalletAddress] = AvailableBalance[WalletAddress] - Amount;
            balance = balance - Amount;
        } 
    }
}
