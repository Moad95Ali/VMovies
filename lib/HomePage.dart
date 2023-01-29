import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/widgets/trendingMovies.dart';

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
  List topmovies = [];
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
      topmovies = topRateResult['results'];
      tv = tvResult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return TrendingMovies(trending: trendingmovies);
  }
}
