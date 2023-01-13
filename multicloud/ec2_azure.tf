provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.example.availability_zone
  size              = 1
}

resource "aws_ebs_volume_attachment" "example" {
  device_name  = "/dev/xvdf"
  volume_id    = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}

resource "azurerm_storage_account" "example" {
  name                     = "storagetfexample"
  resource_group_name      = "storage-rg"
  location                 = "westus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "example-container"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "null_resource" "mount_azure_storage" {
  provisioner "local-exec" {
    command = "echo 'storageAccountKey=$(az storage account keys list --account-name ${azurerm_storage_account.example.name} --resource-group ${azurerm_storage_account.example.resource_group_name} --query '[0].value' -o tsv)
    echo $storageAccountKey
    mkdir /mnt/azure
    sudo mount -t cifs //${azurerm_storage_account.example.name}.file.core.windows.net/${azurerm_storage_container.example.name} /mnt/azure -o vers=3.0,username=${azurerm_storage_account.example.name},password=$storageAccountKey,dir_mode=0777,file_mode=0777' >> /etc/rc.local"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.example.public_ip
    private_key = "${file("path/to/private_key.pem")}"
  }
}


# The above Terraform chart creates an EC2 instance, creates an EBS volume and attaches it to the created EC2 instance, and creates an Azure storage account and container. Then it uses the local-exec provisioner to mount the Azure storage container as the '/mnt/azure' directory on the EC2 instance
