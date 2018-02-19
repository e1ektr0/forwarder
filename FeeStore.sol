pragma solidity ^0.4.18;

contract owned {
    function owned() public { owner = msg.sender; }
    address owner;

    // This contract only defines a modifier but does not use
    // it: it will be used in derived contracts.
    // The function body is inserted where the special symbol
    // `_;` in the definition of a modifier appears.
    // This means that if the owner calls this function, the
    // function is executed and otherwise, an exception is
    // thrown.
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}


/**
 * Contract provide information for fee calculation in forwarder
 */
contract FeeStore is owned{
    
    //this numers will be use for fee calculation
    //fee = value* multipler / divider
    uint public multiplier = 1;
    uint public divider = 1;

    function FeeStore() public {
    }
    
    function SetFee(uint _multiplier, uint _divider)  public onlyOwner{
        divider = _divider;
        multiplier = _multiplier;
    }

}