# Legacy VS New MonologBundle structure
⬅️ [MonologBundle](../monolog.md)

---

## Legacy structure

> 13 directories, 66 files

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

> 15 directories, 118 files

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

⬅️ [MonologBundle](../monolog.md)
