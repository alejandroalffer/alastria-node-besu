# Regular Node Installation (with Docker Compose)

1. [Docker and Docker Compose installation](#docker-and-docker-compose-installation)
2. [Clone Repo](#clone-repo)
3. [New Node](#new-node)
   - [New Besu Configuration](#new-besu-configuration)
4. [Existing Node](#existing-node)
   - [Besu Configuration](#besu-configuration)
5. [Launch Node](#launch-node)
6. [Stop Node](#stop-node)
7. [Request access to the network](#access)

## Docker and Docker Compose installation

Follow this guide: [Docker Installation](https://docs.docker.com/get-docker/)
Follow this guide: [Docker Compose Installation](https://docs.docker.com/compose/install/)

## Clone Repo

Clone repo and navigate to [regular compose directory](../compose/regular-node)

```sh
git clone https://github.com/alastria/alastria-node-besu.git
cd alastria-node-besu/compose/regular-node
```

## New Node

### New Besu Configuration

Generate your besu node key and place it under [keys/besu](../compose/regular-node/keys/besu)

```sh
docker container run -v `pwd`/keys/besu:/data -w /data -it --rm hyperledger/besu:1.4 --data-path=/data public-key export --to=/data/key.pub
```

Create a new ethereum account (for example, using metamask) and place its private key in the [keys/besu/signer.key](../compose/regular-node/keys/besu/signer.key) file

```sh
echo <signer-account-private-key> > keys/besu/signer.key
```

## Existing Node

### Besu Configuration

Place the private key of your signer account in the `keys/besu/signer.key` file. If you don allready have a signer key, create a new ethereum account (for example, using metamask) and place its private key in the [keys/besu/signer.key](../compose/regular-node/keys/besu/signer.key) file

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
docker-compose up -d
```

(The -d flag is to run in detached mode)

## Stop Node

To stop your node, run

```sh
docker-compose down
```

## <a name="access"></a>Request access to the network

For adding your new validator Node to the Alastria Red B network, please follow this steps:

1. [Get your **enode**](#enode)
2. [**Request the Registration of your node** in the network to Alastria Besu Core Team](#request_registration)

### <a name="enode"></a>1. Get your enode

```sh
curl -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' http://127.0.0.1:8545
```

> :warning: _Write down this value (it is your **enode**)_

### <a name="request_registration"></a>3. Request the registration of your Node

- Follow the [Guide in the Wiki](https://github.com/alastria/alastria-node-besu/wiki#0-permissioning), sending:
  - your **enode** (for registering your Node as a **Whitelisted Node** in the network)
