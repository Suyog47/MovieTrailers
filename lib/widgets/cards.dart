import 'package:flutter/material.dart';
import 'package:movie_trailers/constants/colors.dart';
import 'package:movie_trailers/constants/heights.dart';
import 'package:movie_trailers/custom_class/navigations.dart';

class Cards extends StatelessWidget {
  final id,thumbnail, name;
  
  Cards({this.id, this.thumbnail, this.name});

  @override
  Widget build(BuildContext context) {
    var height =  MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        Navigate().toInformation(context, {'id': id});
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Column(
            children: [
              Container(
                height: height * 0.30,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              height5,
              Text(name, style: TextStyle(color: whiteColor, fontSize: 18, fontStyle: FontStyle.italic),),
            ],
          ),
        ),
      ),
    );
  }
}
