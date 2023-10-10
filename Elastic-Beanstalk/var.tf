variable "elasticapp" {
  default = "Elastic-Beanstalk-Test-App"
}
variable "beanstalkappenv" {
  default = "Elastic-Beanstalk-Env"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2023 v4.0.4 running Python 3.11"
  # default = "64bit Amazon Linux 2 v5.0.0 running Python 3.8"
}
variable "tier" {
  default = "WebServer"
}
 
variable "vpc_id" {
    default = "vpc-0aaf2aa25ad0ea661"
}
variable "public_subnets" {
    default = ["subnet-0bb5ec94ca757154b", "subnet-0ad361637de63e0d3"]
}