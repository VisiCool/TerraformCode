<<<<<<< HEAD
#     terraform {
#       backend "remote" {
#         # The name of your Terraform Cloud organization.
#         organization = "example-organization"
#
#         # The name of the Terraform Cloud workspace to store Terraform state files in.
#         workspaces {
#           name = "example-workspace"
#         }
#       }
#     }
#
#     # An example resource that does nothing.
#     resource "null_resource" "example" {
#       triggers = {
#         value = "A example resource that does nothing!"
#       }
#     }
=======
    terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "Terraform-Module-repo"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "TF-module_main_branch"
        }
      }
    }

    # An example resource that does nothing.
    resource "null_resource" "example" {
      triggers = {
        value = "A example resource that does nothing!"
      }
    }
>>>>>>> 654f11c907d4c00940318a6c573926a505829f7e