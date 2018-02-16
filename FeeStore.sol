pragma solidity ^0.4.18;

/**
 * Contract that will forward any incoming Ether to its creator
 */
contract FeeStore {
  // Address to which any funds sent to this contract will be forwarded
  uint public multiplier = 1;
  uint public divider = 1;

  /*
    Create the contract, and set the destination address to that of the creator
  */
  function FeeStore() public {
  }

  /**
   * Default function; Gets called when Ether is deposited, and forwards it to the destination address
  */
  function Set(uint _multiplier, uint _divider)  public {
      multiplier = _multiplier;
      divider = _divider;
  }

}