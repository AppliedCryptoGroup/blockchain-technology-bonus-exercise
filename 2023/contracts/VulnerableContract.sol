// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//This contract should realize the following game:
//- A student can claim ownership of the contract by sending more coins to the contract than the current owner.
//  - The student that is currently the owner is compensated with 2/3 of
//    of his investment but loses the contract to the new investor.
//  - The new investor's investment is added to the jackpot.
//- The owner wins the game and gets the total jackpot if no other party
//  claimed the throne rightfully (with sufficient coins) for 5 days.

contract VulnerableContract {

  address payable constant DAVID = payable(0x669B10E31D2aA1740bB34a266Cc86800357B1d25);
  uint constant MAX_INVESTMENT = 1000000;
  uint constant END_TIMESTAMP = 1687730399; // 1687730399 = Sun Jun 25 2023 23:59:59
  uint constant CLAIM_DURATION = 24 * 60 * 60 * 5; // 5 days

  uint public previous_investment = 0;
  uint public deadline = 0;
  address payable public owner = payable(0);
  bool public successfulAttack = false;
  
  function win() public {
      require(!successfulAttack, "Game is already won");
      require(deadline != 0 && deadline < block.timestamp, "Not the right time to take the jackpot.");
      require(msg.sender == owner, "Not the right party to take the jackpot");
      require(owner.send(address(this).balance), "Unsuccessful transfer of funds");
      successfulAttack = true;
  }
  
  function claim() public payable {
      require(block.timestamp < END_TIMESTAMP || msg.sender == DAVID, "Time for claiming is over. From now on, you can only execute win");
      require(!successfulAttack, "Game is already won");
      require (msg.value < MAX_INVESTMENT || msg.sender == DAVID, "Only I am allowed to deposit more than MAX_INVESTMENT ... just increasing the investment is not a valid attack!");
      require(msg.value > previous_investment, "Too little investiment to claim ownership");
      require(owner.send((previous_investment * 2) / 3), "Unsuccessful transfer of funds");
      owner = payable(msg.sender);
      deadline = block.timestamp + CLAIM_DURATION;
      previous_investment = msg.value;
  }
}
