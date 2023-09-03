// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

// Tools
import {CREATE3Factory} from "src/CREATE3Factory.sol";

// Solmate
import {MockERC20} from "solmate/test/utils/mocks/MockERC20.sol";

// Splitter
import {SplitterFactory} from "wo-splitter/SplitterFactory.sol";

contract DeployScript is Script {
    bytes32 salt;

    function run() public {
        vm.startBroadcast();

        // Deploy factory
        console.log("Deploying factory");
        salt = keccak256(bytes("create3-factory"));
        CREATE3Factory factory = new CREATE3Factory{salt: salt}();

        // Deploy DAI
        salt = keccak256(bytes("erc20-dai"));
        console.log("Deploying DAI to", factory.getDeployed(salt));
        factory.deploy(
            salt,
            abi.encodePacked(
                type(MockERC20).creationCode,
                abi.encode("DAI", "DAI", 18)
            )
        );

        salt = keccak256(bytes("splitter-factory"));
        console.log("Deploying SplitterFactory to", factory.getDeployed(salt));
        factory.deploy(salt, type(SplitterFactory).creationCode);

        vm.stopBroadcast();
    }
}
