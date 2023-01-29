import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/HomePage.dart';

import '../styles/textStyle.dart';

class TrendingMovies extends StatefulWidget {
  final List trending;
  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  State<TrendingMovies> createState() => TrendingMoviesState();
}

class TrendingMoviesState extends State<TrendingMovies> {
  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: [
          Container(
            height: 560,
            child: PageView.builder(
                controller: _pageController,
                itemCount: widget.trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${widget.trending[index]['poster_path']}",
                                scale: 5),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          )
        ],
      ),
    ]));
  }
}
