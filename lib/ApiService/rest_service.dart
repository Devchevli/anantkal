import 'dart:io';

import 'package:assignment/model/CreateModel.dart';
import 'package:assignment/model/chat_model.dart';
import 'package:assignment/model/user_detail.dart';
import 'package:dio/dio.dart';

class RestService {
  final Dio _dio;

  RestService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.baii.me/api/',
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        )..options.headers['AuthToken'] = '2ec26ad9-e039-445e-915e-zACl56sr2q';

  Future<CreateUser> createUser({
    required String name,
    required String email,
    required String phone_number,
    required String gender,
    required String address,
    required String city,
    required String state,
    required String date_of_birth,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "phone_number": phone_number,
      "gender": gender,
      "address": address,
      "city": city,
      "state": state,
      "date_of_birth": date_of_birth,
    };

    Response res = await _dio.post(
      "createglobaluser",
      data: data,
    );

    CreateUser createUser = CreateUser.fromJson(res.data);
    return createUser;
  }

  Future<UserDetail> getUserDetail({
    required String email,
  }) async {
    var data = {
      "email": email,
    };

    Response res = await _dio.post(
      "showglobaluser",
      data: data,
    );

    UserDetail userDetail = UserDetail.fromJson(res.data);
    return userDetail;
  }

  Future<ChatModel> getAllChat() async {
    Response res = await _dio.get(
      "showglobalchat",
    );

    ChatModel chatModel = ChatModel.fromJson(res.data);
    return chatModel;
  }

  Future<CreateUser> sendChat({
    required String userId,
    String message = "",
    // String image = "",
    File? file,
  }) async {
    // FormData formData;
    // if (file != null) {
    //   String fileName = file.path.split('/').last;
    //   formData = FormData.fromMap({
    //     "user_id": userId,
    //     "message": message,
    //     "image": await MultipartFile.fromFile(file.path, filename: fileName),
    //   });
    // } else {
    //   formData = FormData.fromMap({
    //     "user_id": userId,
    //     "message": message,
    //   });
    // }

    FormData formData = FormData.fromMap({
      "user_id": userId,
      "message": message,
      if (file != null)
        "image": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    });

    Response res = await _dio.post(
      "createglobalchat",
      data: formData,
    );


    // var formData = {
    //   "user_id": userId,
    //   "message": message,
    //   "image": image,
    // };
    //
    // Response res = await _dio.post(
    //   "createglobalchat",
    //   data: formData,
    // );

    CreateUser createUser = CreateUser.fromJson(res.data);
    return createUser;
  }
}
