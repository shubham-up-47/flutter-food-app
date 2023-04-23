class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  int productQuantity;
  String productId;
  List<dynamic> productUnit;
  
  ProductModel(
    {
      required this.productQuantity,
      required this.productImage, 
      required this.productName,
      required this.productPrice,
      required this.productId,
      required this.productUnit
    }
  );
}


