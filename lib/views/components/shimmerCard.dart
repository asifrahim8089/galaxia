// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxia/commons/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSearchResultCardShimmer(bool favourite) {
  return ListView.builder(
    shrinkWrap: true,
    // physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(0),
    itemCount: 3,
    itemBuilder: (context, index) {
      return Card(
        color: favourite ? kBlackLight : kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Shimmer.fromColors(
            baseColor: favourite ? kGreyLight : Colors.grey[300]!,
            highlightColor: favourite ? kBlackLight : Colors.grey[100]!,
            child: Container(
              height: 80,
              width: 200,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey
                  // Add a color for the skeleton
                  ),
            ),
          ),
        ),
      );
    },
  );
}
