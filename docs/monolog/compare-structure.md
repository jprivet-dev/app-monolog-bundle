# Compare legacy & new MonologBundle structure
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
│   │   ├── BrowserconsoleHandlerConfiguration.php
│   │   ├── BufferHandlerConfiguration.php
│   │   ├── ChannelsHandlerConfiguration.php
│   │   ├── ChromephpHandlerConfiguration.php
│   │   ├── ConsoleHandlerConfiguration.php
│   │   ├── CubeHandlerConfiguration.php
│   │   ├── DebugHandlerConfiguration.php
│   │   ├── DeduplicationHandlerConfiguration.php
│   │   ├── ElasticaHandlerConfiguration.php
│   │   ├── ElasticsearchHandlerConfiguration.php
│   │   ├── ErrorlogHandlerConfiguration.php
│   │   ├── FallbackgroupHandlerConfiguration.php
│   │   ├── FilterHandlerConfiguration.php
│   │   ├── FingerscrossedHandlerConfiguration.php
│   │   ├── FirephpHandlerConfiguration.php
│   │   ├── FlowdockHandlerConfiguration.php
│   │   ├── GelfHandlerConfiguration.php
│   │   ├── GroupHandlerConfiguration.php
│   │   ├── HandlerConfigurationInterface.php
│   │   ├── HipchatHandlerConfiguration.php
│   │   ├── InsightopsHandlerConfiguration.php
│   │   ├── LogentriesHandlerConfiguration.php
│   │   ├── LogglyHandlerConfiguration.php
│   │   ├── MongoHandlerConfiguration.php
│   │   ├── NativeMailerHandlerConfiguration.php
│   │   ├── NewrelicHandlerConfiguration.php
│   │   ├── NullHandlerConfiguration.php
│   │   ├── PredisHandlerConfiguration.php
│   │   ├── PushoverHandlerConfiguration.php
│   │   ├── RavenHandlerConfiguration.php
│   │   ├── RedisHandlerConfiguration.php
│   │   ├── RollbarHandlerConfiguration.php
│   │   ├── RotatingfileHandlerConfiguration.php
│   │   ├── SamplingHandlerConfiguration.php
│   │   ├── SentryHandlerConfiguration.php
│   │   ├── ServerlogHandlerConfiguration.php
│   │   ├── ServiceHandlerConfiguration.php
│   │   ├── SlackbotHandlerConfiguration.php
│   │   ├── SlackHandlerConfiguration.php
│   │   ├── SlackwebhookHandlerConfiguration.php
│   │   ├── SocketHandlerConfiguration.php
│   │   ├── StreamHandlerConfiguration.php
│   │   ├── SwiftMailerHandlerConfiguration.php
│   │   ├── SymfonyMailerHandlerConfiguration.php
│   │   ├── SyslogHandlerConfiguration.php
│   │   ├── SyslogudpHandlerConfiguration.php
│   │   ├── TelegramHandlerConfiguration.php
│   │   ├── TestHandlerConfiguration.php
│   │   ├── VerbosityLevelHandlerConfiguration.php
│   │   └── WhatfailuregroupHandlerConfiguration.php
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
