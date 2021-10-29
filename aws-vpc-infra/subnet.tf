resource "aws_subnet" "dev-public" {
    count = "${length(var.subnet_public_cidrs)}"

    vpc_id                  = aws_vpc.dev.id
    map_public_ip_on_launch = var.subnet_public_ip
    cidr_block              = "${var.subnet_public_cidrs[count.index]}"
    availability_zone       = "${var.aws_region_az[count.index]}"

    tags = {
            "Name"  = "${var.owner}-${var.environment}-subnet-public"
    }
}