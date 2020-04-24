# ALASTRIA Red B

- Visit [What is alastria](https://alastria.io/en/) page to know more about us.

This page contains technical information needed to add a node in the Alastria Besu Network (Alastria Red B)

## System requirements

**Operating System**: Ubuntu 16.04 / 18.04 LTS 64 bits

**Hardware**:

| Hardware       | minimum | desired |
| :------------- | :------ | :------ |
| **CPU's**:     | 2       | 4       |
| **Memory**:    | 4 Gb    | 8 Gb    |
| **Hard Disk**: | 100 Gb  | 1000 Gb |

#### TCP/UDP PORTS

You'll need to open the following ports in both ways to deploy a node:

##### Validator Node

| Port  | Type | Definition                                        |
| :---: | :--: | :------------------------------------------------ |
| 30303 | TCP  | Ethereum client listener and discovery ports      |
| 30303 | UDP  | Ethereum client listener and discovery ports      |
| 8080  | TCP  | Orion port (private transactions)                 |
| 8546  | TCP  | RPC WS Port (internal only - for Ethstats client) |
| 9090  | TCP  | Prometheus metrics                                |

##### Regular Node

| Port  | Type | Definition                                   |
| :---: | :--: | :------------------------------------------- |
| 30303 | TCP  | Ethereum client listener and discovery ports |
| 30303 | UDP  | Ethereum client listener and discovery ports |
| 8080  | TCP  | Orion port (private transactions)            |
| 8545  | TCP  | RPC HTPP Port (this can be internal only)    |
| 8546  | TCP  | RPC WS Port (this can be internal only)      |
| 9090  | TCP  | Prometheus metrics                           |

## Installation & configuration of

### Regular node

Installation of a Regular node (Besu node + Orion + Prometheus + Ethstats-cli) using Docker Compose

- [Regular node Installation Guide](docs/regular-node-compose.md)

### Validator node

Installation of a Validator node (Besu node + Orion + Prometheus + Ethstats-cli) using Docker Compose

- [Validator node Installation Guide](docs/validator-node-compose.md)

### Tools - Network Monitor (Ethstats)

- [Ethstats Server Installation Guide](docs/ethstats-installation.md)

### Tools - Block Explorer

- [Alethio Lite Explorer Installation Guide](docs/blockexplorer-installation.md)

### Tools - Permissioning DApp

- [Permissioning DApp](docs/permissioning-dapp.md)

# Red B Monitor

- [Red B Network Monitor (for Validators)](http://sanbesu01.westeurope.cloudapp.azure.com:3000)
- [Red B Block Explorer - Hosted by Eurogestión](http://5.153.57.78)

# Red B Initial Schema (2020-01)

![Red B Initial Schema](./docs/AlastriaRedB.png)

# Annex

- [Description of the Ignition Process (creation of initial Besu & Orion Bootnodes)](docs/ignition-bootnodes.md)
