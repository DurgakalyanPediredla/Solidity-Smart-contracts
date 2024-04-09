# Decentralized Finance Smart Contracts

## Description

This repository contains a set of Solidity smart contracts for a decentralized finance (DeFi) application. These contracts enable users to contribute funds, convert ETH to USD, store favorite numbers, and interact with a factory contract for creating and managing storage contracts.

## Smart Contracts

1. **Fundme**: This contract allows users to contribute funds in ETH, which are then converted to USD using Chainlink's price feed. It also includes functionality for withdrawing funds and is protected by an owner-only modifier.

2. **PriceConverter Library**: This library provides functions to retrieve the current price of ETH in USD and convert ETH amounts to USD.

3. **SimpleStorage**: This contract enables users to store and retrieve their favorite numbers. It also allows for adding people along with their favorite numbers.

4. **StorageFactory**: This factory contract allows users to create instances of SimpleStorage contracts and interact with them.

## Dependencies

- **Chainlink Oracle**: The project relies on Chainlink's price feed to convert ETH to USD.

## Usage

1. **Interacting with Fundme Contract**: Users can contribute funds, withdraw funds, and view current contributors.
2. **Interacting with SimpleStorage Contract**: Users can store and retrieve their favorite numbers.
3. **Interacting with StorageFactory Contract**: Users can create instances of SimpleStorage contracts and manage them.

## Testing

These contracts have been tested in a sepolia testnet.

## License

This project is licensed under the MIT License.


## Authors

- [Kalyan Pediredla]

## Acknowledgments

- The project acknowledges the use of Chainlink's Oracle for price feeds.
