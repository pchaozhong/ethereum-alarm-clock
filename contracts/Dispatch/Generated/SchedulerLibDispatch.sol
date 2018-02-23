pragma solidity ^0.4.18;

import "contracts/Dispatch/DispatchHub.sol";

contract SchedulerLibDispatch {
    function() public {
      	DispatchHub dispatchHub = DispatchHub(0x1111222233334444555566667777888899990000);
      	address target = dispatchHub.get("SchedulerLib");

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