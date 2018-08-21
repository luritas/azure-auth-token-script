# Load ADAL Assemblies
$adal = "C:\Program Files\WindowsPowerShell\Modules\AzureRM.Profile\4.6.0\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
$adalforms = "C:\Program Files\WindowsPowerShell\Modules\AzureRM.Profile\4.6.0\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
[System.Reflection.Assembly]::LoadFrom($adal)
[System.Reflection.Assembly]::LoadFrom($adalforms)
# Set Azure AD Tenant name
$adTenant = "baeksunho.onmicrosoft.com" 
# Set well-known client ID for AzurePowerShell
$clientId = "d9a02ff6-de27-4b36-b610-1c1657c94a86" 
# Set redirect URI for Azure PowerShell
$redirectUri = "urn:ietf:wg:oauth:2.0:oob"
# Set Resource App URI as ARM
$resourceAppIdURI = "https://management.azure.com/"
# Set Authority to Azure AD Tenant
$authority = "https://login.windows.net/$adTenant"
# Create Authentication Context tied to Azure AD Tenant
$authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
# Acquire token
$authResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, "always")
# Output bearer token
$authHeader = $authResult.CreateAuthorizationHeader()
$authHeader | Out-File jwt.txt