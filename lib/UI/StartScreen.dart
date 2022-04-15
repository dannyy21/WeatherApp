// import 'dart:convert';

// import 'package:dropdown_search/dropdown_search.dart';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Model/datamodel.dart';
import 'package:weatherapp/Services/WeatherService.dart';
import 'package:http/http.dart'as http;
import '../Controller/HomeController.dart';

import '../Model/city.dart';
import '../Model/Province.dart';
import '../Widget/CityWidget.dart';
import '../Widget/ProvinceWidget.dart';
import 'HomeScreen.dart';


class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   TextEditingController name = TextEditingController();
    var controller = Get.put(HomeController());
  WeatherService weatherService = WeatherService();
  WeatherInfo weatherinfo = WeatherInfo();
  bool isFetch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text("Weather"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    isFetch ?

                Column(
                  children: [
                    Image.network('http://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png'),
                    Text('${weatherinfo.temp}°', style: Theme.of(context).textTheme.headline2),
                    Text("${weatherinfo.description}", style: Theme.of(context).textTheme.headline4),
                  ],
                ) : SizedBox(),
                // Container(
                //   width: 150,
                //   padding: EdgeInsets.symmetric(vertical: 50),
                //   child: TextField(
                //     controller: controller,
                //    textAlign: TextAlign.center,
                //    decoration: InputDecoration(labelText:"City"),
                // )
                // ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Name'
                ),
              ),
            ),
                ListView(
                  shrinkWrap: true,
                  children:[
                provinsi(),
                Obx(()=> controller.hiddenKota.isTrue? SizedBox():Kota(provId: controller.provId.value,)
                )])
                ,
                ElevatedButton(
                  onPressed:()
                  async{
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(asalKota:controller.asalKota.value.toString(), name: name.text,)));
                  // var route = MaterialPageRoute(builder: (BuildContext context)=>
                  // HomeScreen(asalKota:controller.asalKota.value.toString()),
                  // Navigator.of(context).push(HomeScreen()));
                   isFetch = true;
                  weatherinfo = await weatherService.getWeather(controller.asalKota.value.toString());
                  setState(() => weatherinfo);
                }, child: Text("search")),
              ],
            ),
          ),
    );
  }
}
