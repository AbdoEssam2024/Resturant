class CategoriesDataModel {
  int? categoryId;
  String? categoryName;
  String? categoryImage;

  CategoriesDataModel({this.categoryId, this.categoryName, this.categoryImage});

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }
}