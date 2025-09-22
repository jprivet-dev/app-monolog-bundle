# What problem do we want to solve?

⬅️ [README](../README.md)

---

When generating the default **MonologBundle** configuration using `php bin/console config:dump monolog`, all available configuration keys are currently attached to a single **handler prototype** (see [Legacy VS New default configuration](compare-default-configuration.md)).

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

# 3 ideas for a new approach in `Configuration.php`

## 1. Group configuration properties by handler type

### Why?

* Currently, all 51 handlers configuration properties are listed in a single configuration block, making it difficult to discern which property belongs to which handler type.
* Have a file generated with the `config:dump-reference` command, which is much more readable.

### How?

* Have a configuration prototype per handler type.

## 2. Segment the `Configuration.php` file

### Why?

* Make the configuration of the 51 handlers configuration easier to read.

### How?

* Have one configuration file per handler.
* Import handler configurations into the **Configuration.php** file.

## 3. Extract documentation from `Configuration.php`

### Why?

* The documentation in the **Configuration.php** file header is not found in the **default configuration** generated with the `config:dump-reference` command.

### How?

* Retrieve this documentation and dispatch it in the generated **default configuration**.

---

# Legacy VS New syntax for monolog handlers

With the new version of MonologBundle, two syntaxes will be possible, between the legacy `type` key and the new `type_xxx` prefixed keys.

## Legacy syntax with `type` key

This is the traditional way to define a handler type. It remains fully supported.

```yaml
monolog:
  handlers:
    name:
      type: xxx # <-- This defines the handler type directly
      opt1: ...
      opt2: ...
      # ...
```

## New syntax with `type_xxx` prefixed keys

This is the recommended new way to define a handler. The type is implicitly defined by the key, and the `type` sub-key is automatically set for backward compatibility internally.

```yaml
monolog:
  handlers:
    name:
      type_xxx: # <-- The key itself defines the handler type
        opt1: ...
        opt2: ...
        # ...
```

**Note:** If you run `config:dump-reference` after processing this configuration, you would see the `type` key auto-filled:

```yaml
monolog:
  handlers:
    name:
      type: xxx # <-- This is auto-filled for internal use
      type_xxx: # <-- The key itself defines the handler type
        opt1: ...
        opt2: ...
        # ...
```

## Invalid syntaxes

### 1. No type definition

This scenario occurs when a handler is defined without specifying its type, either through the `type` key or a `type_xxx` prefixed key:

```yaml
monolog:
  handlers:
    my_handler: ~ # <-- No handler type defined
```

Or:

```yaml
monolog:
  handlers:
    my_handler: [] # <-- No handler type defined
```

Error:

```
Invalid configuration for path "monolog.handlers.my_handler": A handler must have a "type" or a "type_NAME" key defined.
```

### 2. Legacy `type` and new `type_xxx` with same value

This scenario occurs when both the legacy `type` key and a new `type_xxx` prefixed key are used for the same handler, even if they refer to the same type. The bundle enforces a single source of truth for handler type definition:

```yaml
monolog:
  handlers:
    my_handler:
      type: stream # <-- "stream" type
      type_stream: # <-- "stream" type
        opt1: ...
        opt2: ...
        # ...
```

Error:

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: stream" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

### 3. Legacy `type` and new `type_xxx` with different values

Similar to **invalid case 2**, this scenario is when both syntaxes are used, but they define *different* handler types. This explicitly highlights the ambiguity:

```yaml
monolog:
  handlers:
    my_handler:
      type: rotating_file # <-- "rotating_file" type
      type_stream: # <-- "stream" type
        opt1: ...
        opt2: ...
        # ...
```

Error:

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: rotating_file" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

---

# Legacy VS New default configuration

## How generate default config in a file?

You can test and generate the Monolog default config in my https://github.com/jprivet-dev/app-monolog-bundle project.

This project is a **dockerized environment** designed to streamline the contribution process for the **MonologBundle**. It provides a fully functional Symfony application that you can use to test the work on my fork: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation.

```shell
docker compose exec php php bin/console config:dump-reference monolog >build/monolog-default-config.yaml
docker compose exec php php bin/console config:dump-reference monolog --format=xml >build/monolog-default-config.xml
```

## Yaml versions

* [monolog-default-config-legacy-syntax.yaml](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/docs/monolog/yaml/monolog-default-config-legacy-syntax.yaml)
* [monolog-default-config-new-syntax](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/docs/monolog/yaml/monolog-default-config-new-syntax.yaml)

