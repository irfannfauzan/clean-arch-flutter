import 'package:mobility/Domain/Entity/product.dart';

class ProductDTO {
  final int id;
  final String title;
  final String description;

  ProductDTO({
    required this.id,
    required this.title,
    required this.description,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
  );

  Product toDomain() => Product(id: id, title: title, description: description);
}

class ProductListDTO {
  final List<ProductDTO> products;

  ProductListDTO({required this.products});

  factory ProductListDTO.fromJson(Map<String, dynamic> json) {
    return ProductListDTO(
      products: (json['products'] as List)
          .map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
