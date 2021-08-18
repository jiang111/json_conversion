import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// @author newtab on 2021/8/18

@JsonConversion()
class UserBean {
  String? name;
  String? address;
  ChildBean? childBean;

  static UserBean jsonConversion(Map<String, dynamic> json) {
    return UserBean()
      ..address = json["address"]
      ..name = json["name"]
      ..childBean = ChildBean.fromJson(json["child"]);
  }
}

class ChildBean {
  String? name;
  String? address;

  static ChildBean fromJson(Map<String, dynamic> json) {
    return ChildBean()
      ..address = json["address"]
      ..name = json["name"];
  }
}
