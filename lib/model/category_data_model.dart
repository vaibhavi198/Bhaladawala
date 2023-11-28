class CategoryDataModel {
  int? id;
  String? category;
  String? image;

  CategoryDataModel({this.id, this.category, this.image});

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}