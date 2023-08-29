## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 3.0  |

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)    | ~> 3.0  |
| <a name="provider_http"></a> [http](#provider_http) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                             | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [aws_ecr_lifecycle_policy.cleanup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy)             | resource    |
| [aws_ecr_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository)                            | resource    |
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                   | resource    |
| [aws_iam_instance_profile.profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile)             | resource    |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                  | resource    |
| [aws_iam_policy_attachment.attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment)            | resource    |
| [aws_iam_role.ecr_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                    | resource    |
| [aws_instance.bastion_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                            | resource    |
| [aws_instance.jenkins_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                            | resource    |
| [aws_instance.web_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                                | resource    |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                          | resource    |
| [aws_key_pair.ssh_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)                                     | resource    |
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)                                                     | resource    |
| [aws_lb_listener.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                               | resource    |
| [aws_lb_listener.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                                   | resource    |
| [aws_lb_listener_rule.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)                     | resource    |
| [aws_lb_listener_rule.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)                         | resource    |
| [aws_lb_target_group.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)                       | resource    |
| [aws_lb_target_group_attachment.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource    |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                   | resource    |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                               | resource    |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                | resource    |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)       | resource    |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)        | resource    |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                         | resource    |
| [aws_security_group.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                         | resource    |
| [aws_security_group.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                          | resource    |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                  | resource    |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                   | resource    |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                  | resource    |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)            | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                    | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                                      | data source |
| [http_http.laptop_outbound_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                             | data source |

## Inputs

| Name                                                                                                   | Description                                          | Type                                                                                                                                                                              | Default                   | Required |
| ------------------------------------------------------------------------------------------------------ | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- | :------: |
| <a name="input_access_key"></a> [access_key](#input_access_key)                                        | n/a                                                  | `any`                                                                                                                                                                             | n/a                       |   yes    |
| <a name="input_bastion_instance"></a> [bastion_instance](#input_bastion_instance)                      | The attribute of bastion information                 | <pre>object({<br> name = string<br> os_type = string<br> instance_type = string<br> volume_size = number<br> volume_type = string<br> availability_zone = string<br> })</pre>     | n/a                       |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                     | The name of the environment.                         | `string`                                                                                                                                                                          | n/a                       |   yes    |
| <a name="input_jenkins_instance"></a> [jenkins_instance](#input_jenkins_instance)                      | The attribute of jenkins information                 | <pre>object({<br> name = string<br> os_type = string<br> instance_type = string<br> volume_size = number<br> volume_type = string<br> availability_zone = string<br> })</pre>     | n/a                       |   yes    |
| <a name="input_linux_ami"></a> [linux_ami](#input_linux_ami)                                           | linux ami                                            | `string`                                                                                                                                                                          | `"ami-0c802847a7dd848c0"` |    no    |
| <a name="input_private_security_groups"></a> [private_security_groups](#input_private_security_groups) | The attribute of private_security_groups information | <pre>list(object({<br> name = string<br> from_port = number<br> to_port = number<br> protocol = string<br> cidr_blocks = list(string)<br> }))</pre>                               | n/a                       |   yes    |
| <a name="input_project"></a> [project](#input_project)                                                 | The name of the project.                             | `string`                                                                                                                                                                          | n/a                       |   yes    |
| <a name="input_public_key"></a> [public_key](#input_public_key)                                        | The machine ssh key                                  | `any`                                                                                                                                                                             | n/a                       |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                    | n/a                                                  | `string`                                                                                                                                                                          | `"us-east-1"`             |    no    |
| <a name="input_secret_key"></a> [secret_key](#input_secret_key)                                        | n/a                                                  | `any`                                                                                                                                                                             | n/a                       |   yes    |
| <a name="input_ubuntu_ami"></a> [ubuntu_ami](#input_ubuntu_ami)                                        | ubuntu ami                                           | `string`                                                                                                                                                                          | `"ami-01e076d5c9e040974"` |    no    |
| <a name="input_vpc"></a> [vpc](#input_vpc)                                                             | The attribute of VPC information                     | <pre>object({<br> name = string<br> cidr_block = string<br> enable_dns_hostnames = bool<br> number_of_public_subnets = number<br> number_of_private_subnets = number<br> })</pre> | n/a                       |   yes    |
| <a name="input_web_instance"></a> [web_instance](#input_web_instance)                                  | The attribute of web instance information            | <pre>object({<br> name = string<br> os_type = string<br> instance_type = string<br> volume_size = number<br> volume_type = string<br> availability_zone = string<br> })</pre>     | n/a                       |   yes    |
| <a name="input_web_security_groups"></a> [web_security_groups](#input_web_security_groups)             | The attribute of web_security_groups information     | <pre>list(object({<br> name = string<br> from_port = number<br> to_port = number<br> protocol = string<br> cidr_blocks = list(string)<br> }))</pre>                               | n/a                       |   yes    |

## Outputs

| Name                                                                                                  | Description |
| ----------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_alb_dns"></a> [alb_dns](#output_alb_dns)                                              | n/a         |
| <a name="output_bastion_public_ip"></a> [bastion_public_ip](#output_bastion_public_ip)                | n/a         |
| <a name="output_jenkins_public_ip"></a> [jenkins_public_ip](#output_jenkins_public_ip)                | n/a         |
| <a name="output_web_instance_public_ip"></a> [web_instance_public_ip](#output_web_instance_public_ip) | n/a         |
