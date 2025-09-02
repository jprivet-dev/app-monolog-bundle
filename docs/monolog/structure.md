# New structure of the `Configuration.php` file

⬅️ [MonologBundle](../monolog.md)

---

The idea is to propose a new approach in `Configuration.php` (**MonologPocBundle** inherits the experiments of **PocBundle**).

## Group configuration properties by handler type

* Why?
  * Currently, all 46 handler properties are listed in a single configuration block, making it difficult to discern which property belongs to which handler type:
    * See [monolog.yaml](config/default/monolog.yaml).
  * Have a file generated with the `config:dump-reference` command, which is much more readable :
    * See [monolog_poc.yaml](config/default/monolog_poc.yaml) (Contains the configuration of 17 of the original 46 handlers).
* How?
  * Have a configuration prototype per handler type.

## Segment the `Configuration.php` file

* Why?
  * Make the configuration of the 46 handlers easier to read.
* How?
  * Have one configuration file per handler.
  * Import handler configurations into the [Configuration.php](monolog-poc-bundle/src/DependencyInjection/Configuration.php) file (e.g., `SymfonyMailerHandlerConfiguration`, using the `addConfiguration()` method).
  * Allow common nodes to be reused and limit duplication (using the `template()` method).

## No longer break the `Configuration.php` read chain

* Why?
  * View the entire node hierarchy at a glance.
* How?
  * Do not retrieve child nodes to enrich in a variable.
  * Provide the ability to enrich a child node directly in the configuration chain (with the `addConfiguration()`, `template()`, or `closure()` methods).
  * If the `Config` component builders are limited, extend them to the bare minimum.

## Reuse part of the MonologBundle configuration

* Why?
  * **MonologBundle** is a very rich bundle and has already covered a good portion of the configuration and validation subtleties of the various handlers.
  * If integrating the original **MonologBundle** configurations proves straightforward, this indicates that:
    * we will be able to rely on common configuration practices and make them easier for developers to understand.
    * we will be able to easily evolve and adapt the configurations.
    * we will be able to save a lot of time restructuring the configuration of the 46 handlers.
* How?
  * Make good use of the enrichment mechanisms with the `NodeBuilder` and `NodeDefinition` classes.

## Extract documentation from `Configuration.php`

* Why?
  * The documentation in the [Configuration.php](monolog-poc-bundle/src/DependencyInjection/Configuration.php) file header is not found in the `yaml` file generated with the `config:dump-reference` command.
* How?
  * Retrieve this documentation and dispatch it to the relevant handlers in the configuration.

---

⬅️ [MonologBundle](../monolog.md)
