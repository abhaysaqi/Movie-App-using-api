import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_page.dart';
import 'package:movie_app/utils/text.dart';
import 'package:quickalert/quickalert.dart';

class Trending_movies extends StatelessWidget {
  final List trending;

  Trending_movies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_text(
            text: "Trending Movies",
            size: 26,
            // color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      name: trending[index]["title"],
                                      description: trending[index]['overview'],
                                      banner_url:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path']
                                      //        ??
                                      // "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                                      ,
                                      post_url:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      vote: trending[index]['vote_average'],
                                      launch_on: trending[index]
                                          ['first_air_date'],
                                    )));
                      } catch (e) {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: e.toString());
                      }
                    },
                    child: trending[index]["title"] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500/" +
                                                  trending[index]
                                                      ["poster_path"]))),
                                ),
                                Container(
                                  child: Modified_text(
                                      text: trending[index]["title"] != null
                                          ? trending[index]["title"]
                                          : "Loading.."),
                                )
                              ],
                            ))
                        : Container(),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
