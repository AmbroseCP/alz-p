using './main-rbac.bicep'

param parPlatformManagementGroupName = 'Ambroseplatform'
param parConnectivityManagementGroupName = 'Ambroseconnectivity'
param parManagementGroupExcludedPolicyAssignments = ['Enable-DDoS-VNET']
param parEnableTelemetry = true
