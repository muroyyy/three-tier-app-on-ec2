output "alb_dns" {
  description = "DNS name of the ALB"
  value       = aws_lb.app_alb.dns_name
}
