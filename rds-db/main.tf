provider "aws" {
  region                  = "us-east-1"
}

resource "aws_rds_cluster" "test" {
  db_subnet_group_name = "nondefault"
  vpc_security_group_ids = ["sg-0775d84e2d5a4c1da"]
  master_username = "asdfasdf"
  master_password = "asdf1234!!"
}

resource "aws_rds_cluster_instance" "ins1" {
  db_subnet_group_name = "nondefault"
  cluster_identifier = aws_rds_cluster.test.id
  instance_class = "db.r4.large"
  engine             = aws_rds_cluster.test.engine
  engine_version     = aws_rds_cluster.test.engine_version
  publicly_accessible = true
}

resource "aws_rds_cluster_instance" "ins2" {
  db_subnet_group_name = "nondefault"
  cluster_identifier = aws_rds_cluster.test.id
  instance_class = "db.r4.large"
  engine             = aws_rds_cluster.test.engine
  engine_version     = aws_rds_cluster.test.engine_version
  publicly_accessible = true
}