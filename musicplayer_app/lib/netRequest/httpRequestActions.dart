import 'package:flutter/material.dart';
import 'package:musicplayer_app/netRequest/httpUtil.dart';
import 'package:dio/dio.dart';
import 'package:musicplayer_app/netRequest/api.dart';

class HttpRequestActions {

  static Future getRequest(String url, callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken}) async {
    var response = await HttpUtil().get(url,
        data: queryParameters, options: options, cancelToken: cancelToken);

    callback(response.data as Map<String, dynamic>);
  }

  //推荐歌单
  static Future getRecommendListData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.PERSONALIZED_URL, callback);
  }

  //banner轮播图
  static Future getIphoneBannertData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.IPHONE_BANNER, callback);
  }

  //排行榜
  static Future getLeaderboardListData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.TOPLIST_URL, callback);
  }

  //单个排行榜
  static Future getLeaderboardDetailListData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.TOPLISTDETAIL_URL, callback, queryParameters: queryParameters);
  }

  //歌单分类
  static Future getCatListData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.LIGHT_MUSIC, callback);
  }

  //获取音乐url
  static Future getMusicUrlData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.MUSICPLAYING_URL, callback, queryParameters: queryParameters);
  }

  //获取MVurl
  static Future getMVUrlData(callback(Map<String, dynamic> result),
      {Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken}) async {
    return HttpRequestActions.getRequest(Api.MVPLAYING_URL, callback, queryParameters: queryParameters);
  }
}
