import 'package:flutter/material.dart';
import 'package:movie_app/apikey.dart';
import 'package:movie_app/pages/top_movie.dart';
import 'package:movie_app/pages/top_tv.dart';
import 'package:movie_app/pages/trending.dart';
import 'package:movie_app/utils/text.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_movies();
  }

  List trending_movies = [];
  List top_movies = [];
  List tv = [];
  final api_key = API_KEY;
  final acess_token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDUzMDI2MDQ4MjIxMDYzMDYxMDcwMzBiNGI5NjljZCIsInN1YiI6IjY2NWEwZDY2NDZmMzBmMTM3NDc1MjNlYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XSCecRgMHJJWep2r-Q1pmDfs_gMevzN3cNfpCLWbJhA";

  load_movies() async {
    try {
      TMDB tmdb_result = TMDB(ApiKeys(api_key, acess_token),
          logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
      Map trending__movies_result = await tmdb_result.v3.trending.getTrending();
      Map top_movies_result = await tmdb_result.v3.movies.getTopRated();
      Map top_tv_result = await tmdb_result.v3.tv.getPopular();

      setState(() {
        trending_movies = trending__movies_result["results"];
        top_movies = top_movies_result["results"];
        tv = top_tv_result["results"];
      });
      // print(trending_movies);
      // print(top_movies);
      print(tv);
    } catch (e) {
      QuickAlert.show(
          context: context, type: QuickAlertType.error, text: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Modified_text(
            text: "Flutter Movie App",
          )),
      body: ListView(
        children: [
          Top_tv(top_tv: tv),
          Top_movies(toprated: top_movies),
          Trending_movies(trending: trending_movies),
        ],
      ),
    );
  }
}
