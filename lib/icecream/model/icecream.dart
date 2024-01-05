import 'dart:convert';

class IcecreamData {
  List<Icecream> icecreams;

  IcecreamData({
    required this.icecreams,
  });

  factory IcecreamData.fromJson(Map<String, dynamic> json) {
    return IcecreamData(
      icecreams: (json['icecreams'] as List<dynamic>)
          .map((e) => Icecream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icecreams': icecreams.map((e) => e.toJson()).toList(),
    };
  }
}

class Icecream {
  String flavor;
  String? description;
  List<String>? toppings;
  double price;
  String? image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    this.description,
    this.toppings,
    required this.price,
    this.image,
    required this.ingredients,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      flavor: json['flavor'] as String,
      description: json['description'] as String?,
      toppings: (json['toppings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flavor': flavor,
      'description': description,
      'toppings': toppings,
      'price': price,
      'image': image,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}

IcecreamData icecreamDataFromJson(String str) {
  final jsonData = json.decode(str) as Map<String, dynamic>;
  return IcecreamData.fromJson(jsonData);
}

String icecreamDataToJson(IcecreamData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
