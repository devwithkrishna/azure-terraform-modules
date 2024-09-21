
#!/bin/bash

# Ensure the 'tree' command is installed
if ! command -v tree &> /dev/null; then
    echo "'tree' command not found. Please install it to use this script."
    exit 1
fi

# Define the output file (README.md in the root directory)
readme_file="README.md"

# Define the default content you want to keep at the top of the README.md
default_content=$(cat << EOF
# Azure Terraform Modules

This repository contains Terraform modules designed to help manage and automate the provisioning of Azure cloud resources. Each module is crafted to follow best practices and make it easier to create, configure, and manage specific Azure services in a reusable manner.

## Report an Issue

If you encounter any issues, please report them on the [Issues page](https://github.com/devwithkrishna/azure-terraform-modules/issues/new).

EOF
)

# Remove the old directory structure, if it exists
# It assumes the old structure starts from '# Available Modules' until the end of the file
sed -i '/# Available Modules/,$d' "$readme_file"

# Write the default content back to the README.md
echo "$default_content" > "$readme_file"

# List module names based on subdirectories
MODULES_SECTION="## Available Modules\n\n"
for dir in */; do
    module_name=$(basename "$dir")
    MODULES_SECTION+="* **${module_name}**: Located in \`${dir}\`\n"
done

# Append the modules section to the README.md
echo -e "$MODULES_SECTION" >> "$readme_file"

# Start a Markdown code block for the directory structure
echo '## Project Directory Structure' >> "$readme_file"
echo '```' >> "$readme_file"

# Generate the directory structure and append to README.md, ignoring certain files
tree -I 'LICENSE|create-readme.sh|.github|.git' --charset utf-8 >> "$readme_file"

# End the Markdown code block
echo '```' >> "$readme_file"

# Print success message
echo "README.md has been successfully updated with the directory structure and issue reporting section."
