# [dart中Json序列化全局统一解析](https://pub.dev/packages/json_conversion)

提供json序列化统一处理功能,可用于网络请求成功之后的统一解析

## 使用 添加如下依赖
```
dependencies:
  json_conversion_annotation: ^0.0.4

dev_dependencies:
  build_runner: ^2.0.0
  json_conversion: ^0.0.4

```

### 1. 在lib目录下创建一个空dart文件,添加注解,类名随意 [example](https://github.com/jiang111/json_conversion/blob/main/example/lib/json.dart)
```
@JsonConversionTarget()
class Json{}

```

### 2. 在你需要统一处理的实体类里添加@JsonConversion()注解 [example](https://github.com/jiang111/json_conversion/blob/main/example/lib/src/user_bean.dart)
```
@JsonConversion()
class UserBean{

  static UserBean jsonConversion(Map<String, dynamic> json) {
    return UserBean();
  }
}

```

### 3.运行 flutter pub run build_runner build 命令,就会生成json.jc.dart文件 [generated file ](https://github.com/jiang111/json_conversion/blob/main/example/lib/json.jc.dart)

### 4.如何调用 [example](https://github.com/jiang111/json_conversion/blob/main/example/test/example_test.dart)
```
UserBean userBean = JsonConversion$Json.fromJson<UserBean>(json);
```



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


