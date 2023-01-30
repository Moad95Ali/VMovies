import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vmovies/HomePage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../styles/textStyle.dart';

class TvShow extends StatefulWidget {
  final List tvShow;
  const TvShow({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  @override
  State<TvShow> createState() => TvShowState();
}

class TvShowState extends State<TvShow> {
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
              'TV Show',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              child: CarouselSlider.builder(
                itemCount: widget.tvShow.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 260,
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: 600,
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
                                          widget.tvShow[index]['poster_path']),
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
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
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
