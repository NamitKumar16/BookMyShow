import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookmyshow/models/movie.dart';
import 'package:bookmyshow/repo/movie_operations.dart';

class Home extends StatelessWidget {
  List<Movie> movieList = [];
  Home() {
    MovieOperations opr = MovieOperations();
    movieList = opr.getMovies();
  }

  _getAppBar() {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 49, 49, 65),
      leading: const Icon(
        Icons.menu,
        size: 30,
      ),
      title: Center(
        child: Container(
          width: 250,
          child: Stack(
            children: [
              Positioned(
                  left: 115,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 81, 81, 97),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 120,
                      height: 40,
                      child: const Center(
                          child: Text(
                        'COMING SOON',
                        style: TextStyle(fontSize: 15),
                      )))),
              Positioned(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 240, 9, 78),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: 120,
                    height: 40,
                    child: const Center(
                        child: Text(
                      'NOW SHOWING',
                      style: TextStyle(fontSize: 15),
                    ))),
              )
            ],
          ),
        ),
      ),
      actions: const [
        Icon(
          Icons.location_on,
          size: 28,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  List<Widget> _prepareMovieCards() {
    List<Widget> list = movieList.map((movie) {
      double vote_percentage = movie.percentage;
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Card(
          child: Column(
            children: [
              Stack(children: [
                Image.network(movie.imageURL),
                Positioned(
                  top: -11,
                  child: ButtonTheme(
                    height: 28,
                    minWidth: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 7, 218, 77),
                      child: const Text(
                        "New",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(174, 34, 34, 34)),
                    height: 65,
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 255, 66, 89),
                            ),
                            Text(
                              "  $vote_percentage" + "%",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text(
                          movie.votes.toString() + " votes",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 19),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  movie.language,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 163, 163, 163)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 163, 163, 163))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(movie.d),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 66, 89)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "BOOK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    return list;
  }

  _getBottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 114, 114, 114),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Just For You',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Profile',
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: deviceSize.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: deviceSize.width / 2.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.language,
                            color: Color.fromARGB(255, 29, 236, 243)),
                        SizedBox(width: 15),
                        Text("All Languages",
                            style: TextStyle(
                                color: Color.fromARGB(255, 108, 108, 108),
                                fontWeight: FontWeight.w500,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  const Text(
                    "|",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(225, 236, 236, 236)),
                  ),
                  Container(
                    height: 70,
                    width: deviceSize.width / 2.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.chair, color: Colors.redAccent),
                        SizedBox(width: 15),
                        Text("Cinemas",
                            style: TextStyle(
                                color: Color.fromARGB(255, 108, 108, 108),
                                fontWeight: FontWeight.w500,
                                fontSize: 16))
                      ],
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.black12,
                  child: Column(
                    children: _prepareMovieCards(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      bottomNavigationBar: _getBottomBar(),
    );
  }
}
