import 'package:dio/dio.dart';
import 'package:mobility/Data/DTO/product_dto.dart';

abstract class ProductRemoteDataSource {
  Future<ProductListDTO> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  static const _baseUrl = "https://dummyjson.com/products";
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<ProductListDTO> getProducts() async {
    final response = await dio.get(_baseUrl);
    return ProductListDTO.fromJson(response.data);
  }
}
