resource "random_pet" "username" {
  length    = 2   # Number of words in the generated name
  separator = "-" # Separator between words
}

resource "random_password" "password" {
  length           = 32
  min_lower        = 4
  min_numeric      = 4
  min_special      = 4
  min_upper        = 4
  override_special = "!#$%&*-_=+[]{}:?"
}
