#!/bin/bash
# Usage:
#   . script/docs-default-config.sh
# or
#   source script/docs-default-config.sh

# (G)REEN, (R)ED, (Y)ELLOW & RE(S)ET
G='\033[32m'
R='\033[31m'
Y='\033[33m'
S='\033[0m'

make monolog_default >docs/monolog/yaml/monolog-default-config-new-syntax.yaml
sed -i '1d' docs/monolog/yaml/monolog-default-config-new-syntax.yaml # Remove firs line of the file
printf " ${G}✔${S} default-config-new-syntax.yaml has been updated successfully.\n"

make monolog_default_xml >docs/monolog/xml/monolog-default-config-new-syntax.xml
sed -i '1d' docs/monolog/xml/monolog-default-config-new-syntax.xml # Remove firs line of the file
printf " ${G}✔${S} default-config-new-syntax.xml has been updated successfully.\n"

