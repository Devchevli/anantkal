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
