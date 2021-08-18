import 'package:example/src/news/news_bean.dart';
import 'package:example/src/user_bean.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/json.jc.dart';

void main() {
  test('test user bean ', () {
    UserBean userBean = JsonConversion$Json.fromJson<UserBean>({
      "name": "NewTab",
      "address": "China",
      "child": {"name": "NewTab2", "address": "China2"}
    });

    print(userBean.name);
  });

  test('test user bean list ', () {
    List<UserBean> userBean = JsonConversion$Json.fromJson<List<UserBean>>([
      {
        "name": "NewTab",
        "address": "China",
        "child": {"name": "NewTab2", "address": "China2"}
      }
    ]);

    print(userBean.first.name);
  });

  test('test news bean list ', () {
    List<NewsBean> newsBean = JsonConversion$Json.fromJson<List<NewsBean>>([
      {
        "title": "a big thing",
        "desc": "hello",
      }
    ]);

    print(newsBean.first.title);
  });
}
