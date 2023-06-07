# Cryptocurrencies Bonus Exercise 2022

Completing the following exercises can give you a bonus of up to 5 points in the
upcoming semester exam. The first part is concerned with the implementation of a
hash-time-lock store of ether in Solidity. The second part is concerned with the
exploitation of an insecure wallet.

## 1. Hash-Time-Lock Store of Ether

### 1.1. Solidity Implementation (2P)

Implement a hash-time-lock store of ether as a Solidity smart contract. It must
implement the interface in file `contracts/Store.sol`. Your contract should
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

Deploy your contract to the Ropsten testnet. Get ether from a so-called testnet
[faucet](https://faucet.ropsten.be). Contact us if you are having trouble
getting some testnet ether. You will have to submit the address of your deployed
contract, as we are going to run a test-suite against it.

### 1.2. Security Issues (0.5 P)

Explain the security issues that this type of hash-locking on Ethereum exhibits.

## 2. Wallet Exploit

In this exercise, you will make some money by exploiting an insecure wallet.
The wallet from file `contracts/Wallet.sol` is deployed in the Ropsten testnet at address
[`0x9790831d13a49CF9BF62271D4aa5CfaC41CB0B0B`](https://ropsten.etherscan.io/address/0x9790831d13a49CF9BF62271D4aa5CfaC41CB0B0B). It is your job to exploit
the vulnerability of the wallet to make some extra Ether. However, you may not
be to greedy, otherwise the contract might block your attack.

#### 2.1. Insecure Wallet (0.5 P)

Explain why the wallet from file `contracts/Wallet.sol` is insecure.

#### 2.2. Exploit (2 P)

Exploit the security issue that you just described! Write either a browser-based or
terminal-based dApp and steal coins from the wallet. You will probably need to write
and deploy a smart contract to do so. Your exploit is successful if you manage to withdraw
more Ether than you have deposited.

Let us know about the address that you are going to use for the attack so that we can add
it to the whitelist of the contract. Exploits executed by unregistered addresses cannot be executed
successfully. Full points will only be rewarded to successful hunters.

Please check if the contract still has enough funding before starting the attack. You can do
so by calling the `getBalance` function. If the contract is out of Ether, please contact us.

## Submission

Your solution has to be submitted via moodle and should contain three files that
follow the specifications below. Files with different names or format cannot be
accounted.

Your solutions for exercise 1.2, 2.1 and the address of your deployed contract
of exercise 1.1 needs to be submitted as a text file called   
`<First name group member 1>_<Last name group member 1>_Solution.txt`
that has the following format:

>= Solution Bonus Exercise
>
>== Group Information
>
> <First name group member 1>, <Last name group member 1>, <Matiriculation number group member 1>   
> [<First name group member 2>, <Last name group member 2>, <Matiriculation number group member 2>]   
> [<First name group member 3>, <Last name group member 3>, <Matiriculation number group member 3>]   
>
> == Solution 1.1
>
> Contract address: < Address of the deployed hash-time-lock store contract>
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
> Attacker address: < The whitelisted address you have used for your exploit>

The code you have deployed for exercise 1.1 needs to be submitted in form of a
solidity source code file. The file has to be called   
`<First name group member 1>_<Last name group member 1>_Contract1.sol`.

The contract you have utilized for your exploit in exercise 2.2 needs to be submitted
in form of a solidity source code file. The file has to be called   
`<First name group member 1>_<Last name group member 1>_Contract2.sol`.

_Remark: Replace `<...>` with the information specified between the brackets.   
Information between `[...]` is optional._
