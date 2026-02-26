resource "cloudflare_dns_record" "api_dns_record" {
  zone_id = "12bff830f7c794620444ce897cc736d1"
  name = "deepak-api.deepak-shahi.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.deepak-instance.public_ip}"
  proxied = true
}
resource "cloudflare_dns_record" "frontend_dns_record" {
  zone_id = "12bff830f7c794620444ce897cc736d1"
  name = "deepak.deepak-shahi.com.np"
  ttl = 1
  type = "A"
  content = "${aws_instance.deepak-instance.public_ip}"
  proxied = true
}