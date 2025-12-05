#!/bin/bash

# Exit on error
set -e

echo "Destroying Terraform-managed infrastructure..."

# Go to Terraform directory
cd "$(dirname "$0")/../terraform"

# Optional: show plan before destroying
terraform plan -destroy -out=tfplan

# Destroy all resources
terraform destroy -auto-approve

echo "All resources destroyed successfully!"
