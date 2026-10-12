import 'package:mobility/Domain/Entity/pokemon.dart';
import 'package:mobility/Domain/Repository/pokemon_repository.dart';

final class GetPokemonUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonUseCase(this.pokemonRepository);

  Future<List<Pokemon>> execute() => pokemonRepository.getPokemon();
}
