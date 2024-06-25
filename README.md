- [Create store bucket file](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm)

- [Get OCIDs](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#Required_Keys_and_OCIDs)

- [Create Pre-Authenticated Requests of the file](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingpreauthenticatedrequests.htm)


```shell
ssh-keygen -t rsa
```

```shell
ssh opc@public_ip -i ~/.ssh/id_rsa
```

```shell
terraform init
  -backend-config="address=https://objectstorage.ap-singapore-1.oraclecloud.com/p/FD58RMnOqCAS68pqhFepGHKVLUMWQanan99Cs0oj3AOMJmDS8ibClvKwRP3xyv--/n/axyyz3fsrayr/b/terraform-state/o/terraform.tfstate"
  --upgrade -reconfigure

terraform apply -auto-approve -input=false --var-file=a1-flex.tfvars
```

```shell
terraform init
    -backend-config="address=https://objectstorage.ap-singapore-1.oraclecloud.com/p/1y_GJB5Qvwzz8xx8Y9SHK8cHGbqsOHwjwvbYvrcjsto1IGN3X1Y_Wzh-j7bcWkI9/n/axyyz3fsrayr/b/terraform-state/o/terraform.tfstate1"
    -reconfigure

terraform apply -input=false --var-file=e2-micro.tfvars
```

# Install MySQL

```shell
yes | sudo yum update
sudo systemctl reboot
sudo dnf install @mysql:8.0 -y
```

# Start MySQL

```shell
sudo systemctl enable --now mysqld
systemctl status mysqld
sudo mysql_secure_installation
```

# Create MySQL user

```shell
mysql -uroot -p
CREATE USER 'user'@'%' IDENTIFIED BY 'P@ssw0rd';
GRANT ALL PRIVILEGES ON _._ TO 'user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

# Disable firewall

```shell
sudo firewall-cmd --state
sudo systemctl stop firewalld
sudo systemctl disable firewalld
```
