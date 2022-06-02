import 'package:flutter/material.dart';

import '../../Data/Models/cat_model.dart';
import 'custom_text..dart';
import 'titel_widget.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    required this.catDisplay,
    required this.index,
  }) : super(key: key);

  final List<Cat> catDisplay;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Column(children: [
                CustomText(textTxt: catDisplay[index].description),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'CatBreed: '),
                    CustomText(textTxt: catDisplay[index].name),
                  ],
                ),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'Country: '),
                    CustomText(textTxt: catDisplay[index].origin),
                  ],
                ),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'LifeSpan: '),
                    CustomText(textTxt: catDisplay[index].lifeSpan),
                  ],
                ),
                const CustomTitle(titleTxt: 'Description: '),
                CustomText(textTxt: catDisplay[index].description),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'CatBreed: '),
                    CustomText(textTxt: catDisplay[index].name),
                  ],
                ),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'LifeSpan: '),
                    CustomText(textTxt: catDisplay[index].lifeSpan),
                  ],
                ),
                const CustomTitle(titleTxt: 'Description: '),
                CustomText(textTxt: catDisplay[index].description),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'CatBreed: '),
                    CustomText(textTxt: catDisplay[index].name),
                  ],
                ),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'LifeSpan: '),
                    CustomText(textTxt: catDisplay[index].lifeSpan),
                  ],
                ),
                const CustomTitle(titleTxt: 'Description: '),
                CustomText(textTxt: catDisplay[index].description),
                Row(
                  children: [
                    const CustomTitle(titleTxt: 'CatBreed: '),
                    CustomText(textTxt: catDisplay[index].name),
                  ],
                ),
              ])),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}
