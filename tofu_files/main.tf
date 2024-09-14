resource "aws_instance" "devops-morning-tf-instance1" {
  ami                    = var.AMIS
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE
  key_name               = "ec2-keypair-urgen"
  vpc_security_group_ids = ["sg-0ce1b40650f0b49fe"]
  tags = {
    Name    = "devops_apache2 deploy"
    Project = "DevOps"
  }
  provisioner "file" {
    source      = "deploytomcat.sh"
    destination = "/tmp/deploytomcat.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/deploytomcat.sh",
      "/tmp/deploytomcat.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("/home/vagrant/pipelinemavenapp/tofu_files/ec2-keypair-urgen.pem")
    host        = self.public_ip
  }
}

