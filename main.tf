resource "aws_instance" "TW_EC2_instance" {
  ami           = "ami-026ebd4cfe2c043b2" # Red Hat Linux AMI
  instance_type = "t2.micro"

  key_name      = aws_key_pair.TW_EC2_Key_pair.key_name
  security_groups = [aws_security_group.TW_sg.name]

  connection {
    type        = "ssh"
    user        = "ec2-user"                
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip             
  }

  provisioner "file" {

    source = "ansible/ansible-playbook.yml"
    destination = "/home/ec2-user/ansible-playbook.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y python3", 
      "curl -O https://bootstrap.pypa.io/get-pip.py",
      "python3 get-pip.py",
      "pip3 install ansible",  # Install Ansible
      "ansible-playbook /home/ec2-user/ansible-playbook.yml",
    ]
  }
  tags = {
    Name = "TW-instance"
  }
}

output "instance_ips" {
  value = aws_instance.TW_EC2_instance.*.public_ip
}

output "mediawiki_urls" {
  value = [
    for ip in aws_instance.TW_EC2_instance.*.public_ip : "http://${ip}/mediawiki"
  ]
}