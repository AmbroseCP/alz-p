using './main.bicep'

// General Parameters
param parLocations = [
  'centralus'
  'eastus2'
]
param parEnableTelemetry = true

param platformConnectivityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'Ambroseconnectivity'
  managementGroupParentId: 'Ambroseplatform'
  managementGroupIntermediateRootName: 'Ambrosealz'
  managementGroupDisplayName: 'AmbroseConnectivity'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: ['Enable-DDoS-VNET']
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['e9675c7f-bdba-4d3b-b221-0de7fb4585d8']
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
}
