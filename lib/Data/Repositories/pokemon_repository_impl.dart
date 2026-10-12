import 'package:mobility/Data/DataSource/pokemon_remote_data_source.dart';
import 'package:mobility/Domain/Entity/pokemon.dart';
import 'package:mobility/Domain/Repository/pokemon_repository.dart';

final class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryImpl(this.pokemonRemoteDataSource);

  @override
  Future<List<Pokemon>> getPokemon() async {
    final response = await pokemonRemoteDataSource.getPokemon();
    return response.results.map((e) => e.toDomain()).toList();
  }
}
