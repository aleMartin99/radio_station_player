import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_station_player/presentation/player_screen/components/player/player_exports.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// RadioStationCircle container class
class RadioStationCircleContainer extends StatelessWidget {
  ///
  const RadioStationCircleContainer({
    required this.image,
    super.key,
  });

  /// Image property
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 270,
            width: 270,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  offset: const Offset(8, 6),
                  blurRadius: 12,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-8, -6),
                  blurRadius: 12,
                ),
              ],
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 20,
            child: CircularSoftButton(
              padding: 0,
              radius: 120,
              icon: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: image,
                    fit: BoxFit.cover,
                    width: 40.sp,
                    height: 40.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
