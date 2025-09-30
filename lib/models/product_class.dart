class ProductClass {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;
  final int? quantity;
  final double? rating;
  final double? price;

  ProductClass({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    this.youtube,
    required this.ingredients,
    required this.measures,
    this.quantity,
    this.rating,
    this.price,
  });

  factory ProductClass.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().isNotEmpty) {
        ingredients.add(ingredient);
      }
      if (measure != null && measure.toString().isNotEmpty) {
        measures.add(measure);
      }
    }

    return ProductClass(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      youtube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}
