import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Models/cat_model.dart';
import '../../Provider/cat_service.dart';
import '../widgets/custom_text..dart';
import '../widgets/titel_widget.dart';
import 'detail_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Cat> cat = <Cat>[];
  List<Cat> catDisplay = <Cat>[];
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final catService = Provider.of<CatService>(context);
    cat = ModalRoute.of(context)!.settings.arguments as dynamic;
    if (isEmpty) {
      catService.setCat(cat);
      catDisplay = cat;
      isEmpty = false;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Catbreeds',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return index == 0
                    ? _searchBar()
                    : GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DitailPage()));
                          catService.setIndex(index - 1);
                          catService.setCatDisplay(catDisplay);
                        },
                        child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTitle(
                                        titleTxt: catDisplay[index - 1].name,
                                      ),
                                      const CustomText(textTxt: 'Mas...'),
                                    ],
                                  ),
                                ),
                                catDisplay[index - 1].image?.url == null
                                    ? Container()
                                    : Image.network(
                                        ('${catDisplay[index - 1].image?.url}')),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        textTxt: catDisplay[index - 1].origin,
                                      ),
                                      CustomText(
                                        textTxt: catDisplay[index - 1]
                                            .intelligence
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            )),
                      );
              },
              itemCount: catDisplay.length + 1),
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            catDisplay = cat.where((u) {
              var fName = u.name.toLowerCase();
              // var lName = u.lastName.toLowerCase();
              // var job = u.job.toLowerCase();

              return fName.contains(
                  searchText); /* ||
                  job.contains(searchText); */
            }).toList();
          });
        },
        // controller: _textController,

        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Cats',
        ),
      ),
    );
  }
}
