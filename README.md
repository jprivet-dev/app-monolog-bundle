# Symfony application for testing the MonologBundle contribution

## Prerequisites

Be sure to install the latest version of [Docker Engine](https://docs.docker.com/engine/install/).

## Installation

### 1. Clone this repository

```shell
git clone git@github.com:jprivet-dev/app-monolog-bundle.git
cd app-monolog-bundle
```

### 2. Install the project

```shell
make install
```

### 3. Access your application

Open `https://app-monolog-bundle.localhost:8443/` in your browser and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334).

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

## Testing the MonologBundle contribution

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

* [Validate certificates](docs/certificates.md)
* [Docker build options](docs/options.md)
* [Troubleshooting](docs%2Ftroubleshooting.md)

## Main resources

* https://symfony.com/doc/current/setup/docker.html
* https://github.com/dunglas/symfony-docker
* https://github.com/jprivet-dev/symfony-docker

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/app-monolog-bundle/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/LICENSE).

