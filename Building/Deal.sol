// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// import "@openzeppelin/contracts/access/Ownable.sol";

contract Deal {

    struct building {
        string location;
    }

    mapping(uint256 => building) public buildingInfos;

    uint256 public monthlyRentAmount;

    constructor(uint256 _monthlyRentAmount) {
        monthlyRentAmount = _monthlyRentAmount;
    }

    // 건축물 정보 입력 받기
    function addBuildingInfo(uint256 _buildingId, string memory _location) public {
        buildingInfos[_buildingId] = building(
            _location
        );
    }

    // pay
    function payRent(uint256 _buildingId, uint256 _monthlyRentAmount) payable public {
        // TODO: buildingInfos[_buildingId] exists?
        require(msg.value == _monthlyRentAmount, "Invalid _monthlyRentAmount");
    }

    
    // function recoverERC20(address token, uint256 amount) onlyOwner public {
    //     IERC20(token).safeTransfer(msg.sender, amount);
    //     emit Recovered(token, amount);
    // }

    // function recoverETH() onlyOwner public {
    //     payable(msg.sender).transfer(address(this).balance);
    // }
}