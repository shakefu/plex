resource "aws_spot_instance_request" "plex-spot" {
    count = "0"
    ami = "ami-0f1fdc4b"
    availability_zone = "us-west-1b"
    instance_type = "m2.xlarge"
    security_groups = [ "allow_all" ]

    user_data = "${file("plex.yml")}"
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

    wait_for_fulfillment = true
}