Complete `yaml/monolog-default-config-legacy-syntax.yaml`:

```yaml
# Default configuration for extension with alias: "monolog"
monolog:
  use_microseconds: true
  channels: []
  handlers:

    # Examples:
    # syslog:              { type: stream, path: /var/log/symfony.log, level: ERROR, bubble: 'false', formatter: my_formatter }
    # main:                { type: fingers_crossed, action_level: WARNING, buffer_size: 30, handler: custom }
    # custom:              { type: service, id: my_handler }

    # Prototype
    name:
      type: ~ # Required
      id: ~
      priority: 0
      level: DEBUG
      bubble: true
      app_name: null
      fill_extra_context: false
      include_stacktraces: false
      process_psr_3_messages:
        enabled: null
        date_format: ~
        remove_used_context_fields: ~
      path: '%kernel.logs_dir%/%kernel.environment%.log'
      file_permission: null
      use_locking: false
      filename_format: '{filename}-{date}'
      date_format: Y-m-d
      ident: false
      logopts: 1
      facility: user
      max_files: 0
      action_level: WARNING
      activation_strategy: null
      stop_buffering: true
      passthru_level: null
      excluded_404s: []
      excluded_http_codes:

        # Prototype
        - code: ~
          urls: []
      accepted_levels: []
      min_level: DEBUG
      max_level: EMERGENCY
      buffer_size: 0
      flush_on_overflow: false
      handler: ~
      url: ~
      exchange: ~
      exchange_name: log
      room: ~
      message_format: text
      api_version: null
      channel: null
      bot_name: Monolog
      use_attachment: true
      use_short_attachment: false
      include_extra: false
      icon_emoji: null
      webhook_url: ~
      team: ~
      notify: false
      nickname: Monolog
      token: ~
      region: ~
      source: ~
      use_ssl: true
      user: ~
      title: null
      host: null
      port: 514
      config: []
      members: []
      connection_string: ~
      timeout: ~
      time: 60
      deduplication_level: 400
      store: null
      connection_timeout: ~
      persistent: ~
      dsn: ~
      hub_id: null
      client_id: null
      auto_log_stacks: false
      release: null
      environment: null
      message_type: 0
      parse_mode: null
      disable_webpage_preview: null
      disable_notification: null
      split_long_messages: false
      delay_between_messages: false
      factor: 1
      tags: []
      console_formater_options: ~ # Deprecated (Since symfony/monolog-bundle 3.7: "monolog.handlers.name.console_formater_options" is deprecated, use "monolog.handlers.name.console_formatter_options" instead.)
      console_formatter_options: []
      formatter: ~
      nested: false
      publisher:
        id: ~
        hostname: ~
        port: 12201
        chunk_size: 1420
      mongo:
        id: ~
        host: ~
        port: 27017
        user: ~
        pass: ~
        database: monolog
        collection: logs
      elasticsearch:
        id: ~
        host: ~
        port: 9200
        transport: Http
        user: null
        password: null
      index: monolog
      document_type: logs
      ignore_error: false
      redis:
        id: ~
        host: ~
        password: null
        port: 6379
        database: 0
        key_name: monolog_redis
      predis:
        id: ~
        host: ~
      from_email: ~
      to_email: []
      subject: ~
      content_type: null
      headers: []
      mailer: null
      email_prototype:
        id: ~ # Required
        method: null
      lazy: true
      verbosity_levels:
        VERBOSITY_QUIET: ERROR
        VERBOSITY_NORMAL: WARNING
        VERBOSITY_VERBOSE: NOTICE
        VERBOSITY_VERY_VERBOSE: INFO
        VERBOSITY_DEBUG: DEBUG
      channels:
        type: ~
        elements: []
```

Partial `yaml/monolog-default-config-new-syntax.yaml`:

