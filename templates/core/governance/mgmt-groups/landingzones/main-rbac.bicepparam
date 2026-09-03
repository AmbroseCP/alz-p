using './main-rbac.bicep'

param parLandingZonesManagementGroupName = 'Ambroselandingzones'
param parPlatformManagementGroupName = 'Ambroseplatform'
param parConnectivityManagementGroupName = 'Ambroseconnectivity'
param parManagementGroupExcludedPolicyAssignments = ['Enable-DDoS-VNET']
param parEnableTelemetry = true
