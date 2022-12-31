# Adresse ipv4 publique de l'instance Ec2
output "ec2_public_ip" {
  value = aws_instance.web1.public_ip
}

# Db instance address
output "db_instance_address" {
    value = aws_db_instance.project_db.address
}

# Getting the DNS of load balancer
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = "${aws_lb.project_alb.dns_name}"
}
