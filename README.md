# ALASTRIA red B

[![Slack Status](https://img.shields.io/badge/slack-join_chat-white.svg?logo=slack&style=social)](https://alastria.slack.com/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/alastria/alastria-node/blob/testnet2/LICENSE)

## Introduction

Alastria-B Network is a public-permissioned Blockchain network that uses the [Hyperledger BESU](https://www.hyperledger.org/use/besu) technology, [IBFT 2.0](https://besu.hyperledger.org/en/stable/Tutorials/Private-Network/Create-IBFT-Network/) consensus algorithm, and it's managed by [Alastria](https://alastria.io/en/) partners, :vulcan_salute:.

Please, consider reading this references if you are a _rookie_ in Blockchain or Ethereum:
* https://besu.hyperledger.org/en/stable/
* https://wiki.hyperledger.org/display/BESU/Hyperledger+Besu

If you like you know more about [Hyperledger](https://www.hyperledger.org/) Ecosystem, this [link](https://www.hyperledger.org/use/tutorials) are a good start.

## Administrative requirements

[Alastria](https://alastria.io/en/) partners can add it's own node. Just contact with support@alastria.io, and perform the administrative permission.

Nodes in the network must be permissioned. To ask for permission you must enter your data in this [electronic form](https://portal.r2docuo.com/alastria/forms/noderequest) and then perform the installation process. Other guides related with operation of Alastria Node are available in following documents:

* Alastria-B Network Operation and Government Policies [(en_GB)](https://alastria.io/wp-content/uploads/2020/04/POLI-TICAS-GOBIERNO-Y-OPERACIO-N-RED-ALASTRIA-V1.01-DEF-en-GB.pdf), [(es_ES)](https://alastria.io/wp-content/uploads/2020/04/POLI-TICAS-GOBIERNO-Y-OPERACIO-N-RED-ALASTRIA-V1.01-DEF.pdf)

* Conditions of operation of the Alastria-B Network Regular Nodes [(en_GB)](https://alastria.io/wp-content/uploads/2020/06/CONDICIONES-USO-RED-NODOS-REGULARES-A-LA-RED-ALASTRIA-v1.1-DEF-en-GB.pdf), [(es_ES)](https://alastria.io/wp-content/uploads/2020/06/CONDICIONES-USO-RED-NODOS-REGULARES-A-LA-RED-ALASTRIA-v1.1-DEF.pdf)

* Conditions of operation of the Alastria-B Network Critical (boot && validator) Nodes [(en_GB)](https://alastria.io/wp-content/uploads/2020/06/CONDICIONES-OPERACIO-N-RED-T-POR-PARTE-DE-NODOS-CRI-TICOS-V1.1-DEF-en-GB.pdf), [(es_ES)](https://alastria.io/wp-content/uploads/2020/06/CONDICIONES-OPERACIO%CC%81N-RED-T-POR-PARTE-DE-NODOS-CRI%CC%81TICOS-V1.1-DEF.pdf)

If a member wants to remove a node from the network, it is kindly appreciated a **removal request** via this same [electronic form](https://portal.r2docuo.com/alastria/forms/noderequest).

## System requirements

* Operating System: Ubuntu 16.04/18.04/20.04 LTS 64 bits. CentOS, Redhat,... and other _rpm_ systems are also allowed.

* Hosting: Euro Zone, in order to complain GRPD directives.

* Hardware:

| Hardware       | minimum | desired |
| :---           | :---    | :---    |
| **CPU's**:     | 2       | 4       |
| **Memory**:    | 4 Gb    | 8 Gb    |
| **Hard Disk**: | 64 Gb   | 256 Gb  |

Blockchain database takes about 32Gb at mid-2021, and grows 1Gb/month, so consider the amount of provisioned space.

## Firewall configuration

You'll need to open the following ports to deploy a node:

### Incoming rules

| Port  | Type |      From:    | Definition                                   |
| :---  | :--  | :---          | :---                                         |
| 30303 | TCP  |    0.0.0.0    | Ethereum client data transfer ports          |
| 30303 | UDP  |    0.0.0.0    | Ethereum client listener and discovery ports |
| 9545  | TCP  | 185.180.8.152 | External Prometheus metrics                  |

Notes:
* Logging from `185.180.8.152` it's need in order to pull metrics from `red B` [Network Monitor](https://alastria-netstats2.planisys.net:8443/?orgId=1) (Thanks [Planisys](https://www.planisys.net/) :raised_hands:)

### Optional ports:

| Port  | Type |     From:       | Definition                                        |
| :---  | :--  | :---            | :---                                              |
| 8080  | TCP  | (orion parners) | Orion port (in case you use private transactions) |
| 8545  | TCP  |  (web3 client)  | json+rpc (in case you use remix/truffle/.../web3) |
| 8546  | TCP  |  (web3 client)  | json+ws (in case you use remix/truffle/.../web3)  |

Notes:
* :warning: Please, be very carefull opening web3 ports: this protocols do not have enabled (natively) neither authentication nor encryption!
* :warning: Opening web3 ports, can be tuned in `/data/alastria-node-besu/regular/config/besu/config.toml` file: listening interface, `web3` methods available,...
* Ninja sysadmins don't use outbound firewall rules :joy:
## Installation

The following guide its ready for installation in a dedicated machine (Baremetal, VirtualMachine,...), with data files in `/data` partition. 
**Please**, consider the following guide to add a [dedicated disk](docs/mount-dedicated-disk.md) for the node database, independent of the system disk.

### Installation Type

* Users who wants deploy applications should use [Regular node Installation Guide](docs/Regular-Configuration&Installation.md)
* Users who likes improve the availability of the network, can add a [Validator](docs/Validator-Configuration&Installation.md) or [Regular](docs/Validator-Configuration&Installation.md) node. Keep in mind the dedicated use of these nodes, and the special security considerations for these core nodes.

## Help! :fire_extinguisher:
### Slack

[Alastria](https://alastria.io/en/) has a group of channels available on `Slack` message platform, at `alastria.slack.com`. You need to be invited to get into the channels, for it, you have to send a mail to support@alastria.io asking to join the channel giving the following information:

* Name and Organization.
* e-mail address to be added.
* Channel list where to be joined.

### Available channels by default
When you are accepted in the Alastria Slack group, you are automatically included in:

* `#general` General purpose channel (public)
* `#notificaciones` Notifications Github channel (public)

You could self-add to the following channels:

* `#besu-group` Channel for the `red B` team, :beer:

### Open an issue

If you need to open an Issue on the [alastria-node-besu](https://github.com/alastria/alastria-node-besu), please follow the instructions [here](https://help.github.com/articles/creating-an-issue/).

### Create a pull request

If you want to do a Pull Request on the [alastria-node-besu](https://github.com/alastria/alastria-node-besu) repository, please follow [these](https://services.github.com/on-demand/github-cli/open-pull-request-github) instructions.


## FAQ

* How launch an interactive console, for debug problems?

```sh
$ sudo /data/alastria-node-besu/regular/bin/besu --config-file="/data/alastria-node-besu/regular/config/besu/config.toml"
```

* How to know if the node its already permissioned?

```
2021-04-29 14:58:44.465+00:00 | EthScheduler-Services-5 (importBlock) | INFO  | FullImportBlockStep | Import reached block 10145800 (0x82c9..ea34), Peers: 1
```

The last column should show, at least, one "Peer".

* How to know if the node has finished syncing?

Use `eth_syncing` [method](https://web3py.readthedocs.io/en/stable/web3.eth.html#web3.eth.Eth.syncing) to see the synchronization progress:

```sh
$ curl -X POST --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}' http://127.0.0.1:8545
```

* How can I manage the node?

Enable this object at the node: add "ADMIN" to the list of supported methods:

```sh
$ sudo vim /data/alastria-node-besu/regular/config/besu/config.toml

[...]
rpc-http-api=["ADMIN", "ETH","NET","WEB3"]
[...]
```

```sh
$ curl -X POST --data '{"jsonrpc":"2.0","method":"admin_peers","params":[],"id":1}' http://127.0.0.1:8545
$ curl -X POST --data '{"jsonrpc":"2.0","method":"admin_nodeInfo","params":[],"id":1}' http://127.0.0.1:8545
```

Other `ADMIN` methods, in https://besu.hyperledger.org/en/stable/Reference/API-Methods/

* Will the functionality (docker | ansible | whatever) be supported soon? 

It's in your hands! [Alastria](https://alastria.io/en/) is an open group, and everyone is welcome to contribute. If you need any functionality, we will help you :hugs:

* Connection from Remix
(TBD)

* Connection from Truffle
(TBD)

## Links

- [Red B Network Monitor](https://alastria-netstats2.planisys.net:8443/?orgId=1)
- [Red B Block Explorer - Hosted by Eurogestión](http://5.153.57.78)
- [Red B Permissioning DApp - Hosted by Eurogestión](http://5.153.57.78:3000/)

## Other Guides

Internal documentation for `red B` core admins:

* [Red B Initial Schema](docs/AlastriaRedB.png)
* [Alethio Lite Explorer Installation Guide](docs/blockexplorer-installation.md)
* [Permissioning DApp](docs/permissioning-dapp.md)
* [Genesys file Description](docs/about-genesis-file.md)