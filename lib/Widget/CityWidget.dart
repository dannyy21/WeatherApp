import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../Model/city.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Services/WeatherService.dart'; 
import 'package:http/http.dart' as http;
import 'package:weatherapp/Controller/HomeController.dart';

class Kota extends  GetView<HomeController> {
   Kota({
    Key? key,required this.provId,
  }) : super(key: key);
final int provId;
final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  @override
    WeatherService _weatherService = WeatherService();
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: 
      DropdownSearch<City>(
        showClearButton: true,
        key: _formKey,
        mode: Mode.MENU,
        validator: (value) {
          if (value!.isNotEmpty!) {
          return 'Please enter some text';
          }
        },
        dropdownSearchDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        labelText: "Kota",
        hintText: "Cari Kota",
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)),
        ),
        onFind: (String? filter) async {
        Uri url = Uri.parse("https://api.rajaongkir.com/starter/city?province=$provId");
        try{
        final response = await http.get(url,
         headers: {
              // 'Content-Type': 'application/x-www-form-urlencoded',
              "key": "44ac3f903ea5c86eb2930161c738d6af",
          },
        );
        var data = jsonDecode(response.body) as Map<String, dynamic>;
        var statusCode = data["rajaongkir"]["status"]["code"];
        if (statusCode != 200){
          throw data["rajaongkir"]["status"]["description"];
        }
        var listAllCity = data["rajaongkir"]["results"] as List<dynamic>;
        var models = City.fromJsonList(listAllCity);
        return models;
        }catch(err){
          print(err);
          return List<City>.empty();
        }
        },
    onChanged: (cityValue) {
    if(cityValue != null){

      // controller.asalKota.value= int.parse(cityValue.cityId!);
      print(cityValue.cityName);
    }else{
      print("Tidak memilih Kota");  
    }
   final item = cityValue;
    controller.asalKota.value = cityValue!.cityName!;
  // controller.asalKota.value = item!.cityName;
  // controller.asalKota.value.toString();
  },
  itemAsString: (item)=>item!.cityName!,
    
    showSearchBox: true,
    
    popupItemBuilder: (context, item, isSelected){
  
      return Container(
        
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
        child : Text("${item.type} ${item.cityName}", style: TextStyle(fontSize:18))
      
      );
      
    },
    
    // itemAsString: (item)=>"${item!.type} ${item.cityName}",
    
    ),

    
    
    );
    
    
}
}