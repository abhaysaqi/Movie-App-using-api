import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_page.dart';
import 'package:movie_app/utils/text.dart';
import 'package:quickalert/quickalert.dart';

class Top_tv extends StatelessWidget {
  final List top_tv;

  Top_tv({Key? key, required this.top_tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_text(
            text: "Popular Tv Episoded",
            size: 26,
            // color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: top_tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      name: top_tv[index]["name"],
                                      description: top_tv[index]['overview'] ??
                                          "NO overview found",
                                      banner_url:
                                          'https://image.tmdb.org/t/p/w500' +
                                                  top_tv[index]
                                                      ['backdrop_path'] ??
                                              "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg",
                                      //        ??
                                      // "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",

                                      post_url: 'https://image.tmdb.org/t/p/w500' +
                                              top_tv[index]['poster_path'] ??
                                          "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg",
                                      vote: top_tv[index]['vote_average'],
                                      launch_on: top_tv[index]
                                          ['first_air_date'],
                                    )));
                      } catch (e) {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: e.toString());
                      }
                    },
                    child: Container(
                        width: 250,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 140,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500/" +
                                                top_tv[index]["poster_path"]),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Container(
                              // width: 250,
                              child: Modified_text(
                                  text: top_tv[index]["name"] != null
                                      ? top_tv[index]["name"]
                                      : "Loading.."),
                            )
                          ],
                        )),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
