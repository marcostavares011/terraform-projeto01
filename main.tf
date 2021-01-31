// Escolhendo o provedor, sua versão e região.

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

// Provisionando 2 maquinas para dev usando uma ID de VPC.
resource "aws_instance" "dev" {
  count = 2
  ami = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name = "marcos-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["{aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.bucket_dev]
}

// Provisionando 2 maquinas para DBA dev.
resource "aws_instance" "dba-dev" {
  count = 2
  ami = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name = "marcos-aws"
  tags = {
    Name = "dev${count.index}"
  }
  // Vinculando um security group.
  vpc_security_group_ids = ["{aws_security_group.acesso-ssh.id}"]
  // Vinculando banco de dados a maquina.
  depends_on = [aws_dynamodb_table.database-homolog]
}


