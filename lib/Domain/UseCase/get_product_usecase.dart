import 'package:mobility/Domain/Entity/product.dart';
import 'package:mobility/Domain/Repository/product_repository.dart';

final class GetProductUseCase {
  final ProductRepository repository;

  GetProductUseCase(this.repository);

  Future<List<Product>> execute() => repository.getProducts();
}
