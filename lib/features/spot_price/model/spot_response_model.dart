import 'item_model.dart';

class SpotListResponse {
  final String category;
  final List<SpotItem> items;
  final List<String> types;
  final List<TypeSubcategory> typeSubcategoryList;

  SpotListResponse({
    required this.category,
    required this.items,
    required this.types,
    required this.typeSubcategoryList,
  });

  factory SpotListResponse.fromJson(Map<String, dynamic> json) {
    var itemsList = (json['items'] as List)
        .map((item) => SpotItem.fromJson(item))
        .toList();

    var typeSubcategoryList = (json['typeSubcategoryList'] as List)
        .map((subcategory) => TypeSubcategory.fromJson(subcategory))
        .toList();

    return SpotListResponse(
      category: json['category'],
      items: itemsList,
      types: List<String>.from(json['Types']),
      typeSubcategoryList: typeSubcategoryList,
    );
  }
}

// Additional model for type subcategories
class TypeSubcategory {
  final String type;
  final List<String> subcategories;

  TypeSubcategory({
    required this.type,
    required this.subcategories,
  });

  factory TypeSubcategory.fromJson(Map<String, dynamic> json) {
    return TypeSubcategory(
      type: json['type'],
      subcategories: List<String>.from(json['subcategories']),
    );
  }
}