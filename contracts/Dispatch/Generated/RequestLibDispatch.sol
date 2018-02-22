pragma solidity ^0.4.18;

import "contracts/Dispatch/DispatchHub.sol";

contract RequestLibDispatch {
    function() public {
      	DispatcherStorage dispatcherStorage = DispatcherStorage(0x1111222233334444555566667777888899990000);
      	address target = dispatcherStorage.get("RequestLib");

      	assembly {
			calldatacopy(0x0, 0x0, calldatasize)
			let success := delegatecall(sub(gas, 10000), target, 0x0, calldatasize, 0, 0)
			let retSz := returndatasize
			returndatacopy(0, 0, retSz)
			switch success
			case 0 {
				revert(0, retSz)
			}
			default {
				return(0, retSz)
			}
		}
    }
}
