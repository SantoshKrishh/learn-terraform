data "aws_ami" "test" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.test.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a603f410ddc29c4e"]

  tags = {
    Name = "HelloWorld"
  }

  provisioner "remote-exec" {

    connection {
        type        = "ssh"
        user        = "centos"
        password    = "DevOps321"
        host        = self.public_ip
    }
    inline = [ 
        "sudo labauto ansible",
        "ansible pull -i localhost, -U https://github.com/SantoshKrishh/roboshop-ansible.git roboshop.yml -e env=dev -e role_name=frontend"
    ]
  }
}
