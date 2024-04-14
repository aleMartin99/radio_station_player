// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/presentation/home_screen/filter_bloc/filter_bloc.dart';
import 'package:radio_station_player/presentation/home_screen/home_screen_exports.dart';
import 'package:radio_station_player/presentation/home_screen/radio_station_bloc/radio_station_bloc.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/player_exports.dart';
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

  bool isShowingOnlyFav = false;

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
                return radioStationState.status == RadioStationStatus.loading ||
                        radioStationState.status ==
                            RadioStationStatus.loadingToggleFavorite
                    ? SizedBox(
                        height: 90.h,
                        child:
                            const Center(child: CupertinoActivityIndicator()),
                      )
                    : radioStationState.status == RadioStationStatus.success ||
                            radioStationState.status ==
                                RadioStationStatus.isFavRadioStation ||
                            radioStationState.status ==
                                RadioStationStatus.isNotFavRadioStation
                        ? BlocBuilder<FilterBloc, FilterState>(
                            builder: (context, filterState) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.5.h),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Radio Show',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        CircularSoftButton(
                                          radius: 20,
                                          padding: 0,
                                          icon: GestureDetector(
                                            onTap: () {
                                              context.read<FilterBloc>().add(
                                                    OnToggleFavoriteFilterEvent(
                                                      isShowingOnlyFav:
                                                          !filterState
                                                              .isShowingOnlyFav,
                                                    ),
                                                  );
                                            },
                                            child: Icon(
                                              filterState.isShowingOnlyFav
                                                  ? Icons.filter_alt
                                                  : Icons.filter_alt_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  if (filterState.isShowingOnlyFav)
                                    ...List.generate(
                                      radioStationState.radioStationsList
                                          .where(
                                            (element) =>
                                                element.isFavorite == true,
                                          )
                                          .length,
                                      (index) => RadioStationListItem(
                                        radioStation: radioStationState
                                            .radioStationsList
                                            .where(
                                              (element) =>
                                                  element.isFavorite == true,
                                            )
                                            .toList()[index],
                                      ),
                                    )
                                  else
                                    ...List.generate(
                                      radioStationState
                                          .radioStationsList.length,
                                      (index) => RadioStationListItem(
                                        radioStation: radioStationState
                                            .radioStationsList[index],
                                      ),
                                    ),
                                ],
                              );
                            },
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
