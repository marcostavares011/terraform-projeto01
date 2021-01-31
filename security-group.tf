// Criando uma VPC que foi usada no provisionamento das 2 maquinas acima.
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

// Liberando as portas 22 para acesso SSH as maquinas
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  // Permissão de IP para acesso 
    cidr_blocks = ["191.32.154.79/32"]
  }
  tags = {
    Name = "ssh"
  }
}