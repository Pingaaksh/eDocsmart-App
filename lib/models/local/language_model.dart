class LanguageModel {
  int? id;
  String? imageUrl;
  String? name;
  String? slug;

  LanguageModel({
    this.id,
    this.imageUrl,
    this.name,
    this.slug,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json['id'],
        imageUrl: json['image_url'],
        name: json['name'],
        slug: json['slug'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
        'name': name,
        'slug': slug,
      };
}
