import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/themes/app_colors.dart';
import 'package:pokedex/themes/app_fonts.dart';
import 'package:pokedex/themes/app_images.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)?.settings.arguments as Pokemon;

    goBack() {
      Navigator.of(context).pop();
    }

    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.types[pokemon.types[0]],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    height: 230,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            AppImages.pokeball,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: goBack,
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        pokemon.name,
                                        style: TextStyle(
                                          fontFamily: AppFonts
                                              .pokemonNameHomeCard.fontFamily,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "#" + "${pokemon.id}".padLeft(3, '0'),
                                  style: TextStyle(
                                    fontFamily: AppFonts
                                        .pokemonNameHomeCard.fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    height: queryData.size.height - 331,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: pokemon.types.map((type) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.types[type],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    fontFamily: AppFonts
                                        .pokemonNameHomeCard.fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(
                                  fontFamily:
                                      AppFonts.pokemonNameHomeCard.fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.types[pokemon.types[0]],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.keyboard_command_key_rounded,
                                          color: AppColors.darkGray,
                                          size: 16,
                                        ),
                                        Text(
                                          "${pokemon.weight / 10} Kg".replaceAll(".", ","),
                                          style: TextStyle(
                                            fontFamily: AppFonts
                                                .pokemonNameHomeCard
                                                .fontFamily,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "weight",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                    vertical: BorderSide(
                                      color: AppColors.lightGray,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.keyboard_command_key_rounded,
                                          color: AppColors.darkGray,
                                          size: 16,
                                        ),
                                        Text(
                                          "${pokemon.height / 10} m".replaceAll(".", ","),
                                          style: TextStyle(
                                            fontFamily: AppFonts
                                                .pokemonNameHomeCard
                                                .fontFamily,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "height",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      pokemon.move,
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.darkGray,
                                      ),
                                    ),
                                    Text(
                                      "move",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "There is a plant seed on its back right from \nthe day this Pokémon is born. \nThe seed slowly grows larger.",
                                style: TextStyle(
                                  fontFamily:
                                      AppFonts.pokemonNameHomeCard.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.darkGray,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Base Stats",
                                style: TextStyle(
                                  fontFamily:
                                      AppFonts.pokemonNameHomeCard.fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.types[pokemon.types[0]],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 20),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "HP",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                    Text(
                                      "ATK",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                    Text(
                                      "DEF",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                    Text(
                                      "SATK",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                    Text(
                                      "SDEF",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                    Text(
                                      "SPD",
                                      style: TextStyle(
                                        fontFamily: AppFonts
                                            .pokemonNameHomeCard.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.types[pokemon.types[0]],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text("045"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("049"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 49,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("049"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 49,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("065"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("065"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("045"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          width: 180,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .types[pokemon.types[0]]!
                                                .withAlpha(150),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  color: AppColors.types[
                                                      pokemon.types[0]],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 51,
                left: (queryData.size.width / 2) - 125,
                child: ClipRRect(
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
