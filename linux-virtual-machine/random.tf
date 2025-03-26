# Generate a random password with the following requirements:
# - Length: 32 characters
# - At least 3 lowercase letters
# - At least 3 uppercase letters
# - At least 3 digits
# - At least 3 special characters
# - Special characters: !#$%&*()-_=+[]{}<>:?
resource "random_password" "password" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  min_upper        = 3
}

# Generaate a random username
resource "random_pet" "vm_username" {
  length    = 2
  separator = "_"
}