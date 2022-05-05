import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokemonHttp {
  final String urlBase = "https://pokeapi.co/api/v2";

 Future<List<Pokemon>> getListPokemons({int offset = 0, int limit = 21}) async {
    final List<Pokemon> pokemons = [];

    final String url = urlBase + "/pokemon?offset=$offset&limit=$limit";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> results = body['results'];

    for (var i = 0; i < results.length; i++) {
      final response = await http.get(Uri.parse(results[i]['url']));
      final Map<String, dynamic> body = jsonDecode(response.body);

      final Pokemon pokemon = new Pokemon(
        id: body['id'],
        name: body['name'],
        order: body['order'],
        weight: double.parse(body['weight'].toString()),
        height: double.parse(body['height'].toString()),
        image: body['sprites']['other']["official-artwork"]["front_default"],
        types: body['types']
            .map((element) => element['type']['name'])
            .cast<String>()
            .toList() as List<String>,
        move: body['moves'][0]['move']['name'].toString(),
      );

      pokemons.add(pokemon);
    }

    return pokemons;
  }
}
