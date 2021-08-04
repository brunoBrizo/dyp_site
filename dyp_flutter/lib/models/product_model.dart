class Product {
  String name;
  String image;
  String url;
  String description;
  String pdf;
  String tipo;
  String brand;

  Product(
      {this.name,
      this.image,
      this.url,
      this.description,
      this.pdf,
      this.tipo,
      this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    url = json['url'];
    description = json['description'];
    pdf = json['pdf'];
    tipo = json['tipo'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['url'] = this.url;
    data['description'] = this.description;
    data['pdf'] = this.pdf;
    data['tipo'] = this.tipo;
    data['brand'] = this.brand;
    return data;
  }
}
