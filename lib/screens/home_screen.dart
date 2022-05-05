import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/themes/app_colors.dart';
import 'package:pokedex/themes/app_fonts.dart';
import 'package:pokedex/themes/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/widgets/pokemon_car.dart';
import 'package:infinite_scroll/infinite_scroll.dart';


import '../http/pokemon_http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pokemon> _pokemons = [];
  bool everyThingLoaded = false;

  final pokemonHttp = PokemonHttp();

  bool _isLoading = false;

  Future<void> _loadPokemons() async {
    final pokemons = await pokemonHttp.getListPokemons();

    setState(() {
      _pokemons = pokemons;
    });
  }

  Future<void> _loadMorePokemons() async {
    final pokemons = await pokemonHttp.getListPokemons(
      offset: _pokemons.length,
    );

    if (pokemons.isEmpty) {
      setState(() => everyThingLoaded = true);
    } else {
      List<Pokemon> newPokemons = [];

      pokemons.forEach((pokemon) {
        final tst = _pokemons.where((element) => element.id == pokemon.id);
        if (tst.isEmpty) {
          newPokemons.add(pokemon);
        }
      });
      
      setState(() => _pokemons = [..._pokemons, ...newPokemons]);
    }
  }

  @override
  void initState() {
    _loadPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: AppColors.background,
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.minPokeball,
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        'Pokédex',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(top: 10),
                  height: 25,
                  width: queryData.size.width - 20,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Procurar',
                      hintStyle: AppFonts.searchText,
                    ),
                    style: AppFonts.searchText,
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: queryData.size.width,
                  height: queryData.size.height - 191,
                  child: InfiniteScrollGrid(
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    onLoadingStart: (_) => _loadMorePokemons(),
                    everythingLoaded: everyThingLoaded,
                    children: _pokemons
                        .map((pokemon) => PokemonCard(pokemon))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
