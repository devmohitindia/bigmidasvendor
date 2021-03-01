class ModelUser
{
  final String userId;
  final String userType;
  final String token;
  final String id;

  ModelUser({this.token,this.id,this.userId, this.userType});

  factory ModelUser.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['token']);
    print(parsedJson['id']);
    return new ModelUser(
//        userId: parsedJson['userid'] ?? "",
//        userType: parsedJson['usertype'] ?? "");
        token: parsedJson['token'] ?? "",
        id: parsedJson['id'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
//      "userid": this.userId,
//      "usertype": this.userType
      "token": this.token,
      "id": this.id
    };
  }

}