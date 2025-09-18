# Legacy VS New default configuration

⬅️ [MonologBundle](../monolog.md)

---

## How generate default config in a file?

```shell
docker compose exec php php bin/console config:dump-reference monolog >build/monolog-default-config.yaml
docker compose exec php php bin/console config:dump-reference monolog --format=xml >build/monolog-default-config.xml
```

## Legacy default configuration

* [monolog-default-config-legacy-syntax.yaml](yaml/monolog-default-config-legacy-syntax.yaml)
* [monolog-default-config-legacy-syntax.xml](xml/monolog-default-config-legacy-syntax.xml)

## New default configuration

* [default-config-new-syntax.yaml](yaml/monolog-default-config-new-syntax.yaml)
* [default-config-new-syntax.xml](xml/monolog-default-config-new-syntax.xml)

---

⬅️ [MonologBundle](../monolog.md)
