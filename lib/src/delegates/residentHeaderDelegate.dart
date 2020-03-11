import 'dart:math';

import 'package:andersgym/src/pages/home/widgets/resident_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResidentHeaderDelegate implements SliverPersistentHeaderDelegate {
  ResidentHeaderDelegate({
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
      // print (shrinkOffset);
      return ResidentHeader(minExtent: minExtent, maxExtent: maxExtent, offset: shrinkOffset,);
    }

    

    double titleOpacity(double shrinkOffset) {
      // simple formula: fade out text as soon as shrinkOffset > 0
      return 1.0 - max(0.0, shrinkOffset) / maxExtent;
      // more complex formula: starts fading out text when shrinkOffset > minExtent
      //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
    }

    @override
    bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
      return true;
    }

    @override
    FloatingHeaderSnapConfiguration get snapConfiguration => null;

    @override
    OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

}