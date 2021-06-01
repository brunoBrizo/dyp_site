class Product {
  String name;
  String image;
  String url;
  String description;
  String pdf;

  Product({this.name, this.image, this.url, this.description, this.pdf});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    url = json['url'];
    description = json['description'];
    pdf = json['pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['url'] = this.url;
    data['description'] = this.description;
    data['pdf'] = this.pdf;
    return data;
  }
}
