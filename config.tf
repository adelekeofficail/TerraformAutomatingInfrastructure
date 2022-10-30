provider "aws" {

access_key = "AKIAWIVYL3ICKJLEMYXS"

secret_key = "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"

region = "eu-west-1"

}


resource "aws_instance" "instance1" {

ami           = "ami-096800910c1b781ba"

instance_type = "t2.micro"

key_name      = "keytf"

tags          = {

Name          = "sugarland"

Description   = "sugarland server"


}


 connection        {

      type        = "ssh"

      host        = self.public_ip

      user        = "ubuntu"

      private_key = file("/home/adelekegbolahan/terraform/keytf")

      timeout     = "1m"

    }

 }


 resource "aws_security_group" "main" {

    ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
}

egress {

  from_port = 0

  to_port = 0

  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]


  }



}


resource "aws_key_pair" "deployer" {

  key_name   = "keytf"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9EcZBw04UZcV6Yw8bj1beXChiNDYaTAm7e/kmouE4xLYbpqdLGstOAjRvdGXiBYAgeCusUF95xX+QFfsd9LVnjkm5zgpqJGdxHql9mmC3u0Ym6HG2ZcXDl4XelGi03hZDTwIRhpVCBfq+51VDYxE4c6g7q0Xam7DTlfWhWN9GjFXnBV448nA+u7kJdMHmAW9ib0qi5njsWt7ttvviCabUQ5aPzuMBBowXBUmCqBDr6VwWmvXUsNy23Ahwojgt8L2oVaKDivigFf6rvHDMDOyfgL5VzcbQIiIrY1eviZhU1S/s2LDbZlVohUR3vUHj6NeQ4xcogT75u6ivHdDHLiNn root@ip-172-31-24-214"

}

                                        


