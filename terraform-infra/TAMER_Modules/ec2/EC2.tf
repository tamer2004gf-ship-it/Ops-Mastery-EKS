
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id  
  vpc_security_group_ids = [var.security_group_id]  
  key_name               = var.key_pair_name  


 
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/user_data.sh", {
  github_repo = "https://github.com/tamer2004gf-ship-it/devops-mini-project29.12.25.git"
  APP_USER    = "appuser"
})

  tags = {
    Name        = "Web Server"
    Environment = "Dev"
    Project     = "tf-example"
  }
}
