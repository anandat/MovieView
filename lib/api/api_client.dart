import 'package:dio/dio.dart';
import 'package:flutter_shopping_cart/catalog/models/movieListModel.dart';

class ApiClient {

  Dio dio = Dio();

 get(String url) async {
    try{
      Response response = await dio.get(url);
      if (response.statusCode == 200) {

        return response;
      }  else{
        print("Error");
      }
    }catch (e){
      print(e);
    }


  }
}