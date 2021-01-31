// Criando um banco de dados
resource "aws_dynamodb_table" "database-homolog" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  hash_key       = "UserId"
  range_key      = "GameTitle"


    attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

}