## Access Management

## Vault


Vault — a tool for securely managing secrets and encrypting data in-transit.


```
docker build -t vault .

# run server
docker run -it --name=vault-srv -v $(pwd)/vault.conf:/root/vault.conf vault server -config /root/vault.conf -dev

docker inspect vault-srv | grep IPAddres
docker inspect -f '{{ .NetworkSettings.IPAddress }}' vault-srv

# run client
docker run --rm -it -e VAULT_ADDR="http://$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' vault-srv):9000" vault status

alias vault='docker run --rm -it -e VAULT_TOKEN='2760a065-6ceb-1c7e-f9eb-935f593ee0eb' -e VAULT_ADDR=$VAULT_ADDR vault'

vault write secret/hello value=world
vault read -format json secret/hello


docker run --rm -it -e VAULT_TOKEN='2760a065-6ceb-1c7e-f9eb-935f593ee0eb' -e VAULT_ADDR=$VAULT_ADDR --entrypoint=/bin/bash vault

vault mount aws
vault write aws/config/root \
  access_key=AKIAI4SGLQPBX6CSENIQ \
  secret_key=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

vault read aws/config/root => 500

role.json
{"Version": "2012-10-17",
 "Statement": [{
    "Sid": "Stmt1426528957000",
    "Effect": "Allow",
    "Action": ["ec2:*"],
    "Resource": ["*"]}]}

vault write aws/roles/deploy policy=@policy.json
vault revoke aws/creds/deploy/0d042c53-aa8a-7ce7-9d
vault read aws/creds/deploy


# real installation
vault init
export VAULT_ADDR='https://vault.aidbox.io:8200'
export VAULT_TOKEN=<root-token>
vault init
vault unseal
vault mount aws
vault auth-enable github
vault auth-enable userpass
vault auth -methods
vault write aws/config/root access_key=<access> secret_key=<secret>
vault read aws/config/root
vault write aws/roles/deploy policy=@role.json
```
