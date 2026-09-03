using './main.bicep'

// General Parameters
param parLocations = [
  '<region-1>'
  '<region-2>'
]
param parEnableTelemetry = true

param landingZonesConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'Ambroselandingzones'
  managementGroupParentId: 'Ambrosealz'
  managementGroupIntermediateRootName: 'Ambrosealz'
  managementGroupDisplayName: 'AmbroseLanding Zones'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: ['Enable-DDoS-VNET']
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Enable-DDoS-VNET': {
    parameters: {
      ddosPlan: {
        value: '/subscriptions/e9675c7f-bdba-4d3b-b221-0de7fb4585d8/resourceGroups/rg-p-alz-conn-${parLocations[0]}/providers/Microsoft.Network/ddosProtectionPlans/ddos-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
      logAnalyticsWorkspaceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-ct-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-vmi-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
      userWorkspaceResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/law-alz-${parLocations[0]}'
      }
      dcrResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-mdfcsql-alz-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/0508cca9-12b9-4193-8344-8db7df1b49f1/resourceGroups/rg-p-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-alz-${parLocations[0]}'
      }
    }
  }
}
