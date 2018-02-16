pragma solidity ^0.4.18;

import "./FeeStore.sol";
/**
 * Contract that will forward any incoming Ether to its creator
 */
contract Forwarder {
  // Address to which any funds sent to this contract will be forwarded
  address public destinationAddress;
  address public destinationFeeAddress;
  address public feeStoreAddress;
  /*
    Create the contract, and set the destination address to that of the creator
  */
  function Forwarder(address _destinationAddress, address _destinationFeeAddress, address _feeStoreAddress) public {
    destinationAddress = _destinationAddress;
    destinationFeeAddress = _destinationFeeAddress;
    feeStoreAddress = _feeStoreAddress;
  }

  /**
   * Default function; Gets called when Ether is deposited, and forwards it to the destination address
  */
  function() payable public {
        FeeStore store = FeeStore(feeStoreAddress);
        uint fee = msg.value*store.multiplier()/store.divider();
        destinationAddress.transfer(msg.value-fee);
        destinationFeeAddress.transfer(fee);
  }
 function test() public view returns (uint)
 {
     uint v = FeeStore(feeStoreAddress).divider();
     return v;
 }
  /*
    It is possible that funds were sent to this address before the contract was deployed.
    We can flush those funds to the destination address.
   */
  function flush() public {
    destinationAddress.transfer(this.balance);
  }

}