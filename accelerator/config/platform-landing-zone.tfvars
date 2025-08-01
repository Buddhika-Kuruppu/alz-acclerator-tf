custom_replacements = {
  names = {
    # Resource group names
    management_resource_group_name                 = "rg-management-$${starter_location_01}"
    connectivity_hub_primary_resource_group_name   = "rg-hub-$${starter_location_01}"
    connectivity_hub_secondary_resource_group_name = "rg-hub-$${starter_location_02}"
    dns_resource_group_name                        = "rg-hub-dns-$${starter_location_01}"
    ddos_resource_group_name                       = "rg-hub-ddos-$${starter_location_01}"
    asc_export_resource_group_name                 = "rg-asc-export-$${starter_location_01}"

    # Resource names
    log_analytics_workspace_name            = "law-management-$${starter_location_01}"
    ddos_protection_plan_name               = "ddos-$${starter_location_01}"
    automation_account_name                 = "aa-management-$${starter_location_01}"
    ama_user_assigned_managed_identity_name = "uami-management-ama-$${starter_location_01}"
    dcr_change_tracking_name                = "dcr-change-tracking"
    dcr_defender_sql_name                   = "dcr-defender-sql"
    dcr_vm_insights_name                    = "dcr-vm-insights"

    # IP Ranges Primary
    # Regional Address Space: 10.0.0.0/16
    primary_hub_address_space                          = "10.0.0.0/16"
    primary_hub_virtual_network_address_space          = "10.0.0.0/22"
    primary_firewall_subnet_address_prefix             = "10.0.0.0/26"
    primary_bastion_subnet_address_prefix              = "10.0.0.64/26"
    primary_gateway_subnet_address_prefix              = "10.0.0.128/27"
    primary_private_dns_resolver_subnet_address_prefix = "10.0.0.160/28"
  }
  resource_group_identifiers = {
    management_resource_group_id           = "/subscriptions/$${subscription_id_management}/resourcegroups/$${management_resource_group_name}"
    ddos_protection_plan_resource_group_id = "/subscriptions/$${subscription_id_connectivity}/resourcegroups/$${ddos_resource_group_name}"
  }
  resource_identifiers = {
    ama_change_tracking_data_collection_rule_id = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_change_tracking_name}"
    ama_mdfc_sql_data_collection_rule_id        = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_defender_sql_name}"
    ama_vm_insights_data_collection_rule_id     = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_vm_insights_name}"
    ama_user_assigned_managed_identity_id       = "$${management_resource_group_id}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$${ama_user_assigned_managed_identity_name}"
    log_analytics_workspace_id                  = "$${management_resource_group_id}/providers/Microsoft.OperationalInsights/workspaces/$${log_analytics_workspace_name}"
    ddos_protection_plan_id                     = "$${ddos_protection_plan_resource_group_id}/providers/Microsoft.Network/ddosProtectionPlans/$${ddos_protection_plan_name}"
  }
  enable_telemetry = true
  tags = {
    deployed_by = "terraform"
    source      = "Azure Landing Zones Accelerator"
  }
  management_resource_settings = {
    automation_account_name      = "$${automation_account_name}"
    location                     = "$${starter_location_01}"
    log_analytics_workspace_name = "$${log_analytics_workspace_name}"
    resource_group_name          = "$${management_resource_group_name}"
    user_assigned_managed_identities = {
        ama = {
            name = "$${ama_user_assigned_managed_identity_name}"
        }
    }
  data_collection_rules = {
    change_tracking = {
      name = "$${dcr_change_tracking_name}"
    }
    defender_sql = {
      name = "$${dcr_defender_sql_name}"
    }
    vm_insights = {
      name = "$${dcr_vm_insights_name}"
    }
  }
 }

 management_group_settings = {
  location           = "$${starter_location_01}"
  architecture_name  = "alz"
  parent_resource_id = "$${root_parent_management_group_id}"
  # Example of how to set default values for policy parameters
  policy_default_values = {
    ama_change_tracking_data_collection_rule_id = "$${ama_change_tracking_data_collection_rule_id}"
    ama_mdfc_sql_data_collection_rule_id        = "$${ama_mdfc_sql_data_collection_rule_id}"
    ama_vm_insights_data_collection_rule_id     = "$${ama_vm_insights_data_collection_rule_id}"
    ama_user_assigned_managed_identity_id       = "$${ama_user_assigned_managed_identity_id}"
    ama_user_assigned_managed_identity_name     = "$${ama_user_assigned_managed_identity_name}"
    log_analytics_workspace_id                  = "$${log_analytics_workspace_id}"
    ddos_protection_plan_id                     = "$${ddos_protection_plan_id}"
    private_dns_zone_subscription_id            = "$${subscription_id_connectivity}"
    private_dns_zone_region                     = "$${starter_location_01}"
    private_dns_zone_resource_group_name        = "$${dns_resource_group_name}"
  }
  # Example of how to place the 3 platform subscriptions under their management groups
  subscription_placement = {
    identity = {
      subscription_id       = "$${subscription_id_identity}"
      management_group_name = "identity"
    }
    connectivity = {
      subscription_id       = "$${subscription_id_connectivity}"
      management_group_name = "connectivity"
    }
    management = {
      subscription_id       = "$${subscription_id_management}"
      management_group_name = "management"
    }
  }
  policy_assignments_to_modify = {
    # Example of how to update a policy assignment parameters for Defender for Cloud
    alzroot = {
      policy_assignments = {
        Deploy-MDFC-Config-H224 = {
          parameters = {
            ascExportResourceGroupName                  = "$${asc_export_resource_group_name}"
            ascExportResourceGroupLocation              = "$${starter_location_01}"
            emailSecurityContact                        = "security_contact@replace_me"
            enableAscForServers                         = "DeployIfNotExists"
            enableAscForServersVulnerabilityAssessments = "DeployIfNotExists"
            enableAscForSql                             = "DeployIfNotExists"
            enableAscForAppServices                     = "DeployIfNotExists"
            enableAscForStorage                         = "DeployIfNotExists"
            enableAscForContainers                      = "DeployIfNotExists"
            enableAscForKeyVault                        = "DeployIfNotExists"
            enableAscForSqlOnVm                         = "DeployIfNotExists"
            enableAscForArm                             = "DeployIfNotExists"
            enableAscForOssDb                           = "DeployIfNotExists"
            enableAscForCosmosDbs                       = "DeployIfNotExists"
            enableAscForCspm                            = "DeployIfNotExists"
          }
        }
      }
    }
    # Example of how to update a policy assignment enforcement mode for DDOS Protection Plan
    connectivity = {
      policy_assignments = {
        Enable-DDoS-VNET = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }
  }
 }
 connectivity_type = "virtual_wan"
# Example for Virtual WAN
connectivity_resource_groups = {
  ddos = {
    name     = "$${ddos_resource_group_name}"
    location = "$${starter_location_01}"
  }
  vwan = {
    name     = "$${connectivity_hub_vwan_resource_group_name}"
    location = "$${starter_location_01}"
  }
  vwan_hub_primary = {
    name     = "$${connectivity_hub_primary_resource_group_name}"
    location = "$${starter_location_01}"
  }
  vwan_hub_secondary = {
    name     = "$${connectivity_hub_secondary_resource_group_name}"
    location = "$${starter_location_02}"
  }
  dns = {
    name     = "$${dns_resource_group_name}"
    location = "$${starter_location_01}"
  }
 }
 virtual_wan_settings = {
    name                = "vwan-$${starter_location_01}"
    resource_group_name = "$${connectivity_hub_vwan_resource_group_name}"
    location            = "$${starter_location_01}"
    ddos_protection_plan = {
        name                = "$${ddos_protection_plan_name}"
        resource_group_name = "$${ddos_resource_group_name}"
        location            = "$${starter_location_01}"
    }
  }
virtual_wan_virtual_hubs = {
  primary = {
    # Example hub network settings for this region
    hub = {
      name = "vwan-hub-$${starter_location_01}"
      resource_group = "$${connectivity_hub_primary_resource_group_name}"
      location       = "$${starter_location_01}"
      address_prefix = "$${primary_hub_address_space}"
    }
    # Example Azure Firewall settings for this region (omit this section if not using Azure Firewall)
    firewall = {
      name     = "fw-hub-$${starter_location_01}"
      sku_name = "AZFW_Hub"
      sku_tier = "Standard"
      zones    = "$${starter_location_01_availability_zones}"
    }
    # Example firewall policy settings for this region (omit this section if not using Azure Firewall)
    firewall_policy = {
      name = "fwp-hub-$${starter_location_01}"
    }
    # Example Virtual Network Gateway settings for this region (omit this section if not using Virtual Network Gateway)
    virtual_network_gateways = {
      # Example ExpressRoute settings for this region (omit this section if not using ExpressRoute)
      express_route = {
        name = "vgw-hub-expressroute-$${starter_location_01}"
      }
      # Example VPN Gateway settings for this region (omit this section if not using VPN Gateway)
      vpn = {
        name = "vgw-hub-vpn-$${starter_location_01}"
      }
    }
    # Example Private DNS Zone settings for this region (omit this section if not using Private DNS Zones)
    private_dns_zones = {
      resource_group_name            = "$${dns_resource_group_name}"
      is_primary                     = true
      auto_registration_zone_enabled = true
      auto_registration_zone_name    = "$${starter_location_01}.azure.local"
      subnet_address_prefix          = "$${primary_private_dns_resolver_subnet_address_prefix}"
      private_dns_resolver = {
        name = "pdr-hub-dns-$${starter_location_01}"
      }
    }
    # Example Bastion Host settings for this region (omit this section if not using Bastion Host)
    bastion = {
      subnet_address_prefix = "$${primary_bastion_subnet_address_prefix}"
      bastion_host = {
        name = "bastion-hub-$${starter_location_01}"
      }
      bastion_public_ip = {
        name  = "pip-bastion-hub-$${starter_location_01}"
        zones = "$${starter_location_01_availability_zones}"
      }
    }
    # Example Side Car Virtual Network settings for this region
    side_car_virtual_network = {
      name          = "vnet-side-car-$${starter_location_01}"
      address_space = ["$${primary_side_car_virtual_network_address_space}"]
    }
  }
 }
}

