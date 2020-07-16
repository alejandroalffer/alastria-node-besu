# Regular Pro Node Installation (with Docker Compose)

1. [Install Docker and Docker Compose](#install-docker-and-docker-compose)
2. [Clone Repo](#clone-repo)
3. [Configure Node](#configure-node)
4. [Launch Node](#launch-node)
5. [Stop Node](#stop-node)
6. [Request access to the network](#access)

## Install Docker and Docker Compose

- Follow this guide: (docker-installation.md)

## Clone Repo

Clone repo and navigate to [regular-pro compose directory](../compose/regular-pro-node)

```sh
git clone https://github.com/alastria/alastria-node-besu.git
cd alastria-node-besu/compose/regular-pro-node
```

## Configure Node

### Option A: Setting up a New Node

#### New Orion configuration

Create a password for your orion node private key

```sh
echo passw0rd > keys/orion/passwordFile
```

Generate your orion node key pair. This will prompt you to enter a password, use the same one you used in the passwordFile

```sh
docker container run -v `pwd`/keys/orion:/keys/orion -w /keys/orion -it --rm pegasyseng/orion:1.5.1-SNAPSHOT -g nodekey
```

#### New Besu Configuration

Generate your besu node key and place it under [keys/besu](../compose/regular-pro-node/keys/besu)

```sh
docker container run -v `pwd`/keys/besu:/data -w /data -it --rm hyperledger/besu:1.4 --data-path=/data public-key export --to=/data/key.pub
```

Create a new ethereum account (for example, using metamask) and place its **private key** in the [keys/besu/signer.key](../compose/regular-pro-node/keys/besu/signer.key) file

```sh
echo <signer-account-private-key> > keys/besu/signer.key
```

> :warning: _Write down the value of the **public address** associated to this key pair (it is your **SigningKey Public Address**). You will need it for registering as a Whitelisted Account in the network_

### Option B: Updating an existing Node

### Orion configuration

Enter the password you used for your orion node private key

```sh
echo <your_password> > keys/orion/passwordFile
```

Copy and paste your orion key pair to `keys/orion`

```sh
cp <existing-orion-private-key> keys/orion
cp <existing-orion-public-key> keys/orion
```

TODO: backup orion database (docker-volumes)

#### Besu Configuration

Place the private key of your signer account in the `keys/besu/signer.key` file. If you don allready have a signer key, create a new ethereum account (for example, using metamask) and place its private key in the [keys/besu/signer.key](../compose/regular-pro-node/keys/besu/signer.key) file

```sh
echo <signer-account-private-key> > keys/besu/signer.key
```

Copy your existing node key to `keys/besu`

```sh
cp <besu-node-key> keys/besu
```

Create a docker volume named `regular-node_besu-database`

```sh
docker volume create regular-node_besu-database
```

Copy the contents of your existing node database to the newly created volume. For example

```sh
sudo cp -r ~/alastria-red-b/besu-node/data/database/* /var/lib/docker/volumes/regular-node_besu-database/_data
```

## Launch Node

To launch your node, run

```sh
./start.sh
```

## Stop Node

To stop your node, run

```sh
./stop.sh
```

If you can't execute the scripts, run

```sh
sudo chmod +x ./start.sh ./stop.sh
```

## <a name="access"></a>Request access to the network

For adding your new Regular Pro Node to the Alastria Red B network, please follow this steps:

1. [Get your **enode**](#enode)
2. [Get your **SigningKey Public Address**](#signing_key_public_address)
3. [**Request the Registration of your node** in the network to Alastria Besu Core Team](#request_registration)

### <a name="enode"></a>1. Get your enode

```sh
curl -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' http://127.0.0.1:8545
```

> :warning: _Write down this value (it is your **enode**)_

##### <a name="signing_key_public_address"></a>2. Get your SigningKey Public Address

In [Configure Node](#configure-node) you created a new SigningKey key pair.

> :warning: _Write down the value of the **public address** associated to this key pair (it is your **SigningKey Public Address**)_

### <a name="request_registration"></a>3. Request the registration of your Node

- Follow the [Guide in the Wiki](https://github.com/alastria/alastria-node-besu/wiki#0-permissioning), sending:
  - your **enode** (for registering your Node as a **Whitelisted Node** in the network)
  - your **SigningKey Public Address** (for adding to the Accounts Whitelist)
  - **any Address** you want to send transactions from (for adding to the Accounts Whitelist)
