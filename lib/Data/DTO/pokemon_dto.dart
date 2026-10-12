import 'package:mobility/Domain/Entity/pokemon.dart';

class PokemonDTO {
  final String name;
  final String url;

  PokemonDTO({required this.name, required this.url});

  factory PokemonDTO.fromJson(Map<String, dynamic> json) {
    return PokemonDTO(name: json['name'] as String, url: json['url'] as String);
  }

  Pokemon toDomain() => Pokemon(name: name, url: url);
}

class PokemonListDTO {
  final List<PokemonDTO> results;

  PokemonListDTO({required this.results});

  factory PokemonListDTO.fromJson(Map<String, dynamic> json) {
    return PokemonListDTO(
      results: (json['result'] as List)
          .map((e) => PokemonDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
