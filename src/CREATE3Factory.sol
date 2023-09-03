// Solmate
import {CREATE3} from "solmate/utils/CREATE3.sol";

contract CREATE3Factory {
    function deploy(
        bytes32 salt,
        bytes memory code
    ) external payable returns (address deployed) {
        return CREATE3.deploy(salt, code, msg.value);
    }

    function getDeployed(
        bytes32 salt
    ) external view returns (address deployed) {
        return CREATE3.getDeployed(salt);
    }
}
