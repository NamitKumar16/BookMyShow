import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  _getAppBar() {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 49, 49, 65),
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

  _getBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
      bottomNavigationBar: _getBottomBar(),
    );
  }
}
