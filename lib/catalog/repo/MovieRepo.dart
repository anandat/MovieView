import 'package:dio/dio.dart';
import 'package:flutter_shopping_cart/api/api_client.dart';
import 'package:flutter_shopping_cart/catalog/models/movieListModel.dart';

  class MovieRepo {


    ApiClient apiClient = ApiClient();
    MovieModel movieModel = MovieModel();
    moviedata() async {

      Response model = await apiClient.get("https://movies-sample.herokuapp.com/api/movies");
      movieModel = MovieModel.fromJson(model.data);
      print(movieModel);

        return movieModel;
    }

}