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
    function run() public {
        vm.startBroadcast();

        CREATE3Factory factory = new CREATE3Factory{
            salt: keccak256(bytes("create3-factory"))
        }();

        factory.deploy(
            keccak256(bytes("erc20-dai")),
            abi.encodePacked(
                type(MockERC20).creationCode,
                abi.encode("DAI", "DAI", 18)
            )
        );

        factory.deploy(
            keccak256(bytes("splitter-factory")),
            type(SplitterFactory).creationCode
        );

        vm.stopBroadcast();
    }
}
