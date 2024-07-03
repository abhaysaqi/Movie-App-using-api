import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_page.dart';
import 'package:movie_app/utils/text.dart';
import 'package:quickalert/quickalert.dart';

class Top_movies extends StatelessWidget {
  final List toprated;

  Top_movies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Modified_text(
            text: "Toprated Movies",
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
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      name: toprated[index]["title"],
                                      description: toprated[index]['overview'],
                                      banner_url:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path']
                                      //        ??
                                      // "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                                      ,
                                      post_url:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      vote: toprated[index]['vote_average'],
                                      launch_on: toprated[index]
                                          ['release_date'],
                                    )));
                      } catch (e) {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: e.toString());
                      }
                    },
                    child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500/" +
                                              toprated[index]["poster_path"]))),
                            ),
                            Expanded(
                              child: Container(
                                child: Modified_text(
                                    text: toprated[index]["title"] != null
                                        ? toprated[index]["title"]
                                        : "Loading.."),
                              ),
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
