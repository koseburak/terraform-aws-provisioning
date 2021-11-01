resource "aws_route_table" "dev" {
    vpc_id  = aws_vpc.dev.id

    route {
        cidr_block  = var.route_table_cidr_block
        gateway_id = aws_internet_gateway.dev.id
    }

    tags = {
            "Name"  = "${var.owner}-${var.environment}-routetable"
    }
}

resource "aws_route_table_association" "dev" {
    count = "${length(var.subnet_public_cidrs)}"

    subnet_id       = "${element(aws_subnet.dev-public.*.id, count.index)}"
    route_table_id  = aws_route_table.dev.id
}