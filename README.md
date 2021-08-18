# json_conversion


Provides [Dart Build System] builders for json Unified processing.

## Usage
```
dependencies:
  json_conversion_annotation: ^0.0.1

dev_dependencies:
  build_runner: ^2.0.0
  json_conversion: ^0.0.1

```

### 1.create a empty class in your lib dir [example](https://github.com/jiang111/json_conversion/blob/main/example/lib/json.dart)
```
@JsonConversionTarget()
class Json{}

```

### 2. annotate @JsonConversion() in your bean, and add jsonConversion static method [example](https://github.com/jiang111/json_conversion/blob/main/example/lib/src/user_bean.dart)
```
@JsonConversion()
class UserBean{

  static UserBean jsonConversion(Map<String, dynamic> json) {
    return UserBean();
  }
}

```

### 3. run 'flutter pub run build_runner build' command to generate file [generated file ](https://github.com/jiang111/json_conversion/blob/main/example/lib/json.jc.dart)


### 4. use [example](https://github.com/jiang111/json_conversion/blob/main/example/test/example_test.dart)
```
UserBean userBean = JsonConversion$Json.fromJson<UserBean>(json);
```


