import 'package:flutter/material.dart';

import '../movies/presentation/screens/movies_screen.dart';
import '../tvs/presentation/screens/tv_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

int pageIndex = 0;
final pages = [
  const MoviesScreen(),
  const TvScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.black,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'MOVIE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV',
            ), 
      ],
      selectedIconTheme: const IconThemeData(
        color: Colors.cyanAccent,
        shadows: []
        ),
        currentIndex: pageIndex,
      
      onTap: (index){
        setState(() {
          pageIndex = index;
        });
      },
      ),
    );
  }
}