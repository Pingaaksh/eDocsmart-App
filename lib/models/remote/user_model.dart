// ignore_for_file: unnecessary_lambdas

class UserModel {
  int? id;
  String? name;
  String? email;
  int? userType;
  String? age;
  String? gender;
  String? city;
  int? countryId;
  int? isBlocked;
  int? languageId;
  String? createdAt;
  String? token;
  List<PreviousSkinCondition>? previousSkinConditions;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.age,
    this.gender,
    this.city,
    this.countryId,
    this.isBlocked,
    this.languageId,
    this.createdAt,
    this.token,
    this.previousSkinConditions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        userType: json['user_type'],
        age: json['age'],
        gender: json['gender'],
        city: json['city'],
        countryId: json['country_id'],
        isBlocked: json['is_blocked'],
        languageId: json['language_id'],
        createdAt: json['created_at'],
        token: json['result']?['token']?['access'],
        previousSkinConditions: json['previous_skin_conditions'] == null
            ? []
            : List<PreviousSkinCondition>.from(
                json['previous_skin_conditions']!
                    .map((x) => PreviousSkinCondition.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'user_type': userType,
        'age': age,
        'gender': gender,
        'city': city,
        'country_id': countryId,
        'is_blocked': isBlocked,
        'language_id': languageId,
        'created_at': createdAt,
        'token': token,
        'previous_skin_conditions': previousSkinConditions == null
            ? []
            : List<dynamic>.from(
                previousSkinConditions!.map((x) => x.toJson())),
      };
}

class PreviousSkinCondition {
  int? conditionId;
  String? allergies;

  PreviousSkinCondition({
    this.conditionId,
    this.allergies,
  });

  factory PreviousSkinCondition.fromJson(Map<String, dynamic> json) =>
      PreviousSkinCondition(
        conditionId: json['condition_id'],
        allergies: json['allergies'],
      );

  Map<String, dynamic> toJson() => {
        'condition_id': conditionId,
        'allergies': allergies,
      };
}
