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

## Deploy using gcloud

### Deploy using startup sript

```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup-script.sh
```

### Firewall rule creation

```
gcloud compute firewall-rules create default-puma-server \
    --direction=INGRESS
    --priority=1000
    --network=default
    --action=ALLOW
    --rules=tcp:9292
    --target-tags=puma-server
```

## Create images with packer

Commands below should be executed from the packer directory

Create reddit-base image with configured services:
```
packer build ubuntu16.json
```

Create reddit-full image with configured application:
```
packer build immutable.json
```

You can specify file with variables using ```-var-file=file.json``` flag

### Description of infrastructure using terraform

Infrastructure described in ```main.tf``` file in terraform/ directory.

It's necessary to add ```.tfvars``` file with defined variables.

To add ssh keys to the metadata describe ```public_key_path``` variable that
should contain path to the file with ssh keys. Keys must be in format:
```
[USERNAME_1]:ssh-rsa [KEY_VALUE_1] [USERNAME_1]
[USERNAME_2]:ssh-rsa [KEY_VALUE_2] [USERNAME_2]
```

All keys that will be added without describing them in the terraform file will
be deleted with next ```terraform apply```