```yaml
# Default configuration for extension with alias: "monolog"
monolog:
  use_microseconds: true
  channels: []
  handlers:

    # Examples:
    # syslog:              { type: stream, path: /var/log/symfony.log, level: ERROR, bubble: 'false', formatter: my_formatter }
    # main:                { type: fingers_crossed, action_level: WARNING, buffer_size: 30, handler: custom }
    # custom:              { type: service, id: my_handler }

    # Prototype
    name:
      type: null
      console_formater_options: ~ # Deprecated (Since symfony/monolog-bundle 3.7: "monolog.handlers.name.console_formater_options" is deprecated, use "monolog.handlers.name.console_formatter_options" instead.)

      # Defines the processing order; handlers with a higher priority value are executed first.
      priority: 0

      # Level name or int value, defaults to DEBUG.
      level: DEBUG

      # When true, messages are passed to the next handler in the stack; when false, the chain ends here.
      bubble: true

      # When true, a full stack trace is included in the log record, especially for errors and exceptions.
      include_stacktraces: false

      # When true, this handler is part of a nested handler configuration (e.g., as the primary handler of a FingersCrossedHandler).
      nested: false

      # The formatter used to format the log records. Can be a service ID or a formatter configuration.
      formatter: ~
      exchange: ~
      exchange_name: log

      # The wrapped handler's name.
      handler: ~

      # Defaults to 0 (unlimited).
      buffer_size: 0
      flush_on_overflow: false
      channels:
        type: ~
        elements: []
      process_psr_3_messages:
        enabled: null
        date_format: ~
        remove_used_context_fields: ~
      console_formatter_options: []
      url: ~
      time: 60
      deduplication_level: 400
      store: null
      elasticsearch:
        id: ~

        # Elastic search host name, with scheme (e.g. "https://127.0.0.1:9200").
        host: ~
        port: 9200
        transport: Http
        user: null
        password: null
      index: monolog
      document_type: logs
      ignore_error: false
      message_type: 0
      members: []

      # List of levels to accept
      accepted_levels: []

      # Minimum level to accept (only used if accepted_levels not specified).
      min_level: DEBUG

      # Maximum level to accept (only used if accepted_levels not specified).
      max_level: EMERGENCY

      # Minimum level or service id to activate the handler, defaults to WARNING.
      action_level: WARNING

      # Determines when the handler starts processing logs. Can be a log level or a service ID.
      activation_strategy: null

      # Bool to disable buffering once the handler has been activated, defaults to true.
      stop_buffering: true

      # Level name or int value for messages to always flush, disabled by default.
      passthru_level: null

      # If set, the strategy will be changed to one that excludes 404s coming from URLs matching any of those patterns.
      excluded_404s: []

      # If set, the strategy will be changed to one that excludes specific HTTP codes (requires Symfony Monolog bridge 4.1+).
      excluded_http_codes:

        # Prototype
        - code: ~
          urls: []

      # Telegram bot access token provided by BotFather.
      token: ~
      source: ~
      publisher:
        id: ~
        hostname: ~
        port: 12201
        chunk_size: 1420
      room: ~
      message_format: text
      api_version: null
      notify: false
      nickname: Monolog
      use_ssl: true
      host: null
      timeout: ~
      connection_timeout: ~
      region: ~
      tags: []
      mongo:
        id: ~

        # Database host name, optional if id is given.
        host: ~
        port: 27017

        # Database user name
        user: ~

        # Mandatory only if user is present.
        pass: ~
        database: monolog
        collection: logs
      from_email: ~
      to_email: []
      subject: ~
      headers: []
      app_name: null
      predis:

        # Optional if host is given.
        id: ~

        # tcp://10.0.0.1:6379
        host: ~
      user: ~
      title: null
      dsn: ~
      client_id: null
      auto_log_stacks: false
      release: null
      environment: null
      redis:

        # Optional if host is given.
        id: ~
        host: ~
        password: null
        port: 6379
        database: 0
        key_name: monolog_redis
      id: ~

      # Config values from https://github.com/rollbar/rollbar-php#configuration-reference.
      config: []
      path: '%kernel.logs_dir%/%kernel.environment%.log'

      # Files to keep, defaults to zero (infinite).
      max_files: 0
      file_permission: null
      use_locking: false
      filename_format: '{filename}-{date}'
      date_format: Y-m-d
      factor: 1
      fill_extra_context: false
      hub_id: null

      # Telegram channel name.
      channel: null
      bot_name: Monolog
      use_attachment: true
      use_short_attachment: false
      include_extra: false
      icon_emoji: null
      team: ~
      webhook_url: ~
      connection_string: ~
      persistent: ~
      content_type: null
      mailer: null
      email_prototype:
        id: ~ # Required
        method: null
      lazy: true
      ident: false
      facility: user
      logopts: 1
      port: 514

      # Optional the kind of formatting that is used for the message.
      parse_mode: null

      # Disables link previews for links in the message.
      disable_webpage_preview: null

      # Sends the message silently. Users will receive a notification with no sound.
      disable_notification: null

      # Split messages longer than 4096 bytes into multiple messages.
      split_long_messages: false

      # Adds a 1sec delay/sleep between sending split messages.
      delay_between_messages: false
      verbosity_levels:
        VERBOSITY_QUIET: ERROR
        VERBOSITY_NORMAL: WARNING
        VERBOSITY_VERBOSE: NOTICE
        VERBOSITY_VERY_VERBOSE: INFO
        VERBOSITY_DEBUG: DEBUG

      # [Output] Publishes log records to an AMQP exchange.
      type_amqp:

        # Automatically set by the bundle for internal use and backward compatibility. Do not define this key manually.
        type: amqp

        # Defines the processing order; handlers with a higher priority value are executed first.
        priority: 0

        # Level name or int value, defaults to DEBUG.
        level: DEBUG

        # When true, messages are passed to the next handler in the stack; when false, the chain ends here.
        bubble: true

        # When true, a full stack trace is included in the log record, especially for errors and exceptions.
        include_stacktraces: false

        # When true, this handler is part of a nested handler configuration (e.g., as the primary handler of a FingersCrossedHandler).
        nested: false

        # The formatter used to format the log records. Can be a service ID or a formatter configuration.
        formatter: ~
        exchange: ~
        exchange_name: log

      # [Output] Sends log records to the browser JavaScript console.
      type_browser_console:

        # Automatically set by the bundle for internal use and backward compatibility. Do not define this key manually.
        type: browser_console

        # Defines the processing order; handlers with a higher priority value are executed first.
        priority: 0

        # Level name or int value, defaults to DEBUG.
        level: DEBUG

        # When true, messages are passed to the next handler in the stack; when false, the chain ends here.
        bubble: true

        # When true, a full stack trace is included in the log record, especially for errors and exceptions.
        include_stacktraces: false

        # When true, this handler is part of a nested handler configuration (e.g., as the primary handler of a FingersCrossedHandler).
        nested: false

        # The formatter used to format the log records. Can be a service ID or a formatter configuration.
        formatter: ~

      # [Buffering] Accumulates records, flushes to nested handler under conditions (e.g., buffer full, shutdown). Requires nested handler.
      type_buffer:

        # Automatically set by the bundle for internal use and backward compatibility. Do not define this key manually.
        type: buffer

        # Defines the processing order; handlers with a higher priority value are executed first.
        priority: 0

        # Level name or int value, defaults to DEBUG.
        level: DEBUG

        # When true, messages are passed to the next handler in the stack; when false, the chain ends here.
        bubble: true

        # When true, a full stack trace is included in the log record, especially for errors and exceptions.
        include_stacktraces: false

        # When true, this handler is part of a nested handler configuration (e.g., as the primary handler of a FingersCrossedHandler).
        nested: false

        # The formatter used to format the log records. Can be a service ID or a formatter configuration.
        formatter: ~

        # The wrapped handler's name.
        handler: ~
        buffer_size: 0
        flush_on_overflow: false

      # [Filtering] Passes records to nested handler if they belong to specific channels. Requires nested handler.
      type_channels:

        # Automatically set by the bundle for internal use and backward compatibility. Do not define this key manually.
        type: channels

        # Defines the processing order; handlers with a higher priority value are executed first.
        priority: 0

        # Level name or int value, defaults to DEBUG.
        level: DEBUG

        # When true, messages are passed to the next handler in the stack; when false, the chain ends here.
        bubble: true

        # When true, a full stack trace is included in the log record, especially for errors and exceptions.
        include_stacktraces: false

        # When true, this handler is part of a nested handler configuration (e.g., as the primary handler of a FingersCrossedHandler).
        nested: false

        # The formatter used to format the log records. Can be a service ID or a formatter configuration.
        formatter: ~
        channels:
          type: ~
          elements: []

      # ...
      # Rest of the configuration...
      # ...
```

