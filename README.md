# Terraform_CloudFront_S3_UseCase

#### This repo consist code of terraform by which we can create the AWS resources such as S3, Cloudfront, ec2_instance. Also configuring the Webserver having a simple image url in its html code which is provided by Cloudfront domain name and the object from the S3.
 
## List of steps I had performed:

1. Create a S3 Bucket.
2. Putting an Image as a Object in the S3 bucket.
3. Create a Cloud distribution having the below s3 bucket domain name and getting the new Cloudfront domain name.
4. Creating an EC2 instance.
5. Doing SSH remotly.
6. Configuring the instance having httpd install and service started and also enabled lastly copy a demo html code having mainly an image, which we have uploaded in S3 bucket.

## List of steps you have to perform:

1. Give the default credentials of the AWS provider in provider.tf file.
2. Give your own variable values in the terraform.tfvars file.
3. Run "terraform init" command in the terminal.
4. Run "terraform plan" cmd.
5. Run "terraform apply" cmd.

Lastly it will automatically access the webpage in the chrome browser having the same S3 object but coming from the cloudfront without and delay and secured too.

![](https://visitor-badge.glitch.me/badge?page_id=24-komal.Terraform_CloudFront_S3_UseCase)
