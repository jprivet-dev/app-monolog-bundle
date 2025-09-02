# Legacy VS New syntax for monolog handlers

⬅️ [MonologBundle](../monolog.md)

---

This document clarifies the valid and invalid ways to configure Monolog handlers in the bundle, distinguishing between the legacy `type` key and the new `type_xxx` prefixed keys.

## Reminder

**Legacy Syntax:**

```yaml
monolog:
  handlers:
    name:
      type: xxx # This defines the handler type directly
      # ... other handler options ...
```

**New Syntax:**

```yaml
monolog:
  handlers:
    name:
      type_xxx: # The key itself defines the handler type
      # ... handler-specific options ...
```

## Case 1 (invalid): no type definition

This scenario occurs when a handler is defined without specifying its type, either through the `type` key or a `type_xxx` prefixed key.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler: ~ # Or an empty array: my_handler: []
```

**Expected Behavior:**

Invalid. A handler *must* have a type defined to be processed.

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler must have a "type" or a "type_NAME" key defined.
```

## Case 2 (valid): legacy `type` syntax

This is the traditional way to define a handler type. It remains fully supported.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: stream
      # ... other stream handler options (e.g., path, level) ...
```

**Expected Behavior:**

Valid. This configuration is correctly parsed, and the handler's type is set to `stream`.

**Actual Result:**

No error. The configuration is successfully processed.

## Case 3 (valid): new `type_xxx` syntax

This is the recommended new way to define a handler. The type is implicitly defined by the key, and the `type` sub-key is automatically set for backward compatibility internally.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type_stream: { } # Or with options: type_stream: { path: "php://stderr" }
```

**Expected Behavior:**

Valid. The `stream` handler is correctly identified. Internally, the `type` key is auto-filled (e.g., `type: stream`) for compatibility purposes.

**Actual Result:**

No error. The configuration is successfully processed.

**Note:** If you run `config:dump-reference` after processing this configuration, you would see the `type` key auto-filled:

```yaml
monolog:
  handlers:
    my_handler:
      type: stream # This is auto-filled for internal use
      type_stream:
      # ... stream handler options ...
```

## Case 4 (invalid): conflicting type definitions (legacy `type` and new `type_xxx` with same value)

This scenario occurs when both the legacy `type` key and a new `type_xxx` prefixed key are used for the same handler, even if they refer to the same type. The bundle enforces a single source of truth for handler type definition.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: stream
      type_stream: { }
```

**Expected Behavior:**

Invalid. Configuring the handler type using both syntaxes leads to an ambiguity, even if the types match. The user must choose one syntax.

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: stream" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

## Case 5 (invalid): conflicting type definitions (legacy `type` and new `type_xxx` with different values)

Similar to Case 4, this scenario is when both syntaxes are used, but they define *different* handler types. This explicitly highlights the ambiguity.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: rotating_file
      type_stream: { }
```

**Expected Behavior:**

Invalid. The presence of conflicting type definitions (from different sources or with different values) is not allowed. The user must choose one syntax.

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: rotating_file" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

---

⬅️ [MonologBundle](../monolog.md)
