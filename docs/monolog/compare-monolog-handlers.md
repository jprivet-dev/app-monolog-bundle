# MonologBundle configurations VS Monolog handlers

⬅️ [MonologBundle](../monolog.md)

---

This document clarifies the relationship between the handler configuration classes in the **MonologBundle** and the actual handler classes in the **Monolog** library. It highlights which handlers are natively integrated and which are specific to the Symfony ecosystem.

* **MonologBundle handler configurations**: https://github.com/jprivet-dev/monolog-bundle/tree/handler-configuration-segmentation/DependencyInjection/Handler
* **Monolog handlers**: https://github.com/Seldaek/monolog/tree/main/src/Monolog/Handler

| MonologBundle configuration                                     | Monolog handler                                  |
|-----------------------------------------------------------------|--------------------------------------------------|
| **(vendor/symfony/monolog-bundle/DependencyInjection/Handler)** | **(vendor/monolog/monolog/src/Monolog/Handler)** |
| AmqpHandlerConfiguration.php                                    | AmqpHandler.php                                  |
| BrowserconsoleHandlerConfiguration.php                          | BrowserConsoleHandler.php                        |
| BufferHandlerConfiguration.php                                  | BufferHandler.php                                |
| ChannelsHandlerConfiguration.php                                |                                                  |
| ChromephpHandlerConfiguration.php                               | ChromePHPHandler.php                             |
|                                                                 | CouchDBHandler.php                               |
| ConsoleHandlerConfiguration.php                                 |                                                  |
| CubeHandlerConfiguration.php                                    | CubeHandler.php                                  |
|                                                                 | DeduplicationHandler.php                         |
|                                                                 | DoctrineCouchDBHandler.php                       |
| DebugHandlerConfiguration.php                                   |                                                  |
| DeduplicationHandlerConfiguration.php                           |                                                  |
|                                                                 | DynamoDbHandler.php                              |
| ElasticaHandlerConfiguration.php                                | ElasticaHandler.php                              |
| ElasticsearchHandlerConfiguration.php                           | ElasticsearchHandler.php                         |
| ErrorlogHandlerConfiguration.php                                | ErrorLogHandler.php                              |
| FallbackgroupHandlerConfiguration.php                           | FallbackGroupHandler.php                         |
| FilterHandlerConfiguration.php                                  | FilterHandler.php                                |
| FingerscrossedHandlerConfiguration.php                          | FingersCrossedHandler.php                        |
| FirephpHandlerConfiguration.php                                 | FirePHPHandler.php                               |
|                                                                 | FleepHookHandler.php                             |
| FlowdockHandlerConfiguration.php                                | FlowdockHandler.php                              |
| GelfHandlerConfiguration.php                                    | GelfHandler.php                                  |
| GroupHandlerConfiguration.php                                   | GroupHandler.php                                 |
| HandlerConfigurationInterface.php                               | Handler.php                                      |
| HipchatHandlerConfiguration.php                                 |                                                  |
|                                                                 | IFTTTHandler.php                                 |
| InsightopsHandlerConfiguration.php                              | InsightOpsHandler.php                            |
| LogentriesHandlerConfiguration.php                              | LogEntriesHandler.php                            |
| LogglyHandlerConfiguration.php                                  | LogglyHandler.php                                |
|                                                                 | LogmaticHandler.php                              |
| MongoHandlerConfiguration.php                                   |                                                  |
|                                                                 | MailHandler.php                                  |
|                                                                 | MandrillHandler.php                              |
|                                                                 | MongoDBHandler.php                               |
| NativeMailerHandlerConfiguration.php                            | NativeMailerHandler.php                          |
| NewrelicHandlerConfiguration.php                                | NewRelicHandler.php                              |
|                                                                 | NoopHandler.php                                  |
| NullHandlerConfiguration.php                                    | NullHandler.php                                  |
|                                                                 | OverflowHandler.php                              |
| PredisHandlerConfiguration.php                                  |                                                  |
|                                                                 | PHPConsoleHandler.php                            |
|                                                                 | ProcessHandler.php                               |
|                                                                 | PsrHandler.php                                   |
| PushoverHandlerConfiguration.php                                | PushoverHandler.php                              |
| RavenHandlerConfiguration.php                                   |                                                  |
| RedisHandlerConfiguration.php                                   | RedisHandler.php                                 |
|                                                                 | RedisPubSubHandler.php                           |
| RollbarHandlerConfiguration.php                                 | RollbarHandler.php                               |
| RotatingfileHandlerConfiguration.php                            | RotatingFileHandler.php                          |
| SamplingHandlerConfiguration.php                                | SamplingHandler.php                              |
|                                                                 | SendGridHandler.php                              |
| SentryHandlerConfiguration.php                                  |                                                  |
| ServerlogHandlerConfiguration.php                               |                                                  |
| ServiceHandlerConfiguration.php                                 |                                                  |
| SlackbotHandlerConfiguration.php                                |                                                  |
| SlackHandlerConfiguration.php                                   | SlackHandler.php                                 |
| SlackwebhookHandlerConfiguration.php                            | SlackWebhookHandler.php                          |
| SocketHandlerConfiguration.php                                  | SocketHandler.php                                |
|                                                                 | SqsHandler.php                                   |
| StreamHandlerConfiguration.php                                  | StreamHandler.php                                |
| SwiftMailerHandlerConfiguration.php                             |                                                  |
| SymfonyMailerHandlerConfiguration.php                           | SymfonyMailerHandler.php                         |
| SyslogHandlerConfiguration.php                                  | SyslogHandler.php                                |
| SyslogudpHandlerConfiguration.php                               | SyslogUdpHandler.php                             |
| TelegramHandlerConfiguration.php                                | TelegramBotHandler.php                           |
| TestHandlerConfiguration.php                                    | TestHandler.php                                  |
| VerbosityLevelHandlerConfiguration.php                          |                                                  |
| WhatfailuregroupHandlerConfiguration.php                        | WhatFailureGroupHandler.php                      |
|                                                                 | ZendMonitorHandler.php                           |

