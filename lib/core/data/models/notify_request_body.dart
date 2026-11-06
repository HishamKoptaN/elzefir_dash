class NotifyRequest {
  static final NotifyRequest _instance = NotifyRequest._();
  factory NotifyRequest() {
    return _instance;
  }
  NotifyRequest._();
  List<int>? usersId;
  String? message;
  bool? public;
  factory NotifyRequest.fromJson(Map<String, dynamic> json) {
    _instance.usersId = json['users_id'];
    _instance.message = json['message'];
    _instance.public = json['public'];
    return _instance;
  }
  Map<String, dynamic> toJson() => {
        'users_id': usersId,
        'message': message,
        'public': public,
      };
}
