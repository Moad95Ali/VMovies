import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:vmovies/widgets/descriptions.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/HomePage.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Trending Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 34.h,
              child: CarouselSlider.builder(
                itemCount: widget.trending.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Description(
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            widget.trending[index]
                                                ['backdrop_path'],
                                    descripthion: widget.trending[index]
                                            ['overview']
                                        .toString(),
                                    launch_on: widget.trending[index]
                                        ['release_date'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            widget.trending[index]
                                                ['poster_path'],
                                    vote: widget.trending[index]['vote_average']
                                        .toString(),
                                    name: widget.trending[index]['title']
                                        .toString(),
                                    image: 'https://image.tmdb.org/t/p/w500' +
                                        widget.trending[index]['poster_path'],
                                  ))));
                    },
                    child: Container(
                      width: 66.w,
                      child: Column(
                        children: [
                          Container(
                            height: 34.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.solid,
                                    color: Color.fromARGB(255, 9, 11, 29),
                                  )
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          widget.trending[index]
                                              ['poster_path']),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 50.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
