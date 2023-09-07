#!/bin/ash

# Config
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC=http://localhost:8545

# Install dependencies
apk add --no-cache curl

# Run anvil
anvil &
printf "Waiting for anvil"

until $(curl -X POST --output /dev/null --silent --head --fail $RPC); do
    printf "."
    sleep 1
done

# Run the scripts
echo "Deploying everything"
git config --global --add safe.directory /contracts
forge update
forge script \
    script/Deploy.s.sol:DeployScript \
    --private-key $PRIVATE_KEY \
    --rpc-url $RPC \
    --broadcast \
    -vvv

# Wait for anvil
wait -n
exit $?
