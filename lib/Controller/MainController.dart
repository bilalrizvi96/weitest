import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weitest/Model/MainModel.dart';

class MainController extends GetxController{
  var search= TextEditingController().obs;
  final FormKey = GlobalKey<FormState>();
  List<MovieModel> mainmodel=[];
  @override
  void onInit() {
    super.onInit();
  }
  // String? searchvalidators(var values) {
  //   if (search.value.text.length <= 3) {
  //     return 'Minimum 3 Words';
  //   }
  //   return null;
  // }
  Future Movie(var title) async {

    var dio = Dio();
    mainmodel.clear();
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.get(
        'http://www.omdbapi.com/?s=$title&page=2&apikey=564727fa',
      );

        if (response.statusCode == 200) {
          update();
          var data = response.data;
          var check = data['Search'];
          for (Map i in check) {
            mainmodel.add(MovieModel(
             Title: i['Title'],
              imdbID: i['imdbID'],
              Poster: i['Poster'],Type: i['Type'],Year: i['Year']
            ));
          }
        } else {
          update();
        }
  }
  // static Future Tag() async {
  //   Dio dio = new Dio();
  //   try {
  //     await dio
  //         .get(tagurl,
  //         options: Options(headers: {
  //           HttpHeaders.authorizationHeader: header,
  //           'Content-Type': "multipart/formdata",
  //           Headers.acceptHeader: "application/json"
  //         }))
  //         .then((response) async {
  //       if (response.statusCode == 200) {
  //         var data = response.data;
  //         var check = data['success'];
  //         for (Map i in check) {
  //           tags.add(Tags(
  //             id: i['id'],
  //             name: i['name'],
  //           ));
  //         }
  //         compelete = true;
  //         success = "true";
  //       }
  //     }).catchError((error) {
  //       print(error);
  //       compelete = false;
  //       success = "error";
  //       success_error = error.toString();
  //     });
  //   } catch (e) {
  //     print(e);
  //     compelete = false;
  //   }
  // }
}