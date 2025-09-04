#!/bin/bash
# Usage:
#   . docs-default-config.sh
# or
#   source docs-default-config.sh

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G='\033[32m'
R='\033[31m'
Y='\033[33m'
S='\033[0m'

# Export MonologBundle default configuration
make monolog_default_config >docs/monolog/yaml/default-config-new-syntax.yaml

# Remove firs line of the file
sed -i '1d' docs/monolog/yaml/default-config-new-syntax.yaml

printf " ${G}✔${S} default-config-new-syntax.yaml has been updated successfully.\n"
