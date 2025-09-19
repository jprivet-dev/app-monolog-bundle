# MonologBundle configurations VS Monolog handlers

⬅️ [MonologBundle](../monolog.md)

---

This document clarifies the relationship between the handler configuration classes in the **MonologBundle** and the actual handler classes in the **Monolog** library. It highlights which handlers are natively integrated and which are specific to the Symfony ecosystem.

* **MonologBundle handler configurations**: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation/DependencyInjection/Handler
* **Monolog handlers**: https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler

| Type (legacy)      | New key type            | MonologBundle configuration          | Monolog handler         | Notes                                                |
|--------------------|-------------------------|--------------------------------------|-------------------------|------------------------------------------------------|
| `amqp`             | `type_amqp`             | AmqpHandlerConfiguration             | AmqpHandler             | ✅ DONE                                               |
| `browser_console`  | `type_browser_console`  | BrowserConsoleHandlerConfiguration   | BrowserConsoleHandler   | ✅ DONE                                               |
| `buffer`           | `type_buffer`           | BufferHandlerConfiguration           | BufferHandler           | ✅ DONE                                               |
|                    |                         | ChannelsHandlerConfiguration         | ❌ No handler exists     | ✅ DONE                                               |
| `chromephp`        | `type_chromephp`        | ChromePHPHandlerConfiguration        | ChromePHPHandler        | ✅ DONE                                               |
| `console`          | `type_console`          | ❌ No dedicated configuration         | CouchDBHandler          | ✅ DONE                                               |
| `cube`             | `type_cube`             | ConsoleHandlerConfiguration          | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | CubeHandlerConfiguration             | CubeHandler             | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | DeduplicationHandler    | ✅ DO NOTHING                                         |
|                    |                         | ❌ No dedicated configuration         | DoctrineCouchDBHandler  | ✅ DO NOTHING                                         |
| `debug`            | `type_debug`            | DebugHandlerConfiguration            | ❌ No handler exists     | ✅ DONE                                               |
| `deduplication`    | `type_deduplication`    | DeduplicationHandlerConfiguration    | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | DynamoDbHandler         | ✅ DO NOTHING                                         |
| `elastica`         | `type_elastica`         | ElasticaHandlerConfiguration         | ElasticaHandler         | ✅ DONE                                               |
| `elasticsearch`    |                         | ElasticaHandlerConfiguration         | ElasticaHandler         | ❌ DEPRECATED (use `elastica` instead)                |
| `elastic_search`   | `type_elastic_search`   | ElasticsearchHandlerConfiguration    | ElasticsearchHandler    | ✅ DONE                                               |
| `error_log`        | `type_error_log`        | ErrorLogHandlerConfiguration         | ErrorLogHandler         | ✅ DONE                                               |
| `fallbackgroup`    | `type_fallbackgroup`    | FallbackGroupHandlerConfiguration    | FallbackGroupHandler    | ✅ DONE                                               |
| `filter`           | `type_filter`           | FilterHandlerConfiguration           | FilterHandler           | ✅ DONE                                               |
| `fingers_crossed`  | `type_fingers_crossed`  | FingersCrossedHandlerConfiguration   | FingersCrossedHandler   | ✅ DONE                                               |
| `firephp`          | `type_firephp`          | FirePHPHandlerConfiguration          | FirePHPHandler          | ✅ DONE                                               |
|                    |                         |                                      | FleepHookHandler        | 🤔 No type! No configuration! What should we do?     |
| `flowdock`         | `type_flowdock`         | FlowdockHandlerConfiguration         | FlowdockHandler         | ✅ DONE                                               |
| `gelf`             | `type_gelf`             | GelfHandlerConfiguration             | GelfHandler             | ✅ DONE                                               |
| `group`            | `type_group`            | GroupHandlerConfiguration            | GroupHandler            | ✅ DONE                                               |
| `hipchat`          | `type_hipchat`          | HipchatHandlerConfiguration          | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | IFTTTHandler            | ✅ DO NOTHING                                         |
| `insightops`       | `type_insightops`       | InsightOpsHandlerConfiguration       | InsightOpsHandler       | ✅ DONE                                               |
| `logentries`       | `type_logentries`       | LogEntriesHandlerConfiguration       | LogEntriesHandler       | ✅ DONE                                               |
| `loggly`           | `type_loggly`           | LogglyHandlerConfiguration           | LogglyHandler           | ✅ DONE                                               |
|                    |                         |                                      | LogmaticHandler         | 🤔 No type! No configuration! What should we do?     |
| `mongo`            | `type_mongo`            | MongoHandlerConfiguration            | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | MailHandler             | ✅ DO NOTHING                                         |
|                    |                         | ❌ No dedicated configuration         | MandrillHandler         | ✅ DO NOTHING                                         |
|                    |                         | ❌ No dedicated configuration         | MongoDBHandler          | ✅ DO NOTHING                                         |
| `native_mailer`    | `type_native_mailer`    | NativeMailerHandlerConfiguration     | NativeMailerHandler     | ✅ DONE                                               |
| `newrelic`         | `type_newrelic`         | NewRelicHandlerConfiguration         | NewRelicHandler         | ✅ DONE                                               |
| `noop`             | `type_noop`             |                                      | NoopHandler             | ❌ TODO                                               |
| `null`             | `type_null`             | NullHandlerConfiguration             | NullHandler             | ✅ DONE                                               |
|                    |                         |                                      | OverflowHandler         | 🤔 No type! No configuration! What should we do?     |
| `predis`           | `type_predis`           | PredisHandlerConfiguration           | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | PHPConsoleHandler       | ✅ DO NOTHING                                         |
|                    |                         | ❌ No dedicated configuration         | ProcessHandler          | ✅ DO NOTHING                                         |
|                    |                         | ❌ No dedicated configuration         | PsrHandler              | ✅ DO NOTHING                                         |
| `pushover`         | `type_pushover`         | PushoverHandlerConfiguration         | PushoverHandler         | ✅ DONE                                               |
| `raven`            | `type_raven`            | RavenHandlerConfiguration            | ❌ No handler exists     | ✅ DONE                                               |
| `redis`            | `type_redis`            | RedisHandlerConfiguration            | RedisHandler            | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | RedisPubSubHandler      | ✅ DO NOTHING                                         |
| `rollbar`          | `type_rollbar`          | RollbarHandlerConfiguration          | RollbarHandler          | ✅ DONE                                               |
| `rotating_file`    | `type_rotating_file`    | RotatingFileHandlerConfiguration     | RotatingFileHandler     | ✅ DONE                                               |
| `sampling`         | `type_sampling`         | SamplingHandlerConfiguration         | SamplingHandler         | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | SendGridHandler         | ✅ DO NOTHING                                         |
| `sentry`           | `type_sentry`           | SentryHandlerConfiguration           | ❌ No handler exists     | ✅ DONE                                               |
| `server_log`       | `type_server_log`       | ServerlogHandlerConfiguration        | ❌ No handler exists     | ✅ DONE                                               |
|                    |                         | ServiceHandlerConfiguration          | ❌ No handler exists     | 🤔 No type but one configuration! What should we do? |
| `slackbot`         | `type_slackbot`         | SlackbotHandlerConfiguration         | ❌ No handler exists     | ✅ DONE                                               |
| `slack`            | `type_slack`            | SlackHandlerConfiguration            | SlackHandler            | ✅ DONE                                               |
| `slackwebhook`     | `type_slackwebhook`     | SlackWebhookHandlerConfiguration     | SlackWebhookHandler     | ✅ DONE                                               |
| `socket`           | `type_socket`           | SocketHandlerConfiguration           | SocketHandler           | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | SqsHandler              | ✅ DO NOTHING                                         |
| `stream`           | `type_stream`           | StreamHandlerConfiguration           | StreamHandler           | ✅ DONE                                               |
| `swift_mailer`     | `type_swift_mailer`     | SwiftMailerHandlerConfiguration      | ❌ No handler exists     | ✅ DONE                                               |
| `symfony_mailer`   | `type_symfony_mailer`   | SymfonyMailerHandlerConfiguration    | SymfonyMailerHandler    | ✅ DONE                                               |
| `syslog`           | `type_syslog`           | SyslogHandlerConfiguration           | SyslogHandler           | ✅ DONE                                               |
| `syslogudp`        | `type_syslogudp`        | SysLogUdpHandlerConfiguration        | SyslogUdpHandler        | ✅ DONE                                               |
| `telegram`         | `type_telegram`         | TelegramBotHandlerConfiguration      | TelegramBotHandler      | ✅ DONE                                               |
| `test`             | `type_test`             | TestHandlerConfiguration             | TestHandler             | ✅ DONE                                               |
|                    |                         | VerbosityLevelHandlerConfiguration   | ❌ No handler exists     | 🤔 No type but one configuration! What should we do? |
| `whatfailuregroup` | `type_whatfailuregroup` | WhatFailureGroupHandlerConfiguration | WhatFailureGroupHandler | ✅ DONE                                               |
|                    |                         | ❌ No dedicated configuration         | ZendMonitorHandler      | ✅ DO NOTHING                                         |

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

⬅️ [MonologBundle](../monolog.md)
