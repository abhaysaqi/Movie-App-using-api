import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Detail extends StatelessWidget {
  final String name, description, banner_url, post_url, launch_on;
  double vote;
  Detail(
      {Key? key,
      required this.name,
      required this.description,
      required this.banner_url,
      required this.post_url,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  // String noimage =
  //     "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))),
      backgroundColor: Colors.black,
      body: Container(
          child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(banner_url,
                      // ? banner_url
                      // : "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                      fit: BoxFit.cover),
                )),
                Positioned(
                  bottom: 10,
                  child: Modified_text(
                      text: "⭐ Average Rating-" + vote.toStringAsFixed(1),
                      color: Colors.yellow,
                      size: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Modified_text(
              text: name ?? 'Loading',
              size: 24,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Modified_text(text: "Releasing on " + launch_on, size: 14),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(post_url),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Modified_text(
                          text: description.length != 0
                              ? description
                              : "No Overviw Found",
                          size: 14)),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
