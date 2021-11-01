resource "aws_vpc" "dev" {
    cidr_block              = var.vpc_cidr_block
    enable_dns_hostnames    = var.vpc_dns_hostnames
    enable_dns_support      = var.vpc_dns_support

    tags = {
            "Name"  = "${var.owner}-${var.environment}-vpc"
    }
}
