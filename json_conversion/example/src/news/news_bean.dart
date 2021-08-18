import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// @author newtab on 2021/8/18
@JsonConversion()
class NewsBean {
  String? title;
  String? desc;

  static NewsBean jsonConversion(Map<String, dynamic> json) {
    return NewsBean()
      ..desc = json["desc"]
      ..title = json["title"];
  }
}
