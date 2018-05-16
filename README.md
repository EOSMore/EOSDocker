# 史上最简单EOS docker配置

## 环境变量
复制`.env.example`到`.env`，配置环境变量
- **EOSIO_VERSION** `eosio/eos`镜像版本，完整列表查看[镜像仓库](https://hub.docker.com/r/eosio/eos/tags/)
- **BLOCK_DATA_PATH** 块数据本地挂载路径
- **HTTP_PORT** 本地HTTP映射端口
- **P2P_PORT** 本地P2P映射端口

## 配置
- 修改`config/`文件夹中的配置

## 启动
```shell
$ docker-compose up -d
```

## 运行cleos命令
通过设置一个别名来运行`cleos`命令
```shell
$ alias cleos='docker-compose exec nodeosd cleos --wallet-url http://localhost:8888'
$ cleos get info
```

## 部署HELLO合约
> 确保在此之前已经部署系统合约并创建`hello`账号

```shell
$ cleos set contract hello data-dir/contracts/hello -p hello
```

## 部署自定义合约
复制自定义合约到`data-dir/contracts`中
```shell
$ cleos set contract custom data-dir/contracts/CUSTOM_CONTRACT -p custom
```