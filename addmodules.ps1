$key = '' # add key

$PSpath = ($env:PSModulePath -split ';')[0]

$modules = @(
  'NetworkingDsc'
  'ComputerManagementDsc'
  'xRemoteDesktopAdmin',
  'CertificateDsc',
  'xActiveDirectory',
  'xPendingReboot',
  'WSManDsc'
)

Foreach ($module in $modules)
{
    Publish-Module `
      -Path $($PSPath + "\" + $module) `
      -Repository 'LocalRepository' `
      -NuGetApiKey $key
}