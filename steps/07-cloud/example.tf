provider "aws" {
    profile  = "cloud"
}

resource "aws_instance" "test" {
    ami = "ami-b8b061d0"
    instance_type = "t1.micro"
    provisioner "local-exec" {
        command = "echo ${aws_instance.test.public_ip} > file.txt"
    }
}
