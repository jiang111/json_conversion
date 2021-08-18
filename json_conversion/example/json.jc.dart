// GENERATED CODE - DO NOT MODIFY BY HAND

import 'src/news/news_bean.dart';
import 'src/user_bean.dart';

class JsonConversion$Json {

 static M fromJson<M>(dynamic json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json);
    }
  }

  static M _fromJsonSingle<M>(dynamic json) {

    String type = M.toString();

    if(type == (NewsBean).toString()){
      return NewsBean.jsonConversion(json)  as M;
    }
    
    if(type == (UserBean).toString()){
      return UserBean.jsonConversion(json)  as M;
    }
    
    throw Exception("not found");
  }

  static M _getListChildType<M>(List<dynamic> data) {
      if(<NewsBean>[] is M){
      return data.map<NewsBean>((e) => NewsBean.jsonConversion(e)).toList() as M;
    }
    
    if(<UserBean>[] is M){
      return data.map<UserBean>((e) => UserBean.jsonConversion(e)).toList() as M;
    }
    
    throw Exception("not found");
  }
}
