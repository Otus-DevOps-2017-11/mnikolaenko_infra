### Connect through bastion to internalhost

```
ssh -i <ssh private key> -t -A <username>@<external bastion IP> \
ssh <username>@<internalhost IP>
```

### Connect using `ssh internalhost`

```
cat >> ~/.ssh/config << EOF
Host bastion
Hostname <external bastion IP>
Port 22
User appuser
IdentityFile <private ssh key>

Host internalhost
Hostname <internal internalhost IP>
Port 22
User appuser
ProxyJump bastion
EOF
```

### Hosts information

bastion
exteranl IP: 35.195.3.199
internal IP: 10.132.0.2

someinternalhost
internal IP: 10.132.0.3
