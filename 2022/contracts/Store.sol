/*
 * Copyright (C) 2020 Chair of Applied Cryptography, TU Darmstadt, Germany. All
 * rights reserved. This file is part of the Cryptocurrencies WS 19/20 lecture
 * bonus exercise. It is distributed under the AGPL v3 license, see file LICENSE.
 */

pragma solidity ^0.5.0;

interface HTLStore {
    // A Deposited event should be emitted after ether has been successfully
    // deposited to the store.
    event Deposited(address benefactor, bytes32 lock, uint amount, uint32 timeout);

    // A Claimed event should be emitted after deposited ether has been
    // successfully claimed from the store.
    event Claimed(address beneficiary, bytes32 lock, uint key, uint amount);

    // A Recovered event should be emitted after ether has been recovered by the
    // initial benefactor.
    event Recovered(address benefactor, bytes32 lock, uint amount);

    // deposit should add the sent ether to the amount stored for the lock. The
    // claim period timeout should be reset to now + duration.
    function deposit(bytes32 lock, uint duration) external payable;

    // claim should allow a holder of the correct pre-image key to withdraw the
    // ether stored for the lock = keccak256(key) within the claim period.
    function claim(uint key) external;

    // recover should allow the initial depositor to recover the ether stored
    // for the lock after the claim period has ended.
    function recover(bytes32 lock) external;
}
