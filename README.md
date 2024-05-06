# Simple Lottery Smart Contract

This repository contains a simple lottery smart contract implemented in Solidity. Participants can send Ether to enter the lottery, and a winner is randomly selected to receive the Ether balance.

## Getting Started

These instructions will guide you through running and testing the project on Remix IDE.

### Prerequisites

- Access to Remix IDE ([remix.ethereum.org](https://remix.ethereum.org/))
- MetaMask extension for browser-based Ethereum interaction ([metamask.io](https://metamask.io/))

## Usage

1. Open Remix IDE and create a new file.
2. Copy the contents of `Lottery.sol` into the new file.
3. Compile the contract using the Solidity compiler provided by Remix IDE.
4. Deploy the contract to a local development environment or an Ethereum test network using MetaMask.
5. Participants can send Ether to the contract address to enter the lottery.
6. Once enough participants have entered, the manager can call `selectWinner()` to choose a winner.
7. The winner receives the entire Ether balance of the contract.

## About

This project is a simple lottery smart contract implemented in Solidity, a programming language for writing smart contracts on the Ethereum blockchain. 
The lottery contract allows participants to enter by sending Ether to the contract address. Once a predetermined number of participants have entered, a winner is randomly selected, and they receive the entire Ether balance of the contract. 
The project serves as a demonstration of basic blockchain functionality and can be used for educational purposes or as a starting point for more complex decentralized applications.

## License

This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.

## Acknowledgments

- Built with Remix IDE
