provider "aws" {
  region = "us-west-2"
# creds will be used of default profile present at ~/.aws/credentials
}



resource "aws_iam_user" "test" {
    name = "test_user"
    tags = {
      name = "Demo Test User "
    }
  

}