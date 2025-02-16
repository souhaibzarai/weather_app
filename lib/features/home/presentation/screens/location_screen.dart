import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../widgets/text_row.dart';
import '../../../weather/business_logic/cubit/multi_days_weather/multi_days_cubit.dart';
import '../../../weather/data/models/weather_service.dart';
import '../../../../constants/strings.dart';
import '../../../weather/data/models/multi_days_weather/list.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../widgets/location_screen_button.dart';
import '../widgets/steps_item.dart';
import '../../../weather/business_logic/cubit/current_weather/weather_cubit.dart';
import '../../../../helpers/location_helper.dart';

import '../../../../constants/theme/app_colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double? lat;
  double? lng;
  String? errorMsg;

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
    showProgressIndicator();
    try {
      LocationData? currentPosition = await LocationHelper.getCurrentLocation();

      lat = currentPosition!.latitude;
      lng = currentPosition.longitude;

      if (lat != null && lng != null) {
        // ignore: use_build_context_synchronously
        BlocProvider.of<HomeCubit>(context).getCityName(lat!, lng!);
        return;
      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      showScaffold(
        lat == null && lng == null
            ? 'latitude and longitude are null'
            : lat == null
                ? 'latitude is null'
                : 'longitude is null',
      );
    } catch (e) {
      throw Exception('error, couldnt get location $e');
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
      backgroundColor: AppColors.initialColor,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.secondaryColor),
        ),
      ),
    );

    showDialog(
      barrierColor: AppColors.initialColor,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  buildInfoDialogResult() {
    return showModalBottomSheet(
      backgroundColor: AppColors.initialColor,
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
      backgroundColor: AppColors.initialColor,
      dismissDirection: DismissDirection.down,
      duration: Duration(seconds: 20),
    ));
  }

  Widget buildCityNameBloc() {
    WeatherService? weatherService;
    DaysList? daysList;
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            if (state is CityNameLoaded) {
              String formattedAddress =
                  state.city.results.first.formattedAddress;
              context
                  .read<WeatherCubit>()
                  .implementCityNameToUI(formattedAddress);
              context
                  .read<MultiDaysCubit>()
                  .implementMultiDaysWeatherToUI(formattedAddress);
            } else if (state is CityNameError) {
              Navigator.pop(context);
              errorMsg = state.toString();
              showScaffold(errorMsg ??
                  'Error Occurred in Loading City Name || error message empty');
              return;
            }
          },
        ),
        BlocListener<WeatherCubit, WeatherState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            if (state is WeatherLoaded) {
              weatherService = state.weather;
              if (weatherService != null && daysList != null) {
                Navigator.of(context).pushReplacementNamed(
                  weatherScreen,
                  arguments: [weatherService, daysList],
                );
              }
            } else if (state is WeatherError) {
              Navigator.pop(context);
              showScaffold(state.errMsg);
              return;
            }
          },
        ),
        BlocListener<MultiDaysCubit, MultiDaysState>(
          listenWhen: (prev, current) => prev != current,
          listener: (context, state) {
            if (state is MultiDaysWeatherLoaded) {
              daysList = state.daysList;
              if (weatherService != null && daysList != null) {
                Navigator.of(context).pushReplacementNamed(
                  weatherScreen,
                  arguments: [
                    weatherService,
                    daysList,
                  ],
                );
              }
            } else if (state is MultiDaysWeatherError) {
              Navigator.pop(context);
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
          TextRow(),
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