## Handlers specific to MonologBundle (not in Monolog)

These configuration classes handle Symfony-specific functionalities and do not have a direct equivalent in the Monolog library.

| MonologBundle configuration          | Role                                                                                                 |
|--------------------------------------|------------------------------------------------------------------------------------------------------|
| ChannelsHandlerConfiguration         | Manages logging to specific channels, a core Symfony feature for routing logs.                       |
| ConsoleHandlerConfiguration          | Displays logs directly in the Symfony console for command-line applications.                         |
| DebugHandlerConfiguration            | Collects all log messages during a request for the Symfony Profiler.                                 |
| DeduplicationHandlerConfiguration    | Configures a Monolog handler that suppresses identical log messages over a given time frame.         |
| HipchatHandlerConfiguration          | Integrates with HipChat to send logs as notifications to a room.                                     |
| MongoHandlerConfiguration            | Simplifies the configuration of the Monolog handler for a MongoDB database.                          |
| PredisHandlerConfiguration           | Configures the Monolog handler for sending logs to a Redis server using the Predis library.          |
| RavenHandlerConfiguration            | Integrates with the deprecated Raven PHP client to send logs to a Sentry server.                     |
| SentryHandlerConfiguration           | Configures the Monolog handler for sending logs and exceptions to the Sentry error tracking service. |
| ServerlogHandlerConfiguration        | Directs logs to the internal logger of the Symfony web server for debugging.                         |
| ServiceHandlerConfiguration          | Allows any Symfony service that acts as a logger to be used as a Monolog handler.                    |
| SlackbotHandlerConfiguration         | Formats and sends log messages to a Slack channel via an incoming webhook.                           |
| SwiftMailerHandlerConfiguration      | Integrates with the now-deprecated SwiftMailer library to send log messages via email.               |
| VerbosityLevelHandlerConfiguration   | Dynamically changes the logging level based on the console command's verbosity options.              |

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
