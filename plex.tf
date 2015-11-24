resource "aws_instance" "plex" {
    ami = "ami-0f1fdc4b"
    availability_zone = "us-west-1b"
    instance_type = "m2.xlarge"
    security_groups = [ "allow_all" ]

    user_data = "${file("plex.yml")}"

    tags {
        Name = "plex"
    }

    root_block_device = {
        volume_type = "gp2"
        volume_size = "20"
    }
}

resource "aws_security_group" "allow_all" {
    name = "allow_all"
    description = "Allow all inbound traffic"

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "allow_all"
    }
}
