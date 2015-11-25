resource "aws_instance" "plex" {
    count = "0"
    ami = "ami-0f1fdc4b"
    availability_zone = "us-west-1b"
    instance_type = "m2.xlarge"
    security_groups = [ "allow_all" ]
    key_name = "plex"

    user_data = "${file("plex.yml")}"

    tags {
        Name = "plex"
    }

    root_block_device = {
        volume_type = "gp2"
        volume_size = "20"
    }
}

