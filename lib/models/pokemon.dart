class Pokemon {
  final int id;
  final String name;
  final int order;
  final double weight;
  final double height;
  final String image;
  final List<dynamic> types;
  final String move;
  final Map<String, int> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.order,
    required this.weight,
    required this.height,
    required this.image,
    required this.types,
    required this.move,
    required this.stats,
  });
}
