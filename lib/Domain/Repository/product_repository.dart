import 'package:mobility/Domain/Entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
