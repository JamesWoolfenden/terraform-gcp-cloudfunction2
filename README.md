# terraform-gcp-cloudfunction2

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/actions)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-cloudfunction2.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-cloudfunction2.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-cloudfunction2/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction2&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-cloudfunction2/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction2&benchmark=INFRASTRUCTURE+SECURITY)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-cloudfunction2/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-cloudfunction2&benchmark=CIS+GCP+V1.1)

The working cloudfunction2 module and example.

## Usage

Add **module.cloudfunction2.tf** to your code:-

```terraform
module cloudfunction2 {
    source        ="jameswoolfenden/cloudfunction2/gcp"
    version       = "0.0.4"
    common_tags   = var.common_tags
    lambda        = var.lambda
    project       = var.project
    region        = var.region
    source_zip_path = var.source_zip_path
}
```

See **examplea.auto.tfvars** for the data to drive the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_member) | resource |
| [google_cloud_scheduler_job.invoke_cloud_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloudfunctions2_function.function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function_iam_member) | resource |
| [google_kms_crypto_key_iam_member.crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_member) | resource |
| [google_service_account.account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket_object.archive](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [random_string.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body"></a> [body](#input\_body) | n/a | `string` | n/a | yes |
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | n/a | `string` | n/a | yes |
| <a name="input_entry_point"></a> [entry\_point](#input\_entry\_point) | n/a | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | n/a | `map(any)` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | n/a | `string` | n/a | yes |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | n/a | `string` | `"invoke-btdelete"` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_retry_config"></a> [retry\_config](#input\_retry\_config) | n/a | <pre>object({<br>    max_backoff_duration = string<br>    max_doublings        = number<br>    max_retry_duration   = string<br>    min_backoff_duration = string<br>    retry_count          = number<br>  })</pre> | <pre>{<br>  "max_backoff_duration": "3600s",<br>  "max_doublings": 5,<br>  "max_retry_duration": "0s",<br>  "min_backoff_duration": "5s",<br>  "retry_count": 0<br>}</pre> | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | n/a | `string` | `"0 0 * * *"` | no |
| <a name="input_source_zip_path"></a> [source\_zip\_path](#input\_source\_zip\_path) | n/a | `string` | n/a | yes |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | n/a | `string` | `"America/Los_Angeles"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | n/a |
| <a name="output_auth"></a> [auth](#output\_auth) | n/a |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | n/a |
| <a name="output_files"></a> [files](#output\_files) | n/a |
| <a name="output_function"></a> [function](#output\_function) | n/a |
| <a name="output_job"></a> [job](#output\_job) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.cryptoKeys.setIamPolicy",
    "cloudscheduler.jobs.create",
    "cloudscheduler.jobs.delete",
    "cloudscheduler.jobs.enable",
    "cloudscheduler.jobs.get",
    "cloudscheduler.jobs.update",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update",
    "resourcemanager.projects.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction2/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-gcp-cloudfunction2/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2023 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
