//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./freecodecamp.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;
    mapping(uint256 => uint256) public findingFaveNum;

    function createSimpleContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage); 
    }
    
    function sfStore(uint256 _simpleStorageIndex , uint256 _simpleStorageNumber) public {
        //a contract is made up of an address and an abi(application binary interface)
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
        findingFaveNum[_simpleStorageNumber]=_simpleStorageIndex;
    }

    function sfGet(uint256 _simpleStorageIndex)public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();
       
    }
}