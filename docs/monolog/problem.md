# What problem do we want to solve?

⬅️ [MonologBundle](../monolog.md)

---

When generating the default **MonologBundle** configuration using `php bin/console config:dump monolog`, all available configuration keys are currently attached to a single **handler prototype** (see [Compare legacy and new default configuration](compare-default-configuration.md)).

```shell
php bin/console config:dump-reference monolog # Dump the default configuration for an extension
php bin/console debug:config monolog          # Dump the current configuration for an extension
```

However, not all keys are applicable to every handler type. This makes it challenging to anticipate and determine which specific keys should be used for a given handler. For example, the `max_files` key can only be used for a handler of type `rotating_file`:

```yaml
monolog:
  handlers:
    main:
      type: rotating_file
      path: '%kernel.logs_dir%/%kernel.environment%.log'
      level: debug
      max_files: 10
```

But in the dump, you can see that this `max_files` key is in the middle of all the others:

```yaml
monolog:
  use_microseconds: true
  channels: []
  handlers:
    name:
      # ...
      ident: false
      logopts: 1
      facility: user
      max_files: 0       # <-----
      action_level: WARNING
      activation_strategy: null
      stop_buffering: true
      # ...
```

The goal is to modify **MonologBundle** to introduce a new configuration structure and a  `config:dump-reference` output that improves readability by explicitly associating authorized keys with their respective handler types.

This is an ongoing research and development effort, with no definitive choices made yet. Initial sources of inspiration include the configurations of **SecurityBundle** and **GotenbergBundle**.

---

⬅️ [MonologBundle](../monolog.md)
