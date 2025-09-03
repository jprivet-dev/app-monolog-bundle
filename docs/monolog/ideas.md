# 3 ideas for a new approach in `Configuration.php`


⬅️ [MonologBundle](../monolog.md)

---

## 1. Group configuration properties by handler type

### Why?

* Currently, all 46 handler properties are listed in a single configuration block, making it difficult to discern which property belongs to which handler type.
* Have a file generated with the `config:dump-reference` command, which is much more readable.

### How?

* Have a configuration prototype per handler type.

## 2. Segment the `Configuration.php` file

### Why?

* Make the configuration of the 46 handlers easier to read.

### How?

* Have one configuration file per handler.
* Import handler configurations into the **Configuration.php** file.

## 3. Extract documentation from `Configuration.php`

### Why?

* The documentation in the **Configuration.php** file header is not found in the **default configuration** generated with the `config:dump-reference` command.

### How?

* Retrieve this documentation and dispatch it in the generated **default configuration**.

---

⬅️ [MonologBundle](../monolog.md)
