# Makefile - Discover all commands

[⬅️ README](../README.md)

---

> Run `make` to see all

<!-- MAKEFILE_COMMANDS_START -->

```

— 🐳 🎵 THE SYMFONY STARTER MAKEFILE 🎵 🐳 —————————————————————————————————
  help                          Display this help message with available commands

— PROJECT 🚀 ———————————————————————————————————————————————————————————————
  start                         Start the project and show info (up_detached & info alias)
  stop                          Stop the project (down alias)
  restart                       Stop & Start the project and show info (up_detached & info alias)
  info                          Show project access info
  install                       Start the project, install dependencies and show info
  check                         Check everything before you deliver
  tests                      t  Run all tests (app & repositories/monolog-bundle)

  clone_monolog                 Clone Symfony Monolog Bundle in repositories directory

— SYMFONY 🎵 ———————————————————————————————————————————————————————————————
  symfony                    sf Run Symfony console command - Usage: make symfony ARG="cache:clear"
  cc                            Clear the Symfony cache
  about                         Display information about the current Symfony project
  dotenv                        Lists all .env files with variables and values
  dumpenv                       Generate .env.local.php for production

— PHP 🐘 ———————————————————————————————————————————————————————————————————
  php                           Run PHP command - $ make php [ARG=<arguments>]- Example: $ make php ARG=--version
  php_sh                        Connect to the PHP container shell

— COMPOSER 🧙 ——————————————————————————————————————————————————————————————
  composer                      Run composer command - $ make composer [ARG=<arguments>] - Example: $ make composer ARG="require --dev phpunit/phpunit"
  composer_install              Install Composer packages
  composer_update               Update Composer packages
  composer_update_lock          Update only the content hash of composer.lock without updating dependencies
  composer_validate             Validate composer.json and composer.lock

— MONOLOG 📝 ———————————————————————————————————————————————————————————————
  monolog_current               Dump the current configuration for MonologBundle (current APP_ENV)
  monolog_current_xml           Dump the current configuration for MonologBundle (current APP_ENV, XML format)
  monolog_current@prod          Dump the current configuration for MonologBundle (PROD)

  monolog_default               Dump the default configuration for MonologBundle
  monolog_default_xml           Dump the default configuration for MonologBundle (XML format)

  monolog_install               [repositories/monolog-bundle] Installs the MonologBundle's dependencies in its isolated vendor directory
  monolog_phpunit               [repositories/monolog-bundle] Run automated tests for MonologBundle in its isolated PHPUnit
  monolog_dox                   [repositories/monolog-bundle] Report test execution progress in TestDox format for MonologBundle in its isolated PHPUnit
  monolog_coverage              [repositories/monolog-bundle] Generate code coverage report in HTML format for MonologBundle in its isolated PHPUnit

— TESTS ✅ —————————————————————————————————————————————————————————————————
  phpunit                       Run PHPUnit - $ make phpunit [ARG=<arguments>] - Example: $ make phpunit ARG="tests/myTest.php"
  coverage                      Generate code coverage report in HTML format for all tests
  dox                           Report test execution progress in TestDox format for all tests

  xdebug_version                Xdebug version number

— BASH 💻 ——————————————————————————————————————————————————————————————————
  command                       Run a command inside the PHP container - $ make command [ARG=<arguments>]- Example: $ make command ARG="ls -al"

— DOCKER 🐳 ————————————————————————————————————————————————————————————————
  up                            Start the containers - $ make up [ARG=<arguments>] - Example: $ make up ARG=-d
  up_detached                   Start the containers (wait for services to be running|healthy - detached mode)
  down                          Stop and remove the containers
  build                         Build or rebuild Docker services - $ make build [ARG=<arguments>] - Example: $ make build ARG=--no-cache
  build_force                   Build or rebuild Docker services (no cache) - $ make build [ARG=<arguments>]
  logs                          Display container logs
  images                        List images used by the current containers
  config                        Parse, resolve, and render compose file in canonical format

— CERTIFICATES 🔐‍️ ——————————————————————————————————————————————————————————
  certificates                  Installs the Caddy TLS certificate to the trust store
  certificates_export           Exports the Caddy root certificate from the container to the host
  hosts                         Add the server name to /etc/hosts file

— TROUBLESHOOTING 😵️ ———————————————————————————————————————————————————————
  permissions                p  Fix file permissions (primarily for Linux hosts)
  git_safe_dir                  Add /app to Git's safe directories within the php container
  git_safe_dir_monolog          Add /app/repositories/monolog-bundle to Git's safe directories within the php container

— UTILITIES 🛠️ ——————————————————————————————————————————————————————————————
  env_files                     Show env files loaded into this Makefile
  vars                          Show key Makefile variables
```

<!-- MAKEFILE_COMMANDS_END -->

---

[⬅️ README](../README.md)

