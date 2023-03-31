################################################
## KopiCloud AD API - Manage Group Membership ##
################################################

// Create Group #1

# Group Name #1
resource "random_string" "random1" {
  length  = 4
  special = false
  upper   = false
}

# Create a Global Security Group #1
resource "kopicloud_security_group" "test_security_global_1" {
  name        = "labtest-${random_string.random1.result}-security-group"
  scope       = "Global"
  description = "This is a very cool Global security group"
  email       = "labtest-${random_string.random1.result}@kopicloud.com"
  ou_path     = var.ou_path
}

# Returns Created Global Security Group #1
//output "OUTPUT_global_security_group_1" {
//  description = "Created Global Security Group"
//  value       = resource.kopicloud_security_group.test_security_global_1
//}

///////////////////////////////////

// Create Group #2

# Group Name #2
resource "random_string" "random2" {
  length  = 6
  special = false
  upper   = false
}

# Create a Global Security Group #2
resource "kopicloud_security_group" "test_security_global_2" {
  name        = "labtest-${random_string.random2.result}-security-group"
  scope       = "Global"
  description = "This is a very cool Global security group"
  email       = "labtest-${random_string.random2.result}@kopicloud.com"
  ou_path     = var.ou_path
}

# Returns Created Global Security Group #1
//output "OUTPUT_global_security_group_2" {
//  description = "Created Global Security Group"
//  value       = resource.kopicloud_security_group.test_security_global_2
//}

///////////////////////////////////

# User Name
resource "random_string" "random3" {
  length  = 3
  special = false
  upper   = false
}

// Create User
resource "kopicloud_user" "test_1" {
  username      = "labtestuser-${random_string.random3.result}"
  password      = "P@ssw0rd"
  first_name    = "Lab Test"
  last_name     = "User ${random_string.random3.result}"
  display_name  = "Lab Test User ${random_string.random3.result}"
  description   = "Lab Test User"
}

//output "OUTPUT_new_user_1" {
//  description = "Created User 1"
//  value       = resource.kopicloud_user.test_1
//}

///////////////////////////////////

# Add User to Group #1
resource "kopicloud_group_membership" "test_1" {
  depends_on = [kopicloud_group_membership.test_1, kopicloud_user.test_1]

  user_name  = kopicloud_user.test_1.username
  group_name = kopicloud_security_group.test_security_global_1.name
}

# Show Group Membership #1
output "OUTPUT_group_membership_1" {
  description = "Added User to an AD Group"
  value       = resource.kopicloud_group_membership.test_1
}

# Add User to Group #2
resource "kopicloud_group_membership" "test_2" {
  depends_on = [kopicloud_group_membership.test_2, kopicloud_user.test_1]

  user_name  = kopicloud_user.test_1.username
  group_name = kopicloud_security_group.test_security_global_2.name
}

# Show Group Membership #2
output "OUTPUT_group_membership_2" {
  description = "Added User to an AD Group"
  value       = resource.kopicloud_group_membership.test_2
}

