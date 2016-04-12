Docker REMOTE API Caller with curl + jq

# 概要

Docker Machineで作られたDockerホストへのDocker Remote API呼び出し用イメージです。

# Usage

### 書式/引数
```bash

$ docker run (options) yamamotofebc:docker-api-client [APIエンドポイント] [jqコマンド引数]

or

$ docker-compose run (options) docker-api-client [APIエンドポイント] [jqコマンド引数]

```

  ** 現状 GET のみ **
  ** TODO APIエンドポイント指定部分で`POST /some/endpoint`みたいに指定できるように。 **

  - `APIエンドポイント` : 必須。`/images/json`など。詳細は[こちら](https://docs.docker.com/engine/reference/api/docker_remote_api/)を参照ください。
  - `jqコマンド引数` : オプション。デフォルト`.`。

### docker runで実行する場合

```bash

# docker-machineコマンドで環境変数を設定しておく
$ eval $(docker-machine env 対象マシン)

$ docker run -it --rm -e DOCKER_HOST \
             -v /var/run/docker.sock:/var/run/docker \
             -v /etc/docker:/etc/docker \
             yamamotofebc:docker-api-client /images/json

```

### docker-composeで実行する場合

#### 準備

```bash

$ git clone https://github.com/yamamoto-febc/docker-api-client.git
$ cd docker-api-client

```

```bash

$ docker-compose run --rm docker-api-client /images/json

```

