class Product {
  int? id;
  int? idCategoryProduct;
  String? name;
  String? imgUrl;
  int? price;
  int? promotionPrice;
  String? description;
  bool? isAdmin;
  bool? status;
  Product(
      {this.id,
      this.idCategoryProduct,
      this.name,
      this.imgUrl,
      this.price,
      this.promotionPrice,
      this.description,
      this.isAdmin,
      this.status});
}
