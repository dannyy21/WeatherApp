import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../Model/Province.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Controller/HomeController.dart';

class provinsi extends GetView<HomeController> {
  const provinsi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownSearch<Province>(
        showClearButton: true,
        mode: Mode.MENU,
        validator: (value) => value == null
                    ? 'Please fill in your province' : null,
        dropdownSearchDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        labelText: "Provinsi",
        hintText: "Cari Provinsi",
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)),
        ),
        onFind: (String? filter) async {
        Uri url = Uri.parse("https://api.rajaongkir.com/starter/province");
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
        var listAllProvince = data["rajaongkir"]["results"] as List<dynamic>;
        var models = Province.fromJsonList(listAllProvince);
        return models;
        }catch(err){
          print(err);
          return List<Province>.empty();
        }
        },
  onChanged: (prov) {
    if(prov != null){
     controller.hiddenKota.value = false;
     controller.provId.value = int.parse(prov.provinceId!);
    }else{
       controller.hiddenKota.value = true;
       controller.provId.value = 0;
    }
  },
    showSearchBox: true,
    popupItemBuilder: (context, item, isSelected){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
        child : Text("${item.province}", style: TextStyle(fontSize:18))
      );
    },
    itemAsString: (item)=>item!.province!,
  
    ),
    );
  }
}