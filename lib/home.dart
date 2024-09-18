import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/constants/weather_constants.dart';
import 'package:weather_app_bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app_bloc/weather_bloc/weather_event.dart';
import 'package:weather_app_bloc/weather_bloc/weather_state.dart';
import 'package:weather_app_bloc/widgets/show_weather_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = WeatherBloc();
    final locationController = TextEditingController();
    bool switchValue = false;
    final focusNode = FocusNode();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        title: const Text(
          WeatherConstants.weatherInYour,
          style: WeatherConstants.appBarTitle,
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Below Code is for the TextField from which we are getting city name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                    child: TextFormField(
                      controller: locationController,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                          hintText: WeatherConstants.city,
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18)))),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ),

                  ///Below Code is for Making the APi call through Bloc and bloc will emit state
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.only(top: 14, left: 30, right: 30, bottom: 14)),
                          ),
                          onPressed: state is WeatherLoadingState
                              ? null
                              : () {
                                  weatherBloc.add(FetchWeatherEvent(locationController.text.trim(),
                                      switchValue ? WeatherConstants.imperial : WeatherConstants.metric));
                                  focusNode.unfocus();
                                },
                          child: state is WeatherLoadingState
                              ? const CircularProgressIndicator()
                              : const Text(
                                  WeatherConstants.search,
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                                )),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CupertinoSwitch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = !switchValue;
                                  });
                                },
                              ),
                              Text(
                                switchValue ? WeatherConstants.farenhiteCaps : WeatherConstants.centiGrateCaps,
                                style: WeatherConstants.appBarTitle,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),

                  ///According to the state we will change UI
                  ///Error State Handling
                  if (state is WeatherLoadingFaliureState)
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        state.error,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.redAccent),
                      ),
                    ),
                  if (state is WeatherLoadedState)
                    ShowWeatherData(
                      state: state,
                      centigrateOrFarenhite: switchValue,
                    ),
                ],
              ),
            );
          }),
      persistentFooterButtons: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('@SagnikC', style: WeatherConstants.titleName),
            Text('@OpenWeatherMap', style: WeatherConstants.titleName),
          ],
        ),
      ],
    ));
  }
}
