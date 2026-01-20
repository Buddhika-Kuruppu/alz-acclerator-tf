# Azure Landing Zones Terraform Accelerator

This repository uses the Azure Landing Zones (ALZ) IaC Accelerator to deploy and manage the core platform capabilities of Azure landing zone architecture using Terraform.

## Overview

The ALZ Accelerator provides an opinionated approach for deploying Azure landing zones with:
- Pre-configured Terraform modules based on Azure Verified Modules (AVM)
- CI/CD pipeline setup (GitHub or Azure DevOps)
- Automated resource provisioning (storage, identities, permissions)
- Support for hub-spoke networking, management resources, and governance

### Landing Zone Architecture

![Azure Landing Zone Architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/media/azure-landing-zone-architecture-diagram-hub-spoke.svg)

## Getting Started

### Prerequisites

Before using the accelerator, complete the [prerequisites phase](https://azure.github.io/Azure-Landing-Zones/accelerator/1_prerequisites/).

### Usage

The accelerator follows a 3-phase approach:

1. **Planning** - Review the [planning guide](https://azure.github.io/Azure-Landing-Zones/accelerator/0_planning/)
2. **Bootstrap** - Set up the environment with the [bootstrap phase](https://azure.github.io/Azure-Landing-Zones/accelerator/2_bootstrap/)
3. **Run** - Deploy and manage with the [run phase](https://azure.github.io/Azure-Landing-Zones/accelerator/3_run/)

### Configuration

1. **Choose a scenario** from the [scenarios documentation](https://azure.github.io/Azure-Landing-Zones/accelerator/startermodules/terraform-platform-landing-zone/scenarios/)

2. **Update `accelerator/config/platform-landing-zone.tfvars`**:
   - Set `starter_locations` with valid Azure regions
   - Update `defender_email_security_contact` (search for `replace_me@replace_me.com`)
   - Customize other options as needed

3. **Review configuration options** in the [options documentation](https://azure.github.io/Azure-Landing-Zones/accelerator/startermodules/terraform-platform-landing-zone/options/)

4. **Advanced customization** available via the [configuration file](https://azure.github.io/Azure-Landing-Zones/accelerator/startermodules/terraform-platform-landing-zone/configuration/)

## Documentation

- [Azure Landing Zones Terraform](https://azure.github.io/Azure-Landing-Zones/terraform/)
- [Accelerator Documentation](https://azure.github.io/Azure-Landing-Zones/accelerator/)
- [Getting Started Guide](https://azure.github.io/Azure-Landing-Zones/terraform/gettingstarted/)

