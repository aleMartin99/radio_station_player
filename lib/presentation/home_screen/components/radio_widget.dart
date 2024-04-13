import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// RadioStationWidget class
class RadioStationWidget extends StatelessWidget {
  ///
  const RadioStationWidget({
    required this.radioStation,
    super.key,
  });

  ///
  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.shadow,
          ),
          child:

              ///Used to create the trasition
              Hero(
            tag: radioStation.id!,
            child: CachedNetworkImage(
              filterQuality: FilterQuality.none,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: radioStation.image ?? '',
              fit: BoxFit.cover,
              width: 30.sp,
              height: 30.sp,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                radioStation.name ?? 'Radio station name',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                radioStation.country ?? 'Radio station country',
                maxLines: 1,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium!.color,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
