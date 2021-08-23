import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  var apiKey = "e51edddcb0ace0f94d5fe143dc40435d";

  Future authenticate() async {
    Map<String, String> header = {
      'Content-type': "application/json",
    };

    try {
      final response = await http.get(
          Uri.parse(
              "https://api.themoviedb.org/3/authentication/guest_session/new?api_key=$apiKey"),
          headers: header);
      if (response.statusCode == 200) {
        return await get10Movies();
      } else {
        print(response.statusCode);
        print(response.body);
        return "error";
      }
    } catch (e) {
      print("error ${e.toString()}");
    }
  }

  Future get10Movies() async {
    Map<String, String> header = {
      'Content-type': "application/json",
    };

    try {
      final response = await http.get(
          Uri.parse(
              "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US"),
          headers: header);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body));
      } else {
        return "error";
      }
    } catch (e) {
      print("error ${e.toString()}");
    }
  }

  Future getMovieInfo(id) async {
    Map<String, String> header = {
      'Content-type': "application/json",
    };

    try {
      final response = await http.get(
          Uri.parse(
              "https://api.themoviedb.org/3/movie/$id?api_key=$apiKey&language=en-US"),
          headers: header);

      if (response.statusCode == 200) {
        return (jsonDecode(response.body));
      } else {
        return "error";
      }
    } catch (e) {
      print("error ${e.toString()}");
    }
  }

  Future getMovieTrailer(id) async {
    Map<String, String> header = {
      'Content-type': "application/json",
    };

    try {
      final response = await http.get(
          Uri.parse(
              "https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey&language=en-US"),
          headers: header);

      if (response.statusCode == 200) {
        return (jsonDecode(response.body));
      } else {
        return "error";
      }
    } catch (e) {
      print("error ${e.toString()}");
    }
  }
}
