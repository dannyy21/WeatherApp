// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:weatherapp/Services/WeatherService.dart';

// import '../Controller/HomeController.dart';
// import '../Model/datamodel.dart';

// class HomeScreen extends GetView<HomeController> {
//   String name;
//   HomeScreen({ 
//     Key? key, required this.asalKota,required this.name
//     }) : super(key: key);
//   final String asalKota;
//     var controller = Get.put(HomeController());
//   WeatherService weatherService = WeatherService();
//   WeatherInfo weatherinfo = WeatherInfo();
//     // final weatherService = await weatherService.getWeather(controller.asalKota.value.toString());
//   bool isFetch = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          appBar: AppBar(title: Text("Weather"),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                   isFetch ?
//                 Column(
//                   children: [
//                     // setState(() => weatherinfo);
//                     Text('Nama: $name'),
//                     Image.network('http://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png'),
//                     Text('${weatherinfo.temp}°', style: Theme.of(context).textTheme.headline2),
//                     Text("${weatherinfo.description}", style: Theme.of(context).textTheme.headline4),
                    
//                   ],
                  
//                 ) 
//               :SizedBox(),
//               ], 
//               )));
//   }
// }
// void cuaca()async{
//     WeatherService weatherService = WeatherService();
//     WeatherInfo weatherinfo = WeatherInfo();
//     var controller = Get.put(HomeController());
//     weatherinfo = await weatherService.getWeather(controller.asalKota.value.toString());
// }


// // import 'package:day11_weather_app/data_service.dart';
// // import 'package:flutter/material.dart';

// // import 'models.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   final _cityTextController = TextEditingController();
// //   final _dataService = DataService();

// //   WeatherResponse _response;

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         home: Scaffold(
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             if (_response != null)
// //               Column(
// //                 children: [
// //                   Image.network(_response.iconUrl),
// //                   Text(
// //                     '${_response.tempInfo.temperature}°',
// //                     style: TextStyle(fontSize: 40),
// //                   ),
// //                   Text(_response.weatherInfo.description)
// //                 ],
// //               ),
// //             Padding(
// //               padding: EdgeInsets.symmetric(vertical: 50),
// //               child: SizedBox(
// //                 width: 150,
// //                 child: TextField(
// //                     controller: _cityTextController,
// //                     decoration: InputDecoration(labelText: 'City'),
// //                     textAlign: TextAlign.center),
// //               ),
// //             ),
// //             ElevatedButton(onPressed: _search, child: Text('Search'))
// //           ],
// //         ),
// //       ),
// //     ));
// //   }

// //   void _search() async {
// //     final response = await _dataService.getWeather(_cityTextController.text);
// //     setState(() => _response = response);
// //   }
// // }