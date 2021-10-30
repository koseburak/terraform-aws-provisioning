data "http" "myip" {
    url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "dev" {
    name    = "${var.owner}-dev"
    description = "Allow inbound traffic via SSH and NFS"
    vpc_id      = aws_vpc.dev.id

    ingress = [
        {
            description         = "My Public IP"
            protocol            = var.sg_ingress_proto
            from_port           = var.sg_ingress_ssh
            to_port             = var.sg_ingress_ssh
            cidr_blocks         = ["${chomp(data.http.myip.body)}/32"]
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        },
        {
            description         = "NFS Access"
            protocol            = var.sg_ingress_proto
            from_port           = var.sg_ingress_nfs
            to_port             = var.sg_ingress_nfs
            cidr_blocks         = [var.sg_cidr_block]
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]

    egress = [
        {
            description         = "All traffic"
            protocol            = var.sg_egress_proto
            from_port           = var.sg_egress_all
            to_port             = var.sg_egress_all
            cidr_blocks         = [var.sg_cidr_block]
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]

    tags = {
            "Name"  = "${var.owner}-${var.environment}-securitygroup"
    }
}