## XML versions

* [monolog-default-config-legacy-syntax.xml](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/docs/monolog/xml/monolog-default-config-legacy-syntax.xml)
* [monolog-default-config-new-syntax.xml](https://github.com/jprivet-dev/app-monolog-bundle/blob/main/docs/monolog/xml/monolog-default-config-new-syntax.xml)

---

# Legacy VS New MonologBundle structure

## Legacy structure

```
./
├── DependencyInjection/
│   ├── Compiler/
│   │   ├── AddProcessorsPass.php
│   │   ├── AddSwiftMailerTransportPass.php
│   │   ├── DebugHandlerPass.php
│   │   ├── FixEmptyLoggerPass.php
│   │   └── LoggerChannelPass.php
│   ├── Configuration.php
│   └── MonologExtension.php
├── Resources/
│   └── config/
│       ├── schema/
│       └── monolog.xml
├── SwiftMailer/
│   └── MessageFactory.php
├── Tests/
│   └── DependencyInjection/
│       ├── Compiler/
│       ├── Fixtures/
│       ├── ConfigurationTest.php
│       ├── DependencyInjectionTestCase.php
│       ├── FixtureMonologExtensionTestCase.php
│       ├── MonologExtensionTest.php
│       ├── XmlMonologExtensionTest.php
│       └── YamlMonologExtensionTest.php
├── CHANGELOG.md
├── composer.json
├── LICENSE
├── MonologBundle.php
├── phpunit.xml.dist
└── README.md
```

## New structure

```
./
├── DependencyInjection/
│   ├── Compiler/
│   │   ├── AddProcessorsPass.php
│   │   ├── AddSwiftMailerTransportPass.php
│   │   ├── DebugHandlerPass.php
│   │   ├── FixEmptyLoggerPass.php
│   │   └── LoggerChannelPass.php
│   ├── Enum/
│   │   └── HandlerType.php
│   ├── Handler/
│   │   ├── AmqpHandlerConfiguration.php
│   │   ├── BrowserConsoleHandlerConfiguration.php
│   │   ├── BufferHandlerConfiguration.php
│   │   ├── ChannelsHandlerConfiguration.php
│   │   ├── ChromePHPHandlerConfiguration.php
│   │   ├── ConsoleHandlerConfiguration.php
│   │   ├── CubeHandlerConfiguration.php
│   │   ├── DebugHandlerConfiguration.php
│   │   ├── DeduplicationHandlerConfiguration.php
│   │   ├── ElasticaHandlerConfiguration.php
│   │   ├── ElasticsearchHandlerConfiguration.php
│   │   ├── ErrorLogHandlerConfiguration.php
│   │   ├── FallbackGroupHandlerConfiguration.php
│   │   ├── FilterHandlerConfiguration.php
│   │   ├── FingersCrossedHandlerConfiguration.php
│   │   ├── FirePHPHandlerConfiguration.php
│   │   ├── FlowdockHandlerConfiguration.php
│   │   ├── GelfHandlerConfiguration.php
│   │   ├── GroupHandlerConfiguration.php
│   │   ├── HandlerConfigurationInterface.php
│   │   ├── HipchatHandlerConfiguration.php
│   │   ├── InsightOpsHandlerConfiguration.php
│   │   ├── LogEntriesHandlerConfiguration.php
│   │   ├── LogglyHandlerConfiguration.php
│   │   ├── MongoHandlerConfiguration.php
│   │   ├── NativeMailerHandlerConfiguration.php
│   │   ├── NewRelicHandlerConfiguration.php
│   │   ├── NoopHandlerConfiguration.php
│   │   ├── NullHandlerConfiguration.php
│   │   ├── PredisHandlerConfiguration.php
│   │   ├── PushoverHandlerConfiguration.php
│   │   ├── RavenHandlerConfiguration.php
│   │   ├── RedisHandlerConfiguration.php
│   │   ├── RollbarHandlerConfiguration.php
│   │   ├── RotatingFileHandlerConfiguration.php
│   │   ├── SamplingHandlerConfiguration.php
│   │   ├── SentryHandlerConfiguration.php
│   │   ├── ServerlogHandlerConfiguration.php
│   │   ├── ServiceHandlerConfiguration.php
│   │   ├── SlackbotHandlerConfiguration.php
│   │   ├── SlackHandlerConfiguration.php
│   │   ├── SlackWebhookHandlerConfiguration.php
│   │   ├── SocketHandlerConfiguration.php
│   │   ├── StreamHandlerConfiguration.php
│   │   ├── SwiftMailerHandlerConfiguration.php
│   │   ├── SymfonyMailerHandlerConfiguration.php
│   │   ├── SyslogHandlerConfiguration.php
│   │   ├── SysLogUdpHandlerConfiguration.php
│   │   ├── TelegramBotHandlerConfiguration.php
│   │   ├── TestHandlerConfiguration.php
│   │   ├── VerbosityLevelHandlerConfiguration.php
│   │   └── WhatFailureGroupHandlerConfiguration.php
│   ├── Configuration.php
│   └── MonologExtension.php
├── Resources/
│   └── config/
│       ├── schema/
│       └── monolog.xml
├── SwiftMailer/
│   └── MessageFactory.php
├── Tests/
│   └── DependencyInjection/
│       ├── Compiler/
│       ├── Fixtures/
│       ├── ConfigurationTest.php
│       ├── DependencyInjectionTestCase.php
│       ├── FixtureMonologExtensionTestCase.php
│       ├── MonologExtensionTest.php
│       ├── XmlMonologExtensionTest.php
│       └── YamlMonologExtensionTest.php
├── CHANGELOG.md
├── composer.json
├── LICENSE
├── MonologBundle.php
├── phpunit.xml.dist
└── README.md
```

---

# MonologBundle configurations VS Monolog handlers

This document clarifies the relationship between the handler configuration classes in the **MonologBundle** and the actual handler classes in the **Monolog** library. It highlights which handlers are natively integrated and which are specific to the Symfony ecosystem.

* **MonologBundle handler configurations**: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation/DependencyInjection/Handler
* **Monolog handlers**: https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler

| Type (legacy)      | Type (new syntax)       | XxxHandlerConfiguration | XxxHandler       | Notes                                           |
|--------------------|-------------------------|-------------------------|------------------|-------------------------------------------------|
| `amqp`             | `type_amqp`             | Amqp                    | Amqp             | ✅ DONE                                          |
| `browser_console`  | `type_browser_console`  | BrowserConsole          | BrowserConsole   | ✅ DONE                                          |
| `buffer`           | `type_buffer`           | Buffer                  | Buffer           | ✅ DONE                                          |
|                    |                         | Channels                | ❌ No handler     | ✅ DONE                                          |
| `chromephp`        | `type_chromephp`        | ChromePHP               | ChromePHP        | ✅ DONE                                          |
| `console`          | `type_console`          | ❌ No config.            | CouchDB          | ✅ DONE                                          |
| `cube`             | `type_cube`             | Console                 | ❌ No handler     | ✅ DONE                                          |
|                    |                         | Cube                    | Cube             | ✅ DONE                                          |
|                    |                         | ❌ No config.            | Deduplication    | ✅ DO NOTHING                                    |
|                    |                         | ❌ No config.            | DoctrineCouchDB  | ✅ DO NOTHING                                    |
| `debug`            | `type_debug`            | Debug                   | ❌ No handler     | ✅ DONE                                          |
| `deduplication`    | `type_deduplication`    | Deduplication           | ❌ No handler     | ✅ DONE                                          |
|                    |                         | ❌ No config.            | DynamoDb         | ✅ DO NOTHING                                    |
| `elastica`         | `type_elastica`         | Elastica                | Elastica         | ✅ DONE                                          |
| `elasticsearch`    |                         | Elastica                | Elastica         | ❌ DEPRECATED (use `elastica` instead)           |
| `elastic_search`   | `type_elastic_search`   | Elasticsearch           | Elasticsearch    | ✅ DONE                                          |
| `error_log`        | `type_error_log`        | ErrorLog                | ErrorLog         | ✅ DONE                                          |
| `fallbackgroup`    | `type_fallbackgroup`    | FallbackGroup           | FallbackGroup    | ✅ DONE                                          |
| `filter`           | `type_filter`           | Filter                  | Filter           | ✅ DONE                                          |
| `fingers_crossed`  | `type_fingers_crossed`  | FingersCrossed          | FingersCrossed   | ✅ DONE                                          |
| `firephp`          | `type_firephp`          | FirePHP                 | FirePHP          | ✅ DONE                                          |
|                    |                         |                         | FleepHook        | ✅ No type, no config., ONE handler - DO NOTHING |
| `flowdock`         | `type_flowdock`         | Flowdock                | Flowdock         | ✅ DONE                                          |
| `gelf`             | `type_gelf`             | Gelf                    | Gelf             | ✅ DONE                                          |
| `group`            | `type_group`            | Group                   | Group            | ✅ DONE                                          |
| `hipchat`          | `type_hipchat`          | Hipchat                 | ❌ No handler     | ✅ DONE                                          |
|                    |                         | ❌ No config.            | IFTTT            | ✅ DO NOTHING                                    |
| `insightops`       | `type_insightops`       | InsightOps              | InsightOps       | ✅ DONE                                          |
| `logentries`       | `type_logentries`       | LogEntries              | LogEntries       | ✅ DONE                                          |
| `loggly`           | `type_loggly`           | Loggly                  | Loggly           | ✅ DONE                                          |
|                    |                         |                         | Logmatic         | ✅ No type, no config., ONE handler - DO NOTHING |
| `mongo`            | `type_mongo`            | Mongo                   | ❌ No handler     | ✅ DONE                                          |
|                    |                         | ❌ No config.            | Mail             | ✅ DO NOTHING                                    |
|                    |                         | ❌ No config.            | Mandrill         | ✅ DO NOTHING                                    |
|                    |                         | ❌ No config.            | MongoDB          | ✅ DO NOTHING                                    |
| `native_mailer`    | `type_native_mailer`    | NativeMailer            | NativeMailer     | ✅ DONE                                          |
| `newrelic`         | `type_newrelic`         | NewRelic                | NewRelic         | ✅ DONE                                          |
| `noop`             | `type_noop`             | NoopConfiguratio        | Noop             | ✅ DONE                                          |
| `null`             | `type_null`             | Null                    | Null             | ✅ DONE                                          |
|                    |                         |                         | Overflow         | ✅ No type, no config., ONE handler - DO NOTHING |
| `predis`           | `type_predis`           | Predis                  | ❌ No handler     | ✅ DONE                                          |
|                    |                         | ❌ No config.            | PHPConsole       | ✅ DO NOTHING                                    |
|                    |                         | ❌ No config.            | Process          | ✅ DO NOTHING                                    |
|                    |                         | ❌ No config.            | Psr              | ✅ DO NOTHING                                    |
| `pushover`         | `type_pushover`         | Pushover                | Pushover         | ✅ DONE                                          |
| `raven`            | `type_raven`            | Raven                   | ❌ No handler     | ✅ DONE                                          |
| `redis`            | `type_redis`            | Redis                   | Redis            | ✅ DONE                                          |
|                    |                         | ❌ No config.            | RedisPubSub      | ✅ DO NOTHING                                    |
| `rollbar`          | `type_rollbar`          | Rollbar                 | Rollbar          | ✅ DONE                                          |
| `rotating_file`    | `type_rotating_file`    | RotatingFile            | RotatingFile     | ✅ DONE                                          |
| `sampling`         | `type_sampling`         | Sampling                | Sampling         | ✅ DONE                                          |
|                    |                         | ❌ No config.            | SendGrid         | ✅ DO NOTHING                                    |
| `sentry`           | `type_sentry`           | Sentry                  | ❌ No handler     | ✅ DONE                                          |
| `server_log`       | `type_server_log`       | Serverlog               | ❌ No handler     | ✅ DONE                                          |
|                    |                         | Service                 | ❌ No handler     | ✅ No type, ONE config., no handler - DONE       |
| `slackbot`         | `type_slackbot`         | Slackbot                | ❌ No handler     | ✅ DONE                                          |
| `slack`            | `type_slack`            | Slack                   | Slack            | ✅ DONE                                          |
| `slackwebhook`     | `type_slackwebhook`     | SlackWebhook            | SlackWebhook     | ✅ DONE                                          |
| `socket`           | `type_socket`           | Socket                  | Socket           | ✅ DONE                                          |
|                    |                         | ❌ No config.            | Sqs              | ✅ DO NOTHING                                    |
| `stream`           | `type_stream`           | Stream                  | Stream           | ✅ DONE                                          |
| `swift_mailer`     | `type_swift_mailer`     | SwiftMailer             | ❌ No handler     | ✅ DONE                                          |
| `symfony_mailer`   | `type_symfony_mailer`   | SymfonyMailer           | SymfonyMailer    | ✅ DONE                                          |
| `syslog`           | `type_syslog`           | Syslog                  | Syslog           | ✅ DONE                                          |
| `syslogudp`        | `type_syslogudp`        | SysLogUdp               | SyslogUdp        | ✅ DONE                                          |
| `telegram`         | `type_telegram`         | TelegramBot             | TelegramBot      | ✅ DONE                                          |
| `test`             | `type_test`             | Test                    | Test             | ✅ DONE                                          |
|                    |                         | VerbosityLevel          | ❌ No handler     | ✅ No type, ONE config., no handler - DONE       |
| `whatfailuregroup` | `type_whatfailuregroup` | WhatFailureGroup        | WhatFailureGroup | ✅ DONE                                          |
|                    |                         | ❌ No config.            | ZendMonitor      | ✅ DO NOTHING                                    |

## Handlers specific to MonologBundle (not in Monolog)

These configuration classes handle Symfony-specific functionalities and do not have a direct equivalent in the Monolog library.

| MonologBundle configuration        | Role                                                                                                 |
|------------------------------------|------------------------------------------------------------------------------------------------------|
| ChannelsHandlerConfiguration       | Manages logging to specific channels, a core Symfony feature for routing logs.                       |
| ConsoleHandlerConfiguration        | Displays logs directly in the Symfony console for command-line applications.                         |
| DebugHandlerConfiguration          | Collects all log messages during a request for the Symfony Profiler.                                 |
| DeduplicationHandlerConfiguration  | Configures a Monolog handler that suppresses identical log messages over a given time frame.         |
| HipchatHandlerConfiguration        | Integrates with HipChat to send logs as notifications to a room.                                     |
| MongoHandlerConfiguration          | Simplifies the configuration of the Monolog handler for a MongoDB database.                          |
| PredisHandlerConfiguration         | Configures the Monolog handler for sending logs to a Redis server using the Predis library.          |
| RavenHandlerConfiguration          | Integrates with the deprecated Raven PHP client to send logs to a Sentry server.                     |
| SentryHandlerConfiguration         | Configures the Monolog handler for sending logs and exceptions to the Sentry error tracking service. |
| ServerlogHandlerConfiguration      | Directs logs to the internal logger of the Symfony web server for debugging.                         |
| ServiceHandlerConfiguration        | Allows any Symfony service that acts as a logger to be used as a Monolog handler.                    |
| SlackbotHandlerConfiguration       | Formats and sends log messages to a Slack channel via an incoming webhook.                           |
| SwiftMailerHandlerConfiguration    | Integrates with the now-deprecated SwiftMailer library to send log messages via email.               |
| VerbosityLevelHandlerConfiguration | Dynamically changes the logging level based on the console command's verbosity options.              |

## Monolog handlers without dedicated MonologBundle configuration

These handlers exist in the Monolog library, but they do not have a dedicated configuration class within the MonologBundle. They must be manually configured as services in your Symfony application.

| Monolog Handler        | Notes                                                                                                             |
|------------------------|-------------------------------------------------------------------------------------------------------------------|
| CouchDBHandler         | Stores logs in a **CouchDB** database via the API.                                                                |
| DeduplicationHandler   | Prevents redundant log messages from being written, which is useful for avoiding log flooding.                    |
| DoctrineCouchDBHandler | Specific integration for the **Doctrine CouchDB** library.                                                        |
| DynamoDbHandler        | Stores logs in **Amazon DynamoDB**, a managed NoSQL database.                                                     |
| IFTTTHandler           | Sends logs as events to the **IFTTT** (If This Then That) service to trigger automated actions.                   |
| MailHandler            | The parent class for sending log emails, usually implemented by more specific classes like `NativeMailerHandler`. |
| MandrillHandler        | Sends logs via email using the **Mandrill** API (a Mailchimp service).                                            |
| MongoDBHandler         | Stores logs in a **MongoDB** database.                                                                            |
| PHPConsoleHandler      | Sends messages to the **PHP Console** debugging console for front-end development.                                |
| ProcessHandler         | Executes another program or script as an external process to manage logs.                                         |
| PsrHandler             | Delegates log messages to a handler that implements the **PSR-3 `LoggerInterface`** standard.                     |
| RedisPubSubHandler     | Publishes log messages to a **Redis** channel using the Pub/Sub system.                                           |
| SendGridHandler        | Sends logs via email using the **SendGrid** service.                                                              |
| SqsHandler             | Sends logs to an **Amazon SQS** (Simple Queue Service) queue.                                                     |
| ZendMonitorHandler     | Sends logs to **Zend Server**, a PHP runtime environment.                                                         |

---

⬅️ [README](../README.md)
