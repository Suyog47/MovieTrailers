import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_trailers/api/api.dart';
import 'package:movie_trailers/constants/colors.dart';
import 'package:movie_trailers/constants/heights.dart';
import 'package:movie_trailers/constants/widths.dart';
import 'package:movie_trailers/custom_class/navigations.dart';
import 'package:movie_trailers/screens/home_page.dart';

class MovieInformation extends StatefulWidget {
  const MovieInformation({Key? key}) : super(key: key);

  @override
  _MovieInformationState createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  var info;
  Map data = {};
  var count = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  Future getMoviesInfo(id) async {
    info = await Api().getMovieInfo(id);
    setState(() {
      info = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    count++;
    data = ModalRoute.of(context)!.settings.arguments as Map;
    if (count == 1) getMoviesInfo(data["id"]);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget setGenres(dt) {
      return Center(
        child: Wrap(
          runSpacing: 10.0,
          //spacing: 5.0,
          children:
             dt.map<Widget>((obj) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: greenColor,
                        ),
                        child: Text(
                          obj["name"],
                          style: TextStyle(
                              color: whiteColor, fontWeight: FontWeight.bold),
                        )),
                  ))
              .toList(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: blackColor,
          body: info == null
              ?
              //FoldingCubeLoader(bgContainer: true)
              Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(color: whiteColor),
                  ),
                )
              : info == "error"
                  ? Center(
                      child: Text("Something went wrong!...",
                          style: TextStyle(color: whiteColor)),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height * 0.4,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.themoviedb.org/t/p/w780" +
                                            info["poster_path"]),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            height10,
                            height10,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                info["original_title"],
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ),
                            height2,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                info["tagline"],
                                style:
                                    TextStyle(fontSize: 14, color: whiteColor),
                              ),
                            ),
                            height10,
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: greyColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: amberColor,
                                      ),
                                      width2,
                                      Text(
                                        info["vote_average"].toString(),
                                        style: TextStyle(
                                            color: amberColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                width10,
                              ],
                            ),
                            height10,
                            height10,
                            setGenres(info["genres"]),
                            height10,
                            height10,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                info["overview"],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: greyColor),
                              ),
                            ),
                            height10,
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Budget:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                          color: greyColor),
                                    ),
                                    height2,
                                    Text(
                                      info["budget"].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: whiteColor),
                                    ),
                                  ],
                                ),
                                width10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Revenue:",
                                      style: TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                          color: greyColor),
                                    ),
                                    height2,
                                    Text(
                                      info["revenue"].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: whiteColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height10,
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Language:",
                                      style: TextStyle(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          color: greyColor),
                                    ),
                                    height2,
                                    Text(
                                      info["spoken_languages"][0]
                                              ["english_name"]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: whiteColor),
                                    ),
                                  ],
                                ),
                                width30,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Release date:",
                                      style: TextStyle(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          color: greyColor),
                                    ),
                                    height2,
                                    Text(
                                      info["release_date"].toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: whiteColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height30,
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  var dt =
                                      await Api().getMovieTrailer(data["id"]);
                                  var key;
                                  dt["results"].forEach((obj) {
                                    if (obj["type"] == "Trailer") {
                                      key = obj["key"];
                                    }
                                  });
                                  Navigate().toVideo(context, {"key": key});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: blueColor,
                                  ),
                                  child: Text(
                                    "Play Trailer",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            height30,
                          ],
                        ),
                      ),
                    )),
    );
  }
}
