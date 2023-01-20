class UserResponse{
  UserResponse({
    this.id,
    this.statusMsg,
    this.statuscode,
    this.data,
  });

  UserResponse.withError(String errorMessage) {
    error = errorMessage;
  }

  int? id;
  String? statusMsg;
  int? statuscode;
  Data? data;
  String? error;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"] ?? "",
        statusMsg: json["status_msg"] ?? "",
        statuscode: json["status_code"] ?? "",
        data: json["data"] != null ?Data.fromJson(json["data"]):null,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'status_msg': statusMsg,
      'status_code': statusMsg,
      'data': data!.toJson(),
    };

    return map;
  }
}

class Data{
  Data({
    this.previous,
    this.current,
    this.next,
    this.users
  });

  int? previous;
  int? current;
  int? next;
  List<Users>? users;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        previous: json["previous"]!=null?json["previous"]: null,
        current: json["current"] ?? null,
        next: json["next"] ?? null,
        users: json["users"] != null ?List<Users>.from(json["users"].map((x) => Users.fromJson(x))):null
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'previous': previous,
      'current': current,
      'next': next,
      'users': List<dynamic>.from(users!.map((x) => x.toJson())),
    };

    return map;
  }
}

class Users{
  Users({
    this.id,
    this.isActive,
    this.profile,
    this.company,
    this.about,
    this.registered
  });

  String? id;
  bool? isActive;
  Profile? profile;
  String? company;
  String? about;
  String? registered;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"] ?? "",
        isActive: json["isActive"] ?? "",
        profile: json["profile"] != null ?Profile.fromJson(json["profile"]):null,
        company: json["company"] ?? "",
        about: json["about"] ?? "",
        registered: json["registered"] ?? "",
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'isActive': isActive,
      'profile': profile!.toJson(),
      'company': company,
      'about': about,
      'registered': registered
    };

    return map;
  }
}

class Profile{
  Profile({
    this.picture,
    this.age,
    this.eyeColor,
    this.name,
    this.gender,
    this.email,
    this.phone,
    this.address
  });

  String? picture;
  int? age;
  String? eyeColor;
  String? name;
  String? gender;
  String? email;
  String? phone;
  String? address;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        picture: json["picture"] ?? "",
        age: json["age"] ?? "",
        eyeColor: json["eyeColor"] ?? "",
        name: json["name"] ?? "",
        gender: json["gender"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'picture': picture,
      'age': age,
      'eyeColor': eyeColor,
      'name': name,
      'gender': gender,
      'email': email,
      'phone': phone,
      'address': address,
    };

    return map;
  }
}