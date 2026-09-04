using './main.bicep'

// General Parameters
param parLocations = [
  'centralus'
  'eastus2'
]
param parEnableTelemetry = true

param platformManagementConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'Ambrosemanagement'
  managementGroupParentId: 'Ambroseplatform'
  managementGroupIntermediateRootName: 'Ambrosealz'
  managementGroupDisplayName: 'AmbroseManagement'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['0508cca9-12b9-4193-8344-8db7df1b49f1']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-management currently
}
