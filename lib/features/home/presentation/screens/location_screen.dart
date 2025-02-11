import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:softux_weather/constants/strings.dart';
import 'package:softux_weather/features/home/business_logic/cubit/home_cubit.dart';
import 'package:softux_weather/features/home/presentation/widgets/location_screen_button.dart';
import 'package:softux_weather/features/home/presentation/widgets/steps_item.dart';
import 'package:softux_weather/features/weather/business_logic/cubit/weather_cubit.dart';
import 'package:softux_weather/features/weather/data/models/weather_service.dart';
import 'package:softux_weather/helpers/location_helper.dart';

import '../../../../constants/theme/app_colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double? lat;
  late double? lng;
  late String? errorMsg;

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
    try {
      LocationData? currentPosition = await LocationHelper.getCurrentLocation();

      lat = currentPosition?.latitude ?? (30.47);
      lng = currentPosition?.longitude ?? (-8.87);
      print('$lat , $lng');

      if (lat != null && lng != null) {
        BlocProvider.of<HomeCubit>(context).getCityName(lat!, lng!);
      }
    } catch (e) {
      print('error, couldnt get location $e');
    }
  }

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

  void showProgressIndicator() {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.secondaryColor),
        ),
      ),
    );

    showDialog(
      barrierColor: AppColors.backgroundColor,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
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

  showScaffold(String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: AppColors.backgroundColor,
      dismissDirection: DismissDirection.down,
      duration: Duration(seconds: 20),
    ));
  }

  Widget buildCityNameBloc() {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            if (state is CityNameLoading) {
              showProgressIndicator();
            } else if (state is CityNameLoaded) {
              BlocProvider.of<WeatherCubit>(context).implementCityNameToUI(
                  state.city.results.first.formattedAddress);
            } else if (state is CityNameError) {
              errorMsg = state.toString();
              showScaffold(errorMsg ?? 'Error Message Empty');
            }
          },
        ),
        BlocListener<WeatherCubit, WeatherState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            if (state is WeatherLoading) {
              showProgressIndicator();
            } else if (state is WeatherLoaded) {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(
                weatherScreen,
                arguments: state.weather,
              );
            } else if (state is WeatherError) {
              errorMsg = state.errMsg;
              showScaffold(errorMsg!);
            }
          },
        ),
      ],
      child: SizedBox.shrink(),
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
          SizedBox.shrink(),
          buildDetectLocationButton(),
          buildCityNameBloc(),
          buildInfoButton(),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: content,
        ),
      ),
    );
  }
}
