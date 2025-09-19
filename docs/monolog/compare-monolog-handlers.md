# MonologBundle configurations VS Monolog handlers

⬅️ [MonologBundle](../monolog.md)

---

This document clarifies the relationship between the handler configuration classes in the **MonologBundle** and the actual handler classes in the **Monolog** library. It highlights which handlers are natively integrated and which are specific to the Symfony ecosystem.

* **MonologBundle handler configurations**: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation/DependencyInjection/Handler
* **Monolog handlers**: https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler

| Type (legacy)      | New key type            | MonologBundle configuration              | Monolog handler             | Notes                                                            |
|--------------------|-------------------------|------------------------------------------|-----------------------------|------------------------------------------------------------------|
| `amqp`             | `type_amqp`             | AmqpHandlerConfiguration.php             | AmqpHandler.php             | ✅ DONE                                                           |
| `browser_console`  | `type_browser_console`  | BrowserConsoleHandlerConfiguration.php   | BrowserConsoleHandler.php   | ✅ DONE                                                           |
| `buffer`           | `type_buffer`           | BufferHandlerConfiguration.php           | BufferHandler.php           | ✅ DONE                                                           |
|                    |                         | ChannelsHandlerConfiguration.php         | ❌ No handler exists         | ✅ DONE                                                           |
| `chromephp`        | `type_chromephp`        | ChromePHPHandlerConfiguration.php        | ChromePHPHandler.php        | ✅ DONE                                                           |
| `console`          | `type_console`          | ❌ No dedicated configuration             | CouchDBHandler.php          | ✅ DONE                                                           |
| `cube`             | `type_cube`             | ConsoleHandlerConfiguration.php          | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | CubeHandlerConfiguration.php             | CubeHandler.php             | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | DeduplicationHandler.php    | ✅ DO NOTHING                                                     |
|                    |                         | ❌ No dedicated configuration             | DoctrineCouchDBHandler.php  | ✅ DO NOTHING                                                     |
| `debug`            | `type_debug`            | DebugHandlerConfiguration.php            | ❌ No handler exists         | ✅ DONE                                                           |
| `deduplication`    | `type_deduplication`    | DeduplicationHandlerConfiguration.php    | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | DynamoDbHandler.php         | ✅ DO NOTHING                                                     |
| `elastica`         | `type_elastica`         | ElasticaHandlerConfiguration.php         | ElasticaHandler.php         | ✅ DONE                                                           |
| `elasticsearch`    |                         | ElasticaHandlerConfiguration.php         | ElasticaHandler.php         | ❌ DEPRECATED (use `elastica` instead)                            |
| `elastic_search`   | `type_elastic_search`   | ElasticsearchHandlerConfiguration.php    | ElasticsearchHandler.php    | ❌ ERROR (change `type_elasticsearch` into `type_elastic_search`) |
| `error_log`        | `type_error_log`        | ErrorLogHandlerConfiguration.php         | ErrorLogHandler.php         | ✅ DONE                                                           |
| `fallbackgroup`    | `type_fallbackgroup`    | FallbackGroupHandlerConfiguration.php    | FallbackGroupHandler.php    | ✅ DONE                                                           |
| `filter`           | `type_filter`           | FilterHandlerConfiguration.php           | FilterHandler.php           | ✅ DONE                                                           |
| `fingers_crossed`  | `type_fingers_crossed`  | FingersCrossedHandlerConfiguration.php   | FingersCrossedHandler.php   | ✅ DONE                                                           |
| `firephp`          | `type_firephp`          | FirePHPHandlerConfiguration.php          | FirePHPHandler.php          | ✅ DONE                                                           |
|                    |                         |                                          | FleepHookHandler.php        | 🤔 No type! No configuration! What should we do?                 |
| `flowdock`         | `type_flowdock`         | FlowdockHandlerConfiguration.php         | FlowdockHandler.php         | ✅ DONE                                                           |
| `gelf`             | `type_gelf`             | GelfHandlerConfiguration.php             | GelfHandler.php             | ✅ DONE                                                           |
| `group`            | `type_group`            | GroupHandlerConfiguration.php            | GroupHandler.php            | ✅ DONE                                                           |
| `hipchat`          | `type_hipchat`          | HipchatHandlerConfiguration.php          | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | IFTTTHandler.php            | ✅ DO NOTHING                                                     |
| `insightops`       | `type_insightops`       | InsightOpsHandlerConfiguration.php       | InsightOpsHandler.php       | ✅ DONE                                                           |
| `logentries`       | `type_logentries`       | LogEntriesHandlerConfiguration.php       | LogEntriesHandler.php       | ✅ DONE                                                           |
| `loggly`           | `type_loggly`           | LogglyHandlerConfiguration.php           | LogglyHandler.php           | ✅ DONE                                                           |
|                    |                         |                                          | LogmaticHandler.php         | 🤔 No type! No configuration! What should we do?                 |
| `mongo`            | `type_mongo`            | MongoHandlerConfiguration.php            | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | MailHandler.php             | ✅ DO NOTHING                                                     |
|                    |                         | ❌ No dedicated configuration             | MandrillHandler.php         | ✅ DO NOTHING                                                     |
|                    |                         | ❌ No dedicated configuration             | MongoDBHandler.php          | ✅ DO NOTHING                                                     |
| `native_mailer`    | `type_native_mailer`    | NativeMailerHandlerConfiguration.php     | NativeMailerHandler.php     | ✅ DONE                                                           |
| `newrelic`         | `type_newrelic`         | NewRelicHandlerConfiguration.php         | NewRelicHandler.php         | ✅ DONE                                                           |
| `noop`             | `type_noop`             |                                          | NoopHandler.php             | ❌ TODO                                                           |
| `null`             | `type_null`             | NullHandlerConfiguration.php             | NullHandler.php             | ✅ DONE                                                           |
|                    |                         |                                          | OverflowHandler.php         | 🤔 No type! No configuration! What should we do?                 |
| `predis`           | `type_predis`           | PredisHandlerConfiguration.php           | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | PHPConsoleHandler.php       | ✅ DO NOTHING                                                     |
|                    |                         | ❌ No dedicated configuration             | ProcessHandler.php          | ✅ DO NOTHING                                                     |
|                    |                         | ❌ No dedicated configuration             | PsrHandler.php              | ✅ DO NOTHING                                                     |
| `pushover`         | `type_pushover`         | PushoverHandlerConfiguration.php         | PushoverHandler.php         | ✅ DONE                                                           |
| `raven`            | `type_raven`            | RavenHandlerConfiguration.php            | ❌ No handler exists         | ✅ DONE                                                           |
| `redis`            | `type_redis`            | RedisHandlerConfiguration.php            | RedisHandler.php            | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | RedisPubSubHandler.php      | ✅ DO NOTHING                                                     |
| `rollbar`          | `type_rollbar`          | RollbarHandlerConfiguration.php          | RollbarHandler.php          | ✅ DONE                                                           |
| `rotating_file`    | `type_rotating_file`    | RotatingFileHandlerConfiguration.php     | RotatingFileHandler.php     | ✅ DONE                                                           |
| `sampling`         | `type_sampling`         | SamplingHandlerConfiguration.php         | SamplingHandler.php         | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | SendGridHandler.php         | ✅ DO NOTHING                                                     |
| `sentry`           | `type_sentry`           | SentryHandlerConfiguration.php           | ❌ No handler exists         | ✅ DONE                                                           |
| `server_log`       | `type_server_log`       | ServerlogHandlerConfiguration.php        | ❌ No handler exists         | ✅ DONE                                                           |
|                    |                         | ServiceHandlerConfiguration.php          | ❌ No handler exists         | 🤔 No type but one configuration! What should we do?             |
| `slackbot`         | `type_slackbot`         | SlackbotHandlerConfiguration.php         | ❌ No handler exists         | ✅ DONE                                                           |
| `slack`            | `type_slack`            | SlackHandlerConfiguration.php            | SlackHandler.php            | ✅ DONE                                                           |
| `slackwebhook`     | `type_slackwebhook`     | SlackWebhookHandlerConfiguration.php     | SlackWebhookHandler.php     | ✅ DONE                                                           |
| `socket`           | `type_socket`           | SocketHandlerConfiguration.php           | SocketHandler.php           | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | SqsHandler.php              | ✅ DO NOTHING                                                     |
| `stream`           | `type_stream`           | StreamHandlerConfiguration.php           | StreamHandler.php           | ✅ DONE                                                           |
| `swift_mailer`     | `type_swift_mailer`     | SwiftMailerHandlerConfiguration.php      | ❌ No handler exists         | ✅ DONE                                                           |
| `symfony_mailer`   | `type_symfony_mailer`   | SymfonyMailerHandlerConfiguration.php    | SymfonyMailerHandler.php    | ✅ DONE                                                           |
| `syslog`           | `type_syslog`           | SyslogHandlerConfiguration.php           | SyslogHandler.php           | ✅ DONE                                                           |
| `syslogudp`        | `type_syslogudp`        | SysLogUdpHandlerConfiguration.php        | SyslogUdpHandler.php        | ✅ DONE                                                           |
| `telegram`         | `type_telegram`         | TelegramBotHandlerConfiguration.php      | TelegramBotHandler.php      | ✅ DONE                                                           |
| `test`             | `type_test`             | TestHandlerConfiguration.php             | TestHandler.php             | ✅ DONE                                                           |
|                    |                         | VerbosityLevelHandlerConfiguration.php   | ❌ No handler exists         | 🤔 No type but one configuration! What should we do?             |
| `whatfailuregroup` | `type_whatfailuregroup` | WhatFailureGroupHandlerConfiguration.php | WhatFailureGroupHandler.php | ✅ DONE                                                           |
|                    |                         | ❌ No dedicated configuration             | ZendMonitorHandler.php      | ✅ DO NOTHING                                                     |

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
