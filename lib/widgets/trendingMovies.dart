import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/HomePage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 560,
            child: PageView.builder(
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
            height: 300,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
