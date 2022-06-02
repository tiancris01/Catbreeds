import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Models/cat_model.dart';
import '../../Provider/cat_service.dart';
import '../widgets/detail_card.dart';

class DitailPage extends StatelessWidget {
  DitailPage({Key? key}) : super(key: key);

  final List<Cat> catDisplay = <Cat>[];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final catDisplay = Provider.of<CatService>(context);
    index = catDisplay.getIndex;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            catDisplay.getCat[index].name,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: 400,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    ('${catDisplay.getCatDisplay[index].image?.url}'),
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true,
              ),
              DetailCard(
                catDisplay: catDisplay.getCat,
                index: index,
              ),
            ],
          ),
        ));
  }
}
