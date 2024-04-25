# Input variables

- **aws_key_name:** SSH Key pair for VPN instance
- **vpc_id:** The VPC id
- **public_subnet_id:** One of the public subnets to create the instance
- **instance_type:** Instance type of the VPN box (t2.small is mostly enought
- **internal_cidrs:** List of CIDRs that will be whitelisted to access the VPN server internally.
- **resource_name_prefix:** All the resources will be prefixed with the value of this variable
- **volume_size:** instance volume size

# Outputs

- **pritunl_private_ip:** Private IP address of the instance
- **pritunl_public_ip:** EIP of the VPN box

# Usage

```
provider "aws" {
  region  = "eu-west-2"
}

module "pritunl" {
  source = "github.com/evildotuk/terraform-aws-pritunl"

  aws_key_name         = "aws_key_name"
  vpc_id               = "${module.vpc.vpc_id}"
  public_subnet_id     = "${module.vpc.public_subnets[1]}"
  instance_type        = "t2.small"
  resource_name_prefix = "my-pritunl"
}
```

**Please Note that it can take few minutes (ideally 3-5 minutes) for provisioner to complete after terraform completes its process. Once completed, you should see Pritunl app on the public IP of instance**

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.oracle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_security_group"></a> [additional\_security\_group](#input\_additional\_security\_group) | Additional security (created outside of module) group(s) | `list` | `[]` | no |
| <a name="input_aws_key_name"></a> [aws\_key\_name](#input\_aws\_key\_name) | SSH keypair name for the VPN instance | `any` | n/a | yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | iam\_instance\_profile - must exist before! | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for VPN Box | `string` | `"t2.small"` | no |
| <a name="input_internal_cidrs"></a> [internal\_cidrs](#input\_internal\_cidrs) | [List] IP CIDRs to whitelist in the pritunl's security group | `list(string)` | `[]` | no |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | One of the public subnet id for the VPN instance | `string` | n/a | yes |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | All the resources will be prefixed with the value of this variable | `string` | `"pritunl"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(any)` | `{}` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | ec2 volume size | `number` | `20` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Which VPC VPN server will be created in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_aws_ami_id"></a> [aws\_ami\_id](#output\_aws\_ami\_id) | n/a |
| <a name="output_aws_instance_id"></a> [aws\_instance\_id](#output\_aws\_instance\_id) | n/a |
| <a name="output_main_security_group_id"></a> [main\_security\_group\_id](#output\_main\_security\_group\_id) | n/a |
| <a name="output_pritunl_private_ip"></a> [pritunl\_private\_ip](#output\_pritunl\_private\_ip) | n/a |
| <a name="output_pritunl_public_ip"></a> [pritunl\_public\_ip](#output\_pritunl\_public\_ip) | n/a |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | n/a |
<!-- END_TF_DOCS -->