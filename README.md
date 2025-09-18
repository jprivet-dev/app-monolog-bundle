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

> Run `make` to [discover all commands](docs/makefile.md).

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
* [Makefile - Discover all commands](docs/makefile.md)
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

