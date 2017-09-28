pragma solidity ^0.4.15;

contract eSleep {
	// number "90" is minutes it takes one full sleep cycle
	uint constant cycleDuration = 60 * 90;
	// minimal number of sleep cycles
	uint constant minCycles = 4;
	// maximal number of sleep cycles
	uint constant maxCycles = 8;
	// number "14" is minutes it takes to fall asleep
	uint constant asleepTime = 60 * 14;

	// takes time that user goes to bed as input and returns array of times that user shold wake
	function calculateWakeTimes(uint _bedTime) constant returns(uint[]) {
		uint[] memory wakeTimes = new uint[](maxCycles-minCycles+1);
		for (uint256 i = minCycles; i <= maxCycles; i++) {
			wakeTimes[i - minCycles] = (_bedTime + i * cycleDuration + asleepTime);
		}
		return wakeTimes;
	}

	// takes time that user wants to wake as input and returns array of times that user shold go to bed
	function calculateBedTimes(uint _wakeTime) constant returns(uint[]) {
		uint[] memory bedTimes = new uint[](maxCycles-minCycles+1);
		for (uint256 i = maxCycles; i >= minCycles; i--) {
			bedTimes[i - minCycles] = (_wakeTime - asleepTime - i * cycleDuration);
		}
		return bedTimes;
	}

}
