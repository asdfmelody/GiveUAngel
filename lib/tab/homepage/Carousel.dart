import 'package:flutter/material.dart';
class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;

  //double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //screenHeight=size.height;
    //screenWidth=size.width;

    return AnimatedPositioned(
      duration: duration,
      child: Material(
        animationDuration: duration,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15), // 간격
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: 1.0),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network('http://blogfiles.naver.net/20111005_244/qufwhd23_1317820011524joyvX_JPEG/main_banner1.jpg'),
                        width: 100,

                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(
                            'https://post-phinf.pstatic.net/MjAxODEwMjVfMjYz/MDAxNTQwNDM0Mjc2MDU1.7UG4HPJDfizX3SuSSlg9Vbkt0nEJGAk7AV3n5f_gPAwg.ovDqcVAOuiMnhvehh4rha8AweXEbclaismLdQE-Laogg.PNG/756E69636566661539327593-80.png?type=w1200'),
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(
                            'http://post.phinf.naver.net/20160126_289/1453792810768A2aEY_JPEG/129_film1982.jpg/IAHfmE9cCXb1lnyYgZMJDqmyh5gg.jpg'),
                        width: 100,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}