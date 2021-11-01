resource "aws_instance" "linux" {
    count = "${length(var.instances_linux)}"

    ami                         = var.instance_ami_linux
    availability_zone           = "${var.aws_region_az[count.index]}"
    instance_type               = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.dev.id]
    subnet_id                   = "${element(aws_subnet.dev-public.*.id, count.index)}"
    key_name                    = var.key_pair
    user_data                   = "${data.template_file.efs_mount.rendered}"

    root_block_device {
        delete_on_termination   = true
        encrypted               = false
        volume_size             = var.root_device_size
        volume_type             = var.root_device_type
    }

    tags = {
        Name                    = "${var.owner}-${var.environment}-${var.aws_region}${var.instances_linux[count.index]}"
        KeepInstanceRunning     = "false"
    }

    volume_tags =  {
        Name        = "${aws_efs_file_system.dev.creation_token}"
    }
}

data "template_file" "efs_mount" {
    template = "${file("templates/efs_mount.tpl")}"

    vars = {
        mount_path  = "${var.efs_mount_path}"
        efs_id      = "${aws_efs_file_system.dev.id}"
    }
}