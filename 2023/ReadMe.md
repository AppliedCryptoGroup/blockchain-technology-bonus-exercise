# Cryptocurrencies Bonus Exercise 2023

Completing the following exercises can give you a bonus of up to 5 points in the
upcoming semester exam. The first part is concerned with the implementation of a
hash-time-lock store of ether in Solidity. The second part is concerned with the
 attack on a vulnerable contract.

## 1. Hash-Time-Lock Store of Ether

### 1.1. Solidity Implementation (2P)

Implement a hash-time-lock store of ether as a Solidity smart contract. It must
implement the interface in file `contracts/HTLStore.sol`. Your contract should
enable users to deposit ether with a hash-time-lock, claimable within a duration
specified by the depositor. After the claim period has timed out, the depositor
should be able to recover his funds.

- When `deposit` is called, the amount of attached ether and the submitted `lock`
  should be stored. Make sure that repeated calls with the same `lock` increase
  the locked amount and that the timeout for this lock is reset. Repeated calls
  for the same `lock` must be sent by the same depositor. A `Deposited` event
  should be emitted.
- When `claim` is called, `require` that there is some ether stored at the
  corresponding `lock = keccak256(key)` and that the claim period is not over,
  yet. If successful, send the stored ether for the lock to the sender of the
  `claim` call. A `Claimed` event should be emitted.
- When `recover` is called, check that the claim period for this lock is over
  and that the sender of the transaction is the initial depositor.

Remember to perform all necessary security `require` checks and state changes.
Once a lock has been claimed or recovered, it should not be possible to deposit
to the same lock again. Make sure that your implementation is as secure as
possible, e.g., it does not allow unintended or double payouts etc.

Deploy your contract to the Sepolia testnet. Get ether from a so-called testnet
[faucet](https://sepoliafaucet.com/). Contact us if you are having trouble
getting some testnet ether. You will have to submit the address of your deployed
contract, as we are going to run a test-suite against it.

### 1.2. Security Issues (0.5 P)

Explain the security issues that this type of hash-locking on Ethereum exhibits.

## 2. Exploit

In this exercise, you will make some "money" by exploiting an insecure contract on
a fresh testnetwork. The contract code is located at `contracts/VulnerableContract.sol`.

You can connect to the testnetwork with the following data:
- RPC-URL: http://130.83.239.101:4242
- Chain ID: 4242
- Currency: ETH
- Websocket-URL: ws://130.83.239.101:4242

Every group will attack its own instance of the contract. Contact me, David,
with your EOA address to get some Ether and the address of the contract that
your group is supposed to attack.

#### 2.1. Insecure Wallet (0.5 P)

Explain why the contract from file `contracts/VulnerableContract.sol` is insecure.

#### 2.2. Exploit (2 P)

Exploit the security issue that you just described. Write either a browser-based or
a terminal-based dApp to attack the contract. You will probably need to write
and deploy a smart contract for a successful attack.

You will have time until Sun Jun 25 2023 23:59:59 to execute the "claim" function.
Obviously, it can be executed several times (with the same or different senders).
The "win" function can be executed later but must be executed before Sun Jun 25, 2023 at 23:59:59,
the time of grading. Your attack is successful if the variable "successfulAttack" has the
value "true" at time of grading. Full points will only be rewarded to successful attacks.
We will regularly execute the "claim" function with an investment equal to
"previous_investment + 1".

*Note: If the contract gets locked, please contact me to get another instance. 
As the attack on the official contract requires some time, at least 5 days,
I strongly recommend to test the attack on a local network with a smaller value for
"CLAIM_DURATION".*

## Submission

Your solution has to be submitted via moodle and should contain three files that
follow the specifications below. Files with different names or format cannot be
accounted. The deadline for submissions is Sun Jun 25, 2023 at at 23:59. Only
one member of the group has to submit the solution.

Your solutions for exercise 1.2, 2.1 and the addresses of your deployed contracts
of exercises 1.1 and 2.2 need to be submitted as a text file called   
`<First name group member 1>_<Last name group member 1>_Solution.txt`
that has the following format:

>= Solution Bonus Exercise
>
>== Group Information
>
> <First name group member 1>, <Last name group member 1>, <Matriculation number group member 1>   
> [<First name group member 2>, <Last name group member 2>, <Matriculation number group member 2>]   
> [<First name group member 3>, <Last name group member 3>, <Matriculation number group member 3>]   
>
> == Solution 1.1
>
> Contract address: <Address of the deployed hash-time-lock store contract>
>
> == Solution 1.2
>
> <Solution for exercise 1.2 as free text>
>
> == Solution 2.1
>
> <Solution for exercise 2.1 as free text>
>
> == Solution 2.2
>
> Attacker address: <The address you used for your attack (the address of the latest owner)>

The code you have deployed for exercise 1.1 needs to be submitted in form of a
solidity source code file. The file has to be called   
`<First name group member 1>_<Last name group member 1>_Contract1.sol`.

The contract you have utilized for your exploit in exercise 2.2 needs to be submitted
in form of a solidity source code file. The file has to be called   
`<First name group member 1>_<Last name group member 1>_Contract2.sol`.

_Remark: Replace `<...>` with the information specified between the brackets.   
Information between `[...]` is optional._
