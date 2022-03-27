class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.date,
    required this.bio,
    required this.myposts,
    required this.mydiaries,
    required this.mobile,
    required this.id,
  });
  late final String? username;
  late final String? email;
  late final String? date;
  late final String? bio;
  late final List<dynamic>? myposts;
  late final List<dynamic>? mydiaries;
  late final String? mobile;
  late final String? id;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    bio = json['bio'];
    // myposts = List.castFrom<dynamic, dynamic>(json['myposts']);
    // mydiaries = List.castFrom<dynamic, dynamic>(json['mydiaries']);
    mobile = json['mobile'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['date'] = date;
    _data['bio'] = bio;
    _data['myposts'] = myposts;
    _data['mydiaries'] = mydiaries;
    _data['mobile'] = mobile;
    _data['id'] = id;
    return _data;
  }
}
