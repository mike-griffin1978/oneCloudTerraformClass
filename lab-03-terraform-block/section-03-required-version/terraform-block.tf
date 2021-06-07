# Terraform Block
# Lab assumes a current Terraform version of 0.15.4.  If the current version is not 0.15.4 - replace the
# current version specific tests with that version
terraform {
  required_version = "= 0.15.4"
}

/*
---Attempt the followimg specifications for the required_version (Terraform Version) in the above manifest
---Following each version below are details on the expected results
---While there are other operators not tested in these examples (I.e. !=, >, >=, etc) - the most popular
---operators (~> and =) are studied.
---Feel free to experiment further with other operators if interested and via documentation within:
https://www.terraform.io/docs/language/expressions/version-constraints.html


  required_version = "~> 0.15.1"
  ---Above version should allow successful initialization. The "~>" states that any minor upgrade
  ---of the the rightmost digit will be allowed.  In this case any 0.15.1 version or above will pass.
  ---However a major version upgrade would not be allowed (I.e. 0.16.1)
  ---Note that while it is possible to allow any major release or above using ~> 0.15 (I.e) this is not
  ---recommended.  Often major release upgrades introduce substaintail - possibly breaking change - and we
  ---want to ensure that the version is locked down to the major release we developed against.
  required_version = "~> 0.14.1"
  ---Above version should fail as our 0.15 version is not a minor version upgrade of specified 0.14.X version
  required_version = "= 0.15.4"
  ---Above version should succeed as this analysis uses the equality operator and matches our current version
  required_version = "= 0.14.4"
  ---Above version should fail as this analysis uses the equality operator and does not match our current version
*/

