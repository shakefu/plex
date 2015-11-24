# Set up a single spot instance
resource "aws_spot_instance_request" "plex-spot" {
    ami = "ami-73bed013"
    availability_zone = "us-west-1b"
    instance_type = "m2.xlarge"
    security_groups = [ "${aws_security_group.allow_all.id}" ]
    key_name = "plex-spot"

    # user_data = "${file("plex.yml")}"
    # Spot settings
    spot_price = "0.04"
    spot_type = "one-time"

    tags {
        Name = "plex-spot"
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

    tags {
        Name = "allow_all"
    }
}
