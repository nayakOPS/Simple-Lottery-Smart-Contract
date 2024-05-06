// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
    address public manager;
    // Participants must accept Ether payments, so they are payable addresses
    address payable[] public participants;

    // The contract deployer is also the manager
    constructor(){
        // msg.sender is a global variable representing the address that deployed the contract
        manager=msg.sender;
    }

    // This function is called when participants transfer Ether to the contract
    // The receive() function can be used only once in a contract
    receive() external payable { 
        require(msg.value == 2 ether);
        // Only participants who send 2 Ether can enter the lottery
        participants.push(payable(msg.sender));
    }
    
    // The contract's balance is stored here, managed by the manager
    function getBalance() public view returns(uint){
        require(msg.sender == manager );
        return address(this).balance;
    }

    // Generates a random number based on blockchain data
    function random() public view returns(uint){
        // "difficulty" replaced by "prevrandao", which now returns a random number based on the beacon chain.
        return uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,participants.length)));
    }

    // Selects a winner when conditions are met
    function selectWinner() public {
        require(msg.sender == manager );
        require(participants.length >=3);
        uint r = random();
        // Modulo operation to get a random index within the participants array

        /* To select a random index within the range of participants, we use the modulo operator (%).
        The modulo operation calculates the remainder when dividing a large number (got from random()) by the number of participants (NoOfParticipants.length).
        Since the result of a modulo operation is always less than the divisor (the number being divided by), the result will always be within the range of the participants' array indices. */

        uint index = r % participants.length;
        address payable winner;
        winner = participants[index];
        // Transfers the contract's total balance to the winner
        winner.transfer(getBalance());
        // Resets the participants array to zero
        participants = new address payable[](0);
    }
}