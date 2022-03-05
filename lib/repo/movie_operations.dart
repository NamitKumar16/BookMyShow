import 'package:bookmyshow/models/movie.dart';

//Singleton
class MovieOperations {
  static MovieOperations _movieOperations = MovieOperations();
  _MovieOperations() {}
  static MovieOperations getInstance() {
    return _movieOperations;
  }

  List<Movie> getPosts() {
    return [
      Movie(
        name: 'The Batman',
        language: 'English',
        d: '3D',
        imageURL: 'https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/xxlarge/the-batman-et00129624-31-01-2022-02-23-17.jpg',
        percentage: 95,
        votes: '20,555',
      ),
    ];
  }
}
