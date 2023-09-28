// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:galaxia/commons/colors.dart';
import 'package:galaxia/commons/text_styles.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildSearchResultCard(context, responseData, bool favorite) {
  return SizedBox(
    child: Card(
      color: favorite ? kGrey : kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set the border radius here
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                const Positioned(
                  right: 15,
                  top: 10,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Container(
                        height: 130,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/banner1.png',
                          image: responseData.imageUrl ?? '',
                          fit: BoxFit.cover,
                          height: 130,
                          width: 80,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/banner1.png',
                              fit: BoxFit.cover,
                              height: 130,
                              width: 80,
                            );
                          },
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Jupiter",
                            style: TextStyle(
                                color: favorite ? kWhiteColor : kBlackColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            responseData.title.toString(),
                            style: favorite ? kText124white : kText124,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag_circle_rounded,
                                      color:
                                          favorite ? kWhiteColor : kGreyLight,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "139,820 KM",
                                      style:
                                          favorite ? kText124white : kText124,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                // width: 140,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.monitor_weight_rounded,
                                      color:
                                          favorite ? kWhiteColor : kGreyLight,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "1.898*10^27 KG",
                                      style:
                                          favorite ? kText124white : kText124,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.trolley,
                                      color:
                                          favorite ? kWhiteColor : kGreyLight,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "1 Large",
                                      style:
                                          favorite ? kText124white : kText124,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                // width: 140,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.people_rounded,
                                      color:
                                          favorite ? kWhiteColor : kGreyLight,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "8 Passengers",
                                      style:
                                          favorite ? kText124white : kText124,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Text(
                  responseData.description.toString(),
                  style: TextStyle(
                    color: favorite ? kWhiteColor : kBlackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "\$ 7000/day",
                      style: kText20head,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$ 140 (from 3 sites,)",
                      style: favorite ? kText124white : kText124,
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 130,
                  decoration: BoxDecoration(
                    color: HexColor("#2E3399"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "BOOK ",
                      style: kText165,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
