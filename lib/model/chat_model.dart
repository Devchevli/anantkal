class ChatModel {
  String? status;
  String? message;
  List<Data>? data;

  ChatModel({this.status, this.message, this.data});

  ChatModel.fromJson(Map<String, dynamic> json) {
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
  ChatDetails? chatDetails;
  List<UserDetails>? userDetails;

  Data({this.chatDetails, this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    chatDetails = json['Chat_details'] != null
        ? ChatDetails.fromJson(json['Chat_details'])
        : null;
    if (json['user_details'] != null) {
      userDetails = <UserDetails>[];
      json['user_details'].forEach((v) {
        userDetails!.add(UserDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatDetails != null) {
      data['Chat_details'] = chatDetails!.toJson();
    }
    if (userDetails != null) {
      data['user_details'] = userDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatDetails {
  int? id;
  String? userId;
  String? image;
  String? message;
  String? createdAt;
  String? updatedAt;

  ChatDetails(
      {this.id,
      this.userId,
      this.image,
      this.message,
      this.createdAt,
      this.updatedAt});

  ChatDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserDetails {
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

  UserDetails(
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

  UserDetails.fromJson(Map<String, dynamic> json) {
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
