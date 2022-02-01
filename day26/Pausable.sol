pragma solidity ^0.4.25;

contract Pausable {
   bool private _paused;
    address private owner;

    constructor() public {
        _paused = false;
    }

    modifier whenPaused() {
        require(_paused);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

    event Pause(address addr);
    event Unpause(address addr);

    function pause() public whenNotPaused onlyOwner returns (bool success) {
        _paused = true;
        emit Pause(msg.sender);
        return true;
    }

    function unpause() public whenPaused onlyOwner returns (bool success) {
        _paused = false;
        emit Unpause(msg.sender);
        return true;
    }

    function transfer() public whenNotPaused returns (bool success) {

    }
}
