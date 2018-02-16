pragma solidity ^0.4.18;

/**
 * Contract that will forward any incoming Ether to its creator
 */
contract Parser {
  // Address to which any funds sent to this contract will be forwarded
  address public addressx;

  /*
    Create the contract, and set the destination address to that of the creator
  */
  function Parser() public {
  }

  /**
   * Default function; Gets called when Ether is deposited, and forwards it to the destination address
  */
  function setAddress(address _address)  public {
        addressx = _address;
  }
}