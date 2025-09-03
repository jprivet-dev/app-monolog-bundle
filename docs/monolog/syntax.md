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
      opt1: ...
      opt2: ...
      # ... other handler options ...
```

**New Syntax:**

```yaml
monolog:
  handlers:
    name:
      type_xxx: # The key itself defines the handler type
        opt1: ...
        opt2: ...
        # ... handler-specific options ...
```

## Valid cases

### 1. Legacy `type` syntax

This is the traditional way to define a handler type. It remains fully supported.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: stream
      # ... other stream handler options (e.g., path, level) ...
```

### 2. New `type_xxx` syntax

This is the recommended new way to define a handler. The type is implicitly defined by the key, and the `type` sub-key is automatically set for backward compatibility internally.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type_stream: { } # Or with options: type_stream: { path: "php://stderr" }
```

The `stream` handler is correctly identified. Internally, the `type` key is auto-filled (e.g., `type: stream`) for compatibility purposes.

**Note:** If you run `config:dump-reference` after processing this configuration, you would see the `type` key auto-filled:

```yaml
monolog:
  handlers:
    my_handler:
      type: stream # This is auto-filled for internal use
      type_stream:
      # ... stream handler options ...
```
## Invalid cases

### 1. No type definition

This scenario occurs when a handler is defined without specifying its type, either through the `type` key or a `type_xxx` prefixed key.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler: ~ # Or an empty array: my_handler: []
```

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler must have a "type" or a "type_NAME" key defined.
```

### 2. Legacy `type` and new `type_xxx` with same value

This scenario occurs when both the legacy `type` key and a new `type_xxx` prefixed key are used for the same handler, even if they refer to the same type. The bundle enforces a single source of truth for handler type definition.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: stream
      type_stream: { }
```

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: stream" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

### 3. Legacy `type` and new `type_xxx` with different values

Similar to **invalid case 2**, this scenario is when both syntaxes are used, but they define *different* handler types. This explicitly highlights the ambiguity.

**Configuration Example:**

```yaml
monolog:
  handlers:
    my_handler:
      type: rotating_file
      type_stream: { }
```

**Actual Error:**

```
Invalid configuration for path "monolog.handlers.my_handler": A handler can only have one type defined. You have configured multiple types: type_stream and the legacy "type: rotating_file" key. Please choose only one handler type (either a "type_xxx" prefixed key or the legacy "type" key).
```

---

⬅️ [MonologBundle](../monolog.md)
