resource "aws_key_pair" "TW_EC2_Key_pair" {
  key_name   = "TWEC2"
  public_key = file("~/.ssh/id_rsa.pub")
}
