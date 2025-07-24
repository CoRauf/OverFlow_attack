//SPDX-License-Identifier : MIT

pragma solidity 0.8.18;

contract VulnerableERC20 {

    string public name = "CoRauf";
    string public symbol = "CO";
    uint public decimal = 18;
    uint256 public totalSupply; 

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        totalSupply = 1_000_000 * (10 ** decimal);
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Not enough balance");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount; 
        return true;
    }

    function approve(address _spender, uint256 _amount) public returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
        require(balanceOf[_from] >= _amount, "Not enough balance");
        require(allowance[_from][msg.sender] >= _amount, "Allowance exceeded");
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount; 
        allowance[_from][msg.sender] -= _amount;
        return true;
    }

    function getBalance(address _check) public returns(uint256){
        return balanceOf[_check];
    }
}