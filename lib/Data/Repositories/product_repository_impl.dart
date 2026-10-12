import 'package:mobility/Data/DataSource/product_remote_data_source.dart';
import 'package:mobility/Domain/Entity/product.dart';
import 'package:mobility/Domain/Repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final response = await productRemoteDataSource.getProducts();
    return response.products.map((e) => e.toDomain()).toList();
  }
}
