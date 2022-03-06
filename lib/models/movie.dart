import 'dart:ffi';

class Movie {
  late String name;
  late String language;
  late String d;
  late double percentage;
  late String votes;
  late String imageURL;
  Movie(
      {required this.name,
      required this.language,
      required this.d,
      required this.percentage,
      required this.votes,
      required this.imageURL});
}
