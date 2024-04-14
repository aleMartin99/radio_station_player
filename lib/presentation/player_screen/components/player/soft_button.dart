// ignore_for_file: public_member_api_docs, must_be_immutable

import 'package:flutter/material.dart';

/// CircularSoftButton class
class CircularSoftButton extends StatelessWidget {
  ///
  CircularSoftButton({
    super.key,
    this.radius,
    this.icon,
    this.lightColor = Colors.white,
    this.padding,
    this.circularRadius,
  }) {
    if (radius == null || radius! <= 0) radius = 32;
  }

  double? radius;
  final Widget? icon;
  final Color lightColor;
  final double? padding;
  final double? circularRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? radius! / 2),
      child: Stack(
        children: <Widget>[
          Container(
            width: radius! * 2,
            height: radius! * 2,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(circularRadius ?? radius!),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  offset: const Offset(8, 6),
                  blurRadius: 12,
                ),
                BoxShadow(
                  color: lightColor,
                  offset: const Offset(-8, -6),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
          Positioned.fill(child: icon ?? Container()),
        ],
      ),
    );
  }
}
