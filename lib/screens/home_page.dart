import 'package:flutter/material.dart';
import 'package:movie_trailers/api/api.dart';
import 'package:movie_trailers/constants/colors.dart';
import 'package:movie_trailers/constants/icons.dart';
import 'package:movie_trailers/widgets/cards.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future getMovies() async {
    data = await Api().authenticate();
    setState(() {
      data = data["results"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: blackColor,
      body: Stack(
        children: [
          data == null
              ?
              Center(
                  child: Text("Loading"),
                )
              : data == "error"
                  ? Center(
                      child: Text("Something went wrong!..."),
                    )
                  : Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Cards(
                            id: data[index]["id"],
                            thumbnail:
                                'https://www.themoviedb.org/t/p/w780${data[index]["backdrop_path"]}',
                            name: data[index]["original_title"],
                          );
                        }),
                  ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top 10 Popular Movies",
                  style: TextStyle(
                  fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
