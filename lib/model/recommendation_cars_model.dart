class RecommendationCarsModel {
  final String image;
  final String name;
  final String location;
  final String rating;
  final String price;

  RecommendationCarsModel(
      {required this.image,
      required this.name,
      required this.location,
      required this.rating,
      required this.price});
}

List<RecommendationCarsModel> ReccomendationCars = [
  RecommendationCarsModel(
      image: "assets/mercedescla.jpg",
      name: 'Mercedes CLA',
      location: 'İstanbul',
      rating: '4.7',
      price: '\$25'),
  RecommendationCarsModel(
      image: "assets/audiaa5.jpg",
      name: 'Audi A5',
      location: 'Antalya',
      rating: '4.5',
      price: '\$22'),
  RecommendationCarsModel(
      image: "assets/peugeot.jpg",
      name: 'Peugeot 3800',
      location: 'İstanbul',
      rating: '4.0',
      price: '\$20'),
  RecommendationCarsModel(
      image: "assets/mercedesgla.jpg",
      name: 'Mercedes GLA',
      location: 'İstanbul',
      rating: '4.5',
      price: '\$28'),
  RecommendationCarsModel(
      image: "assets/renault.jpg",
      name: 'Renault clio',
      location: 'Antalya',
      rating: '3.8',
      price: '\$18'),
];
