class PopularCarsModel {
  final String image;
  final String name;
  final String location;
  final String rating;

  PopularCarsModel(
      {required this.image,
      required this.name,
      required this.location,
      required this.rating});
}

List<PopularCarsModel> popularCars = [
  PopularCarsModel(
      image: "assets/mercedescla.jpg",
      name: 'Mercedes CLA',
      location: 'İstanbul',
      rating: '4.7'),
  PopularCarsModel(
      image: "assets/audiaa5.jpg",
      name: 'Audi A5',
      location: 'Antalya',
      rating: '4.7'),
  PopularCarsModel(
      image: "assets/peugeot.jpg",
      name: 'peugeot 3800',
      location: 'İstanbul',
      rating: '4.0'),
  PopularCarsModel(
      image: "assets/mercedesgla.jpg",
      name: 'Mercedes GLA',
      location: 'İstanbul',
      rating: '4.5'),
  PopularCarsModel(
      image: "assets/renault.jpg",
      name: 'Renault clio',
      location: 'Antalya',
      rating: '3.8'),
];
