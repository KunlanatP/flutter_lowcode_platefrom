import 'dart:convert';

import 'package:dio/dio.dart';

import '../environment.dart';

class PageContentRepository {
  final Dio _dio;

  const PageContentRepository(this._dio);

  Future<Map<String, dynamic>?> fetchLastContent(
      String appID, String? pageID) async {
    final url = '${Env.backendURL}/pages/${pageID ?? 'home'}/latest?app=$appID';
    final response = await _dio.get<dynamic>(url);
    if (response.statusCode == 204) {
      throw const NoContentError();
    }

    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>?> fetchColorStyleByID(String cid) async {
    final url = '${Env.backendURL}/pages/colors/$cid';
    final response = await _dio.get<dynamic>(url);
    if (response.statusCode == 204) {
      throw const NoContentError();
    }
    print(jsonDecode(response.data));
    return jsonDecode(response.data);
  }
}

class NoContentError implements Exception {
  const NoContentError();
}
