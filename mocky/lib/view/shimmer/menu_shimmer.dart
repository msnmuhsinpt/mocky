import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

bool _enabled = true;

Widget menuShimmer(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.6),
    highlightColor: Colors.grey,
    enabled: _enabled,
    child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext ctx, index) {
          return SizedBox(
            height: 80,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
  );
}
