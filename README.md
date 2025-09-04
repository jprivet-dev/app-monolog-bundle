# Symfony application for testing the MonologBundle contribution

## Presentation

This project is a **dockerized environment** designed to streamline the contribution process for the **MonologBundle**. It provides a fully functional Symfony application that you can use to test the work on the `handler-configuration-segmentation` branch of the `jprivet-dev/monolog-bundle` fork. The goal is to offer a consistent and isolated sandbox, allowing you to focus on developing and testing the features without worrying about local environment setup.

* External link: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation
* Internal docs: [MonologBundle: what problem do we want to solve?](docs/monolog.md)

## Prerequisites

Be sure to install the latest version of [Docker Engine](https://docs.docker.com/engine/install/).

## Installation

1. Clone this repository:

    ```shell
    git clone git@github.com:jprivet-dev/app-monolog-bundle.git
    cd app-monolog-bundle
    ```

2. Install the project:

    ```shell
    make install
    ```

3. Open https://app-monolog-bundle.localhost:8443/ in your browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334).

### All in one command

```shell
git clone git@github.com:jprivet-dev/app-monolog-bundle.git && cd app-monolog-bundle && make install
```

## Daily usage

```shell
make start # Start the project and show info (up_detached & info alias)
make stop  # Stop the project (down alias)
```

* Run `make` to see all shorcuts for the most common tasks:

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
  monolog_config                Dump the current configuration for MonologBundle (current APP_ENV)
  monolog_config@prod           Dump the current configuration for MonologBundle (PROD)
  monolog_default_config        Dump the default configuration for MonologBundle

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

## Testing the MonologBundle contribution in your app

In this project, everything is already configured, but if you want to test the **MonologBundle** in your app, from the `handler-configuration-segmentation` development branch, from the `jprivet-dev` fork, follow these steps.


1. Create the contribution bundles directory and clone `jprivet-dev/monolog-bundle`:

    ```shell
    mkdir -p repositories
    git -C repositories clone git@github.com:jprivet-dev/monolog-bundle.git --branch handler-configuration-segmentation
    ```

2. Link the local bundle via Composer:

    ```shell
    composer config repositories.monolog-bundle path repositories/monolog-bundle
    composer update --lock
    ```

3. Require the bundle via Composer:

    ```shell
    composer require --no-interaction symfony/monolog-bundle:@dev
    ```

### How to remove the dependency and repository configuration?

Once you're finished working on the bundle, you can remove the dependency and repository configuration to return your project to its original state.

```shell
composer remove symfony/monolog-bundle
composer config --unset repositories.monolog-bundle
```

## Docs

* [MonologBundle: what problem do we want to solve?](docs/monolog.md)
* [Validate certificates](docs/certificates.md)
* [Docker build options](docs/options.md)
* [Troubleshooting](docs%2Ftroubleshooting.md)

## Main resources

* Monolog:
  * https://symfony.com/packages/Monolog%20Bundle
  * https://symfony.com/doc/current/logging.html
  * https://github.com/symfony/recipes/tree/main/symfony/monolog-bundle/3.7
* Sources of inspiration:
  * https://symfony.com/doc/current/security.html
  * https://github.com/sensiolabs/GotenbergBundle
  * https://github.com/symfony/workflow
  * https://github.com/nelmio/alice
* The Bundle System:
  * https://symfony.com/doc/current/bundles.html
  * https://symfony.com/doc/current/bundles/best_practices.html
  * https://symfony.com/doc/current/components/config/definition.html
* Docker
  * https://symfony.com/doc/current/setup/docker.html
  * https://github.com/dunglas/symfony-docker
  * https://github.com/jprivet-dev/symfony-docker

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/app-monolog-bundle/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/LICENSE).

