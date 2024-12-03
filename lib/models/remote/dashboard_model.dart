
class DashboardModel {
  Categories? dashboardCategories;
  Categories? skinTypesCategories;
  Categories? affectedAreasCategories;
  Categories? skinProblemsCategories;
  List<String>? productsList;

  DashboardModel({
    this.dashboardCategories,
    this.skinTypesCategories,
    this.affectedAreasCategories,
    this.skinProblemsCategories,
    this.productsList,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        dashboardCategories: json['dashboard_categories'] == null
            ? null
            : Categories.fromJson(json['dashboard_categories']),
        skinTypesCategories: json['skin_types_categories'] == null
            ? null
            : Categories.fromJson(json['skin_types_categories']),
        affectedAreasCategories: json['affected_areas_categories'] == null
            ? null
            : Categories.fromJson(json['affected_areas_categories']),
        skinProblemsCategories: json['skin_problems_categories'] == null
            ? null
            : Categories.fromJson(json['skin_problems_categories']),
        productsList: json['products_list'] == null
            ? []
            : List<String>.from(json['products_list']!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'dashboard_categories': dashboardCategories?.toJson(),
        'skin_types_categories': skinTypesCategories?.toJson(),
        'affected_areas_categories': affectedAreasCategories?.toJson(),
        'skin_problems_categories': skinProblemsCategories?.toJson(),
        'products_list':
            productsList == null ? [] : List<dynamic>.from(productsList!.map((x) => x)),
      };
}

class Categories {
  List<String> options;
  List<String> values;

  Categories({
    required this.options,
    required this.values,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        options: List<String>.from(json['options'].map((x) => x)),
        values: List<String>.from(json['values'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'options': List<dynamic>.from(options.map((x) => x)),
        'values': List<dynamic>.from(values.map((x) => x)),
      };
}
