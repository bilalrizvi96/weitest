import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weitest/Constant/Color.dart';
import 'package:weitest/Controller/MainController.dart';
import 'package:weitest/Model/MainModel.dart';
class MainScreen extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Form(
            key: mainController.FormKey,
            child: GetBuilder(
              init: mainController,
              builder: (_){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 23,
                        width: MediaQuery.of(context).size.width /
                            1.3,
                        child: new TextFormField(
                          controller:mainController.search.value,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: DynamicColor().textcolor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: DynamicColor().textcolor,
                                width: 1.0,
                              ),
                            ),
                            prefixIcon: new Icon(Icons.search,
                                color: DynamicColor().textcolor),
                            border: new OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(
                                const Radius.circular(50.0),
                              ),
                              borderSide: BorderSide(
                                color: DynamicColor().textcolor,
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: DynamicColor().textcolor),
                            hintText: "Search Profile",
                            contentPadding: EdgeInsets.all(5.0),

                            //fillColor: DynamicColor().textcolor
                            // ),
                          ),
                          onChanged:(value){
                            mainController.Movie(value);
                          },
                        ),
                      ),
                    ),

                    GetBuilder<MainController>(
                      init: mainController,
                        builder: (_){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(height: height/1.2,
                              padding: EdgeInsets.all(10.0),
                              child: Center(child: DataDisplay(context),)
                          ),
                        );
                    })

                  ],
                );
              },
            )


          ),
        ),
      ),
    );
  }
  DataDisplay(context){
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    if(mainController.mainmodel.isNotEmpty){
     return ListView.builder(
         itemCount: mainController.mainmodel.length,
       itemBuilder: (_,index){
        return Container(
          width: width,
          height: height/3,

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  mainController.mainmodel[index].Poster,width:width,height: height/5,
              fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(width:width/2,child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mainController.mainmodel[index].Title,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(mainController.mainmodel[index].imdbID,style: TextStyle(fontSize: width/33,color: Colors.blueGrey),),
                      ],
                    )),
                    Spacer(),
                    Column(
                      children: [
                        Text(mainController.mainmodel[index].Year,style: TextStyle(fontSize: width/30,color: Colors.grey)),
                        Text(mainController.mainmodel[index].Type,style: TextStyle(fontSize: width/33,color: Colors.blueGrey)),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ) ,
        );
      },

         );
    }
    else{
     return Text('Please Search');
    }

  }
}
