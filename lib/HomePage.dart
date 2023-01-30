import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/widgets/carousel_widget.dart';
import 'package:vmovies/widgets/topRated.dart';
import 'package:sizer/sizer.dart';
import 'package:vmovies/widgets/trendingMovies.dart';
import 'package:vmovies/widgets/tv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingmovies = [];
  List topRatedmovies = [];
  List tv = [];
  final String apiKey = '110b43e411eb0543b6fda80ef4323761';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTBiNDNlNDExZWIwNTQzYjZmZGE4MGVmNDMyMzc2MSIsInN1YiI6IjYzZDYxYjMyMTJiMTBlMDBkZTViOWRlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cW92dty-iGO4AFD2wY60yLa-PZG0_uuM1C52BqehXmo';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRateResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingResult['results'];
      topRatedmovies = topRateResult['results'];
      tv = tvResult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    if (trendingmovies.isEmpty || topRatedmovies.isEmpty || tv.isEmpty) {
      return CircularProgressIndicator();
    }
    return Scaffold(
        backgroundColor: Color(0xFF131738),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: SizedBox(
            height: 50.h,
            child: Image.asset('images/VMoviesText.png'),
          ),
        ),
        body: ListView(
          children: [
            CarouselWidget(items: trendingmovies, title: 'Trending Movies'),
            const Divider(
              thickness: 1,
              color: Color(0xFFFE0078),
            ),
            CarouselWidget(
                items: topRatedmovies, title: 'Trending Rated Movies'),
            const Divider(
              thickness: 1,
              color: Color(0xFFFE0078),
            ),
            CarouselWidget(items: tv, title: 'TV Shows'),
          ],
        ));
  }
}
