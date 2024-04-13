// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/presentation/home_screen/components/radio_list.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Body of home screen
class HomeBody extends StatefulWidget {
  ///
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<RadioStationBloc>().add(OnLoadRadioStationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<RadioStationBloc, RadioStationState>(
              builder: (context, radioStationState) {
                return radioStationState.status == RadioStationStatus.loading
                    ? SizedBox(
                        height: 90.h,
                        child:
                            const Center(child: CupertinoActivityIndicator()),
                      )
                    : radioStationState.status == RadioStationStatus.success
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2.5.h),
                              Text(
                                'Radio Show',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4.h),
                              ...List.generate(
                                radioStationState.radioStationsList.length,
                                (index) => RadioStationListItem(
                                  radioStation: radioStationState
                                      .radioStationsList[index],
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 90.h,
                            child: Center(
                              child: Text(
                                radioStationState.failure.toString(),
                              ),
                            ),
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}
