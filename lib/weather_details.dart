// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // For formatting date
// import 'package:softux_weather/constants/theme/app_colors.dart';
// import '../../data/models/current_weather/weather_service.dart';
// import '../../data/models/multi_days_weather/list.dart';
// import '../helper/image_helper.dart';

// class WeatherScreen extends StatelessWidget {
//   const WeatherScreen({
//     super.key,
//     required this.weatherService,
//     required this.daysList,
//   });

//   final WeatherService weatherService;
//   final DaysList daysList;

//   // Convert Kelvin to Celsius (weather API returns temps in Kelvin)
//   double _kelvinToCelsius(double tempK) {
//     return tempK - 273.15;
//   }

//   // Format date for display
//   String _formatDate(int timestamp) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
//     return DateFormat('EEE, MMM d').format(date);
//   }

//   // Format hour for display
//   String _formatHour(int timestamp) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
//     return DateFormat('HH:mm').format(date);
//   }

//   // Group forecast items by date
//   Map<String, List<dynamic>> _groupForecastByDate() {
//     Map<String, List<dynamic>> groupedForecasts = {};

//     // Sort the list by datetime first
//     final sortedList = List.from(daysList.listOfMultiDaysWeather)
//       ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

//     for (var item in sortedList) {
//       String date = _formatDate(item.dateTime);
//       if (!groupedForecasts.containsKey(date)) {
//         groupedForecasts[date] = [];
//       }
//       // Only add if the hour isn't already present for that date
//       if (!groupedForecasts[date]!.any((existing) =>
//           _formatHour(existing.dateTime) == _formatHour(item.dateTime))) {
//         groupedForecasts[date]!.add(item);
//       }
//     }

//     // Keep only the first 5 days
//     return Map.fromEntries(groupedForecasts.entries.take(5));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final groupedForecasts = _groupForecastByDate();

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/weather_status/${ImageHelper.getImagePath(
//                         weatherService.weather.main,
//                         weatherService.weather.description,
//                       )}',
//                       height: 120,
//                       width: 120,
//                     ),
//                     Text(
//                       '${weatherService.name}, ${weatherService.sys.country}',
//                       style: const TextStyle(
//                           fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'TimeZone: ${weatherService.timezone}',
//                       style: const TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                     Text(
//                       '${weatherService.weather.main} - ${weatherService.weather.description}',
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                     Text(
//                       'Temp: ${_kelvinToCelsius(weatherService.main.temp).toStringAsFixed(1)}°C',
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Next Days Forecast:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: groupedForecasts.length,
//                   itemBuilder: (context, index) {
//                     final date = groupedForecasts.keys.elementAt(index);
//                     final dailyForecasts = groupedForecasts[date]!;

//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           date,
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 200,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: dailyForecasts.length,
//                             itemBuilder: (context, hourIndex) {
//                               final item = dailyForecasts[hourIndex];
//                               return Container(
//                                 constraints: const BoxConstraints(
//                                   maxWidth: 100,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: AppColors.secondaryColor.withAlpha(70),
//                                 ),
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 5),
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       _formatHour(item.dateTime),
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Image.asset(
//                                       'assets/images/weather_status/${ImageHelper.getImagePath(
//                                         item.weather.main,
//                                         item.weather.description,
//                                       )}',
//                                       height: 50,
//                                       width: 50,
//                                     ),
//                                     Text(
//                                       '${_kelvinToCelsius(item.main.temp).toStringAsFixed(1)}°C',
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                     Text(
//                                       item.weather.description,
//                                       maxLines: 1,
//                                       style: const TextStyle(
//                                         color: Colors.grey,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
