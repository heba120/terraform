output vpc_id {
    value = module.network.vpc_id
    sensitive = false 
    description = "description"
}

output public-ip {
    value = aws_instance.bastion.public_ip
    sensitive = false 
    description = "description"
}