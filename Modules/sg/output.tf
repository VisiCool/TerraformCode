output "custom_name" {
  value = aws_security_group.allow_sg_ingress_https.id
}

output "sg-rule_ingress_https" {
  value = aws_security_group_rule.allow_sg_ingress_https.id
}

output "sg-rule_ingress_http" {
  value = aws_security_group_rule.allow_sg_ingress_http.id
}

output "sg-rule_ingress_ssh" {
  value = aws_security_group_rule.allow_sg_ingress_ssh.id
}

output "sg-rule_engress_internet" {
  value = aws_security_group_rule.allow_sg_engress_internet.id
}