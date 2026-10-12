import 'package:mobility/Domain/Entity/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemon();
}
