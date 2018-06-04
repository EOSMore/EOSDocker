#!/bin/bash

echo "Alias cleos"
shopt -s expand_aliases
alias cleos='docker-compose exec keosd cleos -u http://nodeosd:8888 --wallet-url http://127.0.0.1:8900'

public_key=EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
private_key=5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

echo "Import Wallet"
cleos wallet create > wallet.info
# cleos wallet import ${private_key}
sleep 1

echo "Create System Accounts"
system_accounts=(eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay)
for acc in ${system_accounts[@]}
do
    cleos create account eosio ${acc} ${public_key} ${public_key}
done
sleep 1

echo "Install System Contracts"
cleos set contract eosio.token data-dir/contracts/eosio.token -p eosio.token
cleos set contract eosio.msig data-dir/contracts/eosio.msig -p eosio.msig
sleep 1

echo "Create Tokens"
cleos push action eosio.token create '{"issuer":"eosio", "maximum_supply":"1000000000.0000 EOS", "can_freeze":0, "can_recall":0, "can_whitelist":0}' -p eosio.token
cleos push action eosio.token issue '["eosio","1000000000.0000 EOS","deposit started"]' -p eosio
sleep 1

echo "Set System Contract"
cleos set contract eosio data-dir/contracts/eosio.system -p eosio
sleep 1
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active
sleep 1

