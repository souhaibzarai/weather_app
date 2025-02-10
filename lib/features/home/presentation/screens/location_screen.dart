import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:softux_weather/features/home/presentation/widgets/location_screen_button.dart';
import 'package:softux_weather/features/home/presentation/widgets/steps_item.dart';
import 'package:softux_weather/helpers/location_helper.dart';

import '../../../../constants/theme/app_colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double? currentLatitude;
  late double? currentLongitude;

  bool isLoadingPosition = false;

  Widget buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Set u',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          child: Image.asset(
            'assets/images/locationIcon.png',
            width: 26,
          ),
        ),
        Text(
          ' your location',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget buildDetectLocationButton() {
    return LocationScreenButton(
      imagePATH: 'assets/images/location.png',
      bgColor: AppColors.secondaryColor,
      buttonWidthAndHeight: 50,
      width: 110,
      height: 70,
      onTap: getLatitudeAndLongitudeAndPushWeatherScreen,
    );
  }

  Future<void> getLatitudeAndLongitudeAndPushWeatherScreen() async {
    setState(() {
      isLoadingPosition = true;
    });

    try {
      Position? currentPosition = await LocationHelper.getMyCurrentLocation();

      currentLatitude = currentPosition?.latitude ?? (30.47);
      currentLongitude = currentPosition?.longitude ?? (-8.87);

      print('$currentLatitude , $currentLongitude');

      if (currentLatitude != null && currentLongitude != null) {
        // Navigator.pushReplacementNamed(context, weatherScreen,);
        // TODO: weather page
      }
    } catch (e) {
      print('error, couldnt get location $e');
    } finally {
      setState(() {
        isLoadingPosition = false;
      });
    }
  }

  // void showProgressIndicator() {
  //   AlertDialog alertDialog = AlertDialog(
  //     backgroundColor: AppColors.backgroundColor,
  //     elevation: 0,
  //     content: Center(
  //       child: Column(
  //         children: [
  //           Text('getting current location'),
  //           CircularProgressIndicator.adaptive(
  //             valueColor: AlwaysStoppedAnimation(
  //               AppColors.secondaryColor,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //   showDialog(
  //     context: context,
  //     barrierColor: AppColors.backgroundColor,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return alertDialog;
  //     },
  //   );
  // }

  Widget buildInfoButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: LocationScreenButton(
        imagePATH: 'assets/images/info.png',
        bgColor: AppColors.mainColor,
        buttonWidthAndHeight: 50,
        onTap: buildInfoDialogResult,
      ),
    );
  }

  buildInfoDialogResult() {
    return showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor,
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 1.5,
                        color: AppColors.mainColor,
                        constraints: BoxConstraints(
                          minHeight: 210,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 25),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How to use app?',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 20),
                      StepsItem(text: 'Enable Location Services'),
                      SizedBox(height: 8),
                      StepsItem(text: 'Grant Location Permission'),
                      SizedBox(height: 8),
                      StepsItem(text: 'Auto-Detect Location'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      isDismissible: true,
      enableDrag: true,
      elevation: 5,
      showDragHandle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      margin: EdgeInsets.only(
        left: 20,
        top: 40,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextRow(),
          buildDetectLocationButton(),
          buildInfoButton(),
        ],
      ),
    );

    if (isLoadingPosition) {
      content = Center(
        child: CircularProgressIndicator(
          color: AppColors.secondaryColor,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: content,
        ),
      ),
    );
  }
}
