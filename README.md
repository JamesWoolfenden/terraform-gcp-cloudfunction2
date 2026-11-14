# terraform-gcp-cloudfunction2

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/actions)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-cloudfunction2.svg)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-cloudfunction2.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-cloudfunction2/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

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
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_cloud_run_service_iam_binding.invokers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_binding) | resource |
| [google_cloud_scheduler_job.invoke_cloud_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloudfunctions2_function.core](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_cloudfunctions2_function_iam_binding.viewers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function_iam_binding) | resource |
| [google_cloudfunctions2_function_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function_iam_member) | resource |
| [google_storage_bucket_object.archive](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [random_string.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_available_memory"></a> [available\_memory](#input\_available\_memory) | Amount of memory allocated to the Cloud Function. | `string` | `"256M"` | no |
| <a name="input_body"></a> [body](#input\_body) | Request body for the Cloud Function invocation. | `string` | n/a | yes |
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | Name of the storage bucket used by the function. | `string` | n/a | yes |
| <a name="input_entry_point"></a> [entry\_point](#input\_entry\_point) | Entry point symbol for the Cloud Function. | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Environment variables for the Cloud Function. | `map(any)` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the Cloud Function to deploy. | `string` | n/a | yes |
| <a name="input_function_viewers"></a> [function\_viewers](#input\_function\_viewers) | Principals granted roles/cloudfunctions.viewer on the function, authoritatively for that role. Empty to create no binding | `list(string)` | `[]` | no |
| <a name="input_invoker_serviceaccount_email"></a> [invoker\_serviceaccount\_email](#input\_invoker\_serviceaccount\_email) | Email address of the service account authorized to invoke the Cloud Function and used as the Cloud Scheduler OIDC caller identity. Keep this distinct from serviceaccount\_email so the function's runtime identity cannot also trigger itself. | `string` | n/a | yes |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | Name of the scheduled Cloud Scheduler job. | `string` | `"invoke-btdelete"` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | KMS key identifier used for encryption or access. | `string` | n/a | yes |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | KMS key name for encryption. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | GCP region to deploy resources. | `string` | n/a | yes |
| <a name="input_max_instance_count"></a> [max\_instance\_count](#input\_max\_instance\_count) | Maximum number of function instances. | `number` | `1` | no |
| <a name="input_min_instance_count"></a> [min\_instance\_count](#input\_min\_instance\_count) | Minimum number of function instances to keep warm. | `number` | `0` | no |
| <a name="input_project"></a> [project](#input\_project) | GCP project ID. | `string` | n/a | yes |
| <a name="input_retry_config"></a> [retry\_config](#input\_retry\_config) | Retry configuration for Cloud Scheduler. | <pre>object({<br/>    max_backoff_duration = string<br/>    max_doublings        = number<br/>    max_retry_duration   = string<br/>    min_backoff_duration = string<br/>    retry_count          = number<br/>  })</pre> | <pre>{<br/>  "max_backoff_duration": "3600s",<br/>  "max_doublings": 5,<br/>  "max_retry_duration": "600s",<br/>  "min_backoff_duration": "5s",<br/>  "retry_count": 3<br/>}</pre> | no |
| <a name="input_run_invokers"></a> [run\_invokers](#input\_run\_invokers) | Principals granted roles/run.invoker on the function's underlying Cloud Run service, authoritatively for that role. Empty to create no binding | `list(string)` | `[]` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime environment for the Cloud Function. | `string` | `"go122"` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | Cron schedule for the Cloud Scheduler job. | `string` | `"0 0 * * *"` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Secrets to expose to the Cloud Function. | <pre>list(object({<br/>    key     = string<br/>    secret  = string<br/>    version = string<br/>  }))</pre> | n/a | yes |
| <a name="input_serviceaccount_email"></a> [serviceaccount\_email](#input\_serviceaccount\_email) | Email address of the service account the Cloud Function runs as. | `string` | n/a | yes |
| <a name="input_source_zip_path"></a> [source\_zip\_path](#input\_source\_zip\_path) | Local path to the zipped source archive. | `string` | n/a | yes |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | Time zone for the scheduler. | `string` | `"America/Los_Angeles"` | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Maximum function execution time in seconds. | `number` | `60` | no |
| <a name="input_vpc_connector"></a> [vpc\_connector](#input\_vpc\_connector) | Name of the VPC connector for the Cloud Function. | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_account"></a> [account](#output\_account) | The email of the service account the Cloud Function runs as. |
| <a name="output_auth"></a> [auth](#output\_auth) | The IAM member that allows the Cloud Scheduler to invoke the Cloud Function. |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The name of the Google Storage Bucket used for Cloud Function source code. |
| <a name="output_files"></a> [files](#output\_files) | The archive file uploaded to the Google Storage Bucket. |
| <a name="output_function"></a> [function](#output\_function) | The Cloud Function resource created by the module. |
| <a name="output_invoker_account"></a> [invoker\_account](#output\_invoker\_account) | The email of the service account authorized to invoke the Cloud Function. |
| <a name="output_job"></a> [job](#output\_job) | The Cloud Scheduler job that triggers the Cloud Function. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.delete",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.setIamPolicy",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "cloudscheduler.jobs.create",
    "cloudscheduler.jobs.delete",
    "cloudscheduler.jobs.enable",
    "cloudscheduler.jobs.get",
    "cloudscheduler.jobs.update",
    "run.services.getIamPolicy",
    "run.services.setIamPolicy",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list"
  ]
}

# plan role
resource "google_project_iam_custom_role" "terraform_pike_plan" {
  project     = "pike-477416"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "A user with least privileges"
  permissions = [
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.operations.get",
    "cloudscheduler.jobs.get",
    "run.services.getIamPolicy",
    "storage.objects.list"
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

Copyright © 2019-2026 James Woolfenden

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
