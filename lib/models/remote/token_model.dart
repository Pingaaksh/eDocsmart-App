class TokenModel {
  String? refresh;
  String? access;

  TokenModel({this.refresh, this.access});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    var token = json['token'] ?? {};
    return TokenModel(
      refresh: token['refresh'] ?? '',
      access: token['access'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': this.refresh,
      'access': this.access,
    };
  }

  bool isValid() {
    return (refresh?.isNotEmpty ?? false) && (access?.isNotEmpty ?? false);
  }
}
