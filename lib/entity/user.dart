//登录请求
class LoginRequestEntity {
  LoginRequestEntity({
    required this.username,
    required this.password,
    required this.grantType,
  });
  late final String username;
  late final String password;
  late final String grantType;

  LoginRequestEntity.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['password'];
    grantType = json['grant_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['grant_type'] = grantType;
    return _data;
  }
}

//登录返回

class LoginResponseEntity {
    AdditionalInformation? additionalInformation;
    int? expiration;
    bool? expired;
    int? expiresIn;
    List<String>? scope;
    String? tokenType;
    String? value;

    LoginResponseEntity({this.additionalInformation, this.expiration, this.expired, this.expiresIn, this.scope, this.tokenType, this.value});

    LoginResponseEntity.fromJson(Map<String, dynamic> json) {
        this.additionalInformation = json["additionalInformation"] == null ? null : AdditionalInformation.fromJson(json["additionalInformation"]);
        this.expiration = json["expiration"];
        this.expired = json["expired"];
        this.expiresIn = json["expiresIn"];
        this.scope = json["scope"]==null ? null : List<String>.from(json["scope"]);
        this.tokenType = json["tokenType"];
        this.value = json["value"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if(this.additionalInformation != null)
            data["additionalInformation"] = this.additionalInformation?.toJson();
        data["expiration"] = this.expiration;
        data["expired"] = this.expired;
        data["expiresIn"] = this.expiresIn;
        if(this.scope != null)
            data["scope"] = this.scope;
        data["tokenType"] = this.tokenType;
        data["value"] = this.value;
        return data;
    }
}

class AdditionalInformation {
    AdditionalInformation();

    AdditionalInformation.fromJson(Map<String, dynamic> json) {

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        return data;
    }
}
