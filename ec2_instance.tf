
resource "aws_instance" "myin" {
  depends_on = [
    aws_cloudfront_distribution.s3_distribution
  ] 
  
  #Amazon Linux 2 ami
  ami  = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"  
  security_groups = [ "${var.security_group_name}" ]

  tags = {
    Name = "${var.instance_name}"
   }
}

output "outip" {
   value = aws_instance.myin.public_ip
   }


resource "null_resource" "command" {
  depends_on = [
    aws_instance.myin
  ]
  connection {
      type     = "ssh"
      user     = "ec2-user"
      # private_key = file("C:/Users/Education/Downloads/mykey.pem")
      private_key = file("${var.private_key_location_in_pem}")
      host = aws_instance.myin.public_ip
    }

  provisioner "remote-exec" {
    inline = [
        "sudo yum install httpd  -y",
        "sudo systemctl restart httpd",
        "sudo systemctl enable httpd",
        "sudo echo -e '<body bgcolor='aqua'>\n<h1><center>Use-Case of Cloudfront & S3 in AWS using Terraform</center></h1>\n<center><image src='http://${aws_cloudfront_distribution.s3_distribution.domain_name}/${aws_s3_bucket_object.image_upload.key}' height='50%' width='80%'></center>\n</body>' > index.html",
        "sudo mv * /var/www/html/",
        "sudo cat /var/www/html/index.html",
      ]
  }
  provisioner "local-exec" {
    command = "chrome http://${ aws_instance.myin.public_ip }"
  }
}
