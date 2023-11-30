// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

library FuzzLand {
    event AssertionFailed(string message);

    function bug() internal {
        emit AssertionFailed("Bug");
    }

    function typed_bug(string memory data) internal {
        emit AssertionFailed(data);
    }
}

function bug() {
    FuzzLand.bug();
}

function typed_bug(string memory data) {
    FuzzLand.typed_bug(data);
}

contract EZ {
    function b(bytes calldata) public {
        uint256 a = 1;
    }

    receive() external payable {
        if (msg.value > 99.99999 ether) {
            bug();
        }
    }

    // fallback() external payable {
    //     if (msg.value > 0) {
    //         bug();
    //     }
    // }
}
