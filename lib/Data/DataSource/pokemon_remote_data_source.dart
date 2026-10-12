import 'package:dio/dio.dart';
import 'package:mobility/Data/DTO/pokemon_dto.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListDTO> getPokemon();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  static const _baseUrl = "https://pokeapi.co/api/v2/pokemon";
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<PokemonListDTO> getPokemon() async {
    final response = await dio.get(_baseUrl);
    return PokemonListDTO.fromJson(response.data);
  }
}
