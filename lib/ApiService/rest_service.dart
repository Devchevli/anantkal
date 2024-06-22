import 'package:assignment/model/CreateModel.dart';
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
}



class UserDetail {
  String? status;
  String? message;
  List<Data>? data;

  UserDetail({this.status, this.message, this.data});

  UserDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? city;
  String? state;
  String? dateOfBirth;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.gender,
        this.address,
        this.city,
        this.state,
        this.dateOfBirth,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['date_of_birth'] = dateOfBirth;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
