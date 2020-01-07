output "instance_id" {
  value = ["${aws_instance.chef-analyze-node.*.id}"]
}
output "instance_ips" {
  value = ["${aws_instance.chef-analyze-node.*.public_ip}"]
}
output "public_dns" {
  value = ["${aws_instance.chef-analyze-node.*.public_dns}"]
}
