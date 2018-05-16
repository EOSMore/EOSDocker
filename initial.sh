#!/bin/sh
alias cleos='docker-compose exec nodeosd cleos --wallet-url http://localhost:8888'
cleos wallet create > wallet.info
cleos create account eosio eosio.bios EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos set contract eosio.bios data-dir/contracts/eosio.bios -p eosio.bios
cleos create account eosio eosio.msig EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos set contract eosio.msig data-dir/contracts/eosio.msig -p eosio.msig
cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos set contract eosio.token data-dir/contracts/eosio.token -p eosio.token
cleos push action eosio.token create '{"issuer":"eosio", "maximum_supply":"1000000000.0000 EOS", "can_freeze":0, "can_recall":0, "can_whitelist":0}' -p eosio.token
cleos push action eosio.token issue '["eosio","1000000000.0000 EOS","deposit started"]' -p eosio
cleos set contract eosio data-dir/contracts/eosio.system -p eosio
