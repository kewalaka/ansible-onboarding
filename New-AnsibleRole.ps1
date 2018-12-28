# I know this can be done with ansible-galaxy init - but useful when authoring on Windows...
# e.g. to make a base-server role
# . .\New-AnsibleRole.ps1 base-server
param (
  [Parameter(Mandatory=$true)]
  $rolename
)

New-Item ".\$rolename\defaults\main.yml" -Force
New-Item ".\$rolename\files" -itemType Directory
New-Item ".\$rolename\handlers\main.yml" -Force
New-Item ".\$rolename\meta\main.yml" -Force
New-Item ".\$rolename\tasks\main.yml" -Force
New-Item ".\$rolename\templates" -itemType Directory
New-Item ".\$rolename\tests\inventory" -Force
New-Item ".\$rolename\tests\test.yml" -Force
New-Item ".\$rolename\vars\main.yml" -Force
New-Item ".\$rolename\README.md" -Force

$metadata = @"

galaxy_info:
  role_name: $rolename
  author: kewalaka
  description: 
  company: 

  license: BSD

  min_ansible_version: 1.2

  # If this a Container Enabled role, provide the minimum Ansible Container version.
  # min_ansible_container_version:

  # Optionally specify the branch Galaxy will use when accessing the GitHub
  # repo for this role. During role install, if no tags are available,
  # Galaxy will use this branch. During import Galaxy will access files on
  # this branch. If Travis integration is configured, only notifications for this
  # branch will be accepted. Otherwise, in all cases, the repo's default branch
  # (usually master) will be used.
  #github_branch:

  #
  # platforms is a list of platforms, and each platform has a name and a list of versions.
  #
  # platforms:
  # - name: Fedora
  #   versions:
  #   - all
  #   - 25
  # - name: SomePlatform
  #   versions:
  #   - all
  #   - 1.0
  #   - 7
  #   - 99.99

  galaxy_tags: []
    # List tags for your role here, one per line. A tag is a keyword that describes
    # and categorizes the role. Users find roles by searching for tags. Be sure to
    # remove the '[]' above, if you add tags to this list.
    #
    # NOTE: A tag is limited to a single word comprised of alphanumeric characters.
    #       Maximum 20 tags per role.

dependencies: []
  # List your role dependencies here, one per line. Be sure to remove the '[]' above,
  # if you add dependencies to this list.

"@

$metadata | Add-Content -Path ".\$rolename\meta\main.yml"