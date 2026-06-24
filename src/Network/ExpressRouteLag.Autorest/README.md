<!-- region Generated -->
# Az.ExpressRouteLag
This directory contains the PowerShell module for the ExpressRouteLag service.

---
## Info
- Modifiable: yes
- Generated: all
- Committed: yes
- Packaged: yes

---
## Detail
This module was primarily generated via [AutoRest](https://github.com/Azure/autorest) using the [PowerShell](https://github.com/Azure/autorest.powershell) extension.

## Module Requirements
- [Az.Accounts module](https://www.powershellgallery.com/packages/Az.Accounts/), version 2.7.5 or greater

## Authentication
AutoRest does not generate authentication code for the module. Authentication is handled via Az.Accounts by altering the HTTP payload before it is sent.

## Development
For information on how to develop for `Az.ExpressRouteLag`, see [how-to.md](how-to.md).
<!-- endregion -->

### AutoRest Configuration
> see https://aka.ms/autorest

``` yaml
require:
  - $(this-folder)/../../readme.azure.noprofile.md
commit: main
input-file:
  - https://github.com/Azure/azure-rest-api-specs/blob/91a24577288d8b917ddf05b79cd66d69227a5285/specification/network/resource-manager/Microsoft.Network/Network/preview/2025-09-01/expressRouteLag.json
  - https://github.com/Azure/azure-rest-api-specs/blob/91a24577288d8b917ddf05b79cd66d69227a5285/specification/network/resource-manager/Microsoft.Network/Network/preview/2025-09-01/network.json

module-version: 0.1.0
root-module-name: $(prefix).Network
title: ExpressRouteLag
subject-prefix: ''
sanitize-names: true

directive:
  # Remove the unexpanded parameter set (v4 directive)
  - where:
      variant: ^(Create|Update)(?!.*?(Expanded|JsonFilePath|JsonString))
    remove: true
  # For New-* cmdlets, ViaIdentity is not required
  - where:
      variant: ^CreateViaIdentity$|^CreateViaIdentityExpanded$
    remove: true
  # Remove the Set-* cmdlet
  - where:
      verb: Set
    remove: true
  # Remove Update-AzExpressRouteLagAuthorization (not supported)
  - where:
      verb: Update
      subject: ExpressRouteLagAuthorization
    remove: true
  # Rename Loa -> LOA for consistency with New-AzExpressRoutePortLOA
  - where:
      verb: New
      subject: ExpressRouteLagLoa
    set:
      subject: ExpressRouteLagLOA
  # Remove readOnly from ChildResource properties so Update serialization includes name/id in PUT body
  - from: swagger-document
    where: $.definitions.ChildResource.properties.name
    transform: delete $.readOnly
  - from: swagger-document
    where: $.definitions.ChildResource.properties.id
    transform: delete $.readOnly
```
