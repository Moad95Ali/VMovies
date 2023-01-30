import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Description extends StatelessWidget {
  final String name, descripthion, bannerurl, posterurl, vote, launch_on, image;
  const Description({
    super.key,
    required this.name,
    required this.descripthion,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    print(name);
    print(descripthion);
    print(bannerurl);
    print(posterurl);
    print(vote);
    print(launch_on);
    print(image);

    return Scaffold(
      backgroundColor: Color(0xFF131738),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          image: DecorationImage(
                              image: NetworkImage(bannerurl),
                              fit: BoxFit.cover)),
                      height: 250,
                      width: 500,
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xFFFE0078),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            ' ⭐ Rating : ' + vote,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      'Rleasing On - ' + launch_on,
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 150,
                height: 155,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    descripthion,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            // if (image != null)
            //   Container(
            //     width: 200,
            //     height: 300,
            //     child: Image.network(image),
            //   )
          ],
        ),
      ),
    );
  }
}
