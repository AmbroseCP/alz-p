using './main.bicep'

// General Parameters
param parLocations = [
  'centralus'
  'eastus2'
]
param parEnableTelemetry = true

param platformSecurityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'Ambrosesecurity'
  managementGroupParentId: 'Ambroseplatform'
  managementGroupIntermediateRootName: 'Ambrosealz'
  managementGroupDisplayName: 'AmbroseSecurity'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['061013e1-4c11-42b3-b729-ba65bbd85a4d']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 30
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 30
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 30
  waitForConsistencyCounterBeforePolicyAssignments: 30
  waitForConsistencyCounterBeforeRoleAssignments: 30
  waitForConsistencyCounterBeforeSubPlacement: 30
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-security currently
}
