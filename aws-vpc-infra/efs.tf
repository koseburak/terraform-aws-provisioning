resource "aws_efs_file_system" "dev" {
    encrypted           = var.efs_encrypted
    performance_mode    = var.efs_performance_mode
    creation_token      = var.efs_creation_token

    dynamic "lifecycle_policy" {
        for_each = var.efs_transition_to_ia != null ? [var.efs_transition_to_ia] : []
        
        content {
            transition_to_ia = lifecycle_policy.value
        }
    }

    tags = {
            "Name"  = "${var.owner}-${var.environment}-efs"
    }
}

resource "aws_efs_mount_target" "dev" {
    count = length(var.subnet_public_cidrs)

    file_system_id  = aws_efs_file_system.dev.id
    subnet_id       = element(aws_subnet.dev-public.*.id, count.index)
    security_groups = [ aws_security_group.dev.id ]
}
