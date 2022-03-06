import 'package:bookmyshow/models/movie.dart';

//Singleton
class MovieOperations {
  static MovieOperations _movieOperations = MovieOperations();
  _MovieOperations() {}
  static MovieOperations getInstance() {
    return _movieOperations;
  }

  List<Movie> getMovies() {
    return [
      Movie(
        name: 'The Batman',
        language: 'English/Hindi',
        d: '2D/3D',
        imageURL: 'https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/xxlarge/the-batman-et00129624-31-01-2022-02-23-17.jpg',
        percentage: 95.9,
        votes: '24,555',
      ),Movie(
        name: 'Gangubai Kathiawadi',
        language: 'Hindi',
        d: '2D',
        imageURL: 'https://i.ytimg.com/vi/xK2_6yX7aF8/maxresdefault.jpg',
        percentage: 87.4,
        votes: '61,379',
      ),Movie(
        name: '''Main Viyah Nahi 
        Karona Tere Naal''',
        language: 'Punjabi',
        d: '2D',
        imageURL: 'https://opt.toiimg.com/recuperator/img/toi/m-86139872/86139872.jpg&width=500&resizemode=4',
        percentage: 75.3,
        votes: '5,117',
      ),Movie(
        name: 'Badhaai Do',
        language: 'Hindi',
        d: '2D',
        imageURL: 'https://akm-img-a-in.tosshub.com/aajtak/images/story/202202/badhaai-do-sixteen_nine.jpg?size=1200:675',
        percentage: 70,
        votes: '15,843',
      ),
    ];
  }
}
