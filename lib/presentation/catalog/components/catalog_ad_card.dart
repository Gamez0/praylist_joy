import 'package:flutter/material.dart';
import 'package:praylist_joy/presentation/catalog/components/circle_indicator.dart';

class CatalogAdCard extends StatefulWidget {
  @override
  _CatalogAdCardState createState() => _CatalogAdCardState();
}

class _CatalogAdCardState extends State<CatalogAdCard> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children:[
          ClipRRect(
            key: PageStorageKey<String>("catalog_ad_card"),
            borderRadius: BorderRadius.circular(10),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page){
                setState(() {
                  currentPage = page;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Image.asset(
                  'assets/images/ad${index + 1}.png',
                  fit: BoxFit.cover,
                );
              },
              itemCount: 4,
            ),
          ),

          Positioned(
            top: 20,
            right: 20,
            child: CircleIndicator(
              count: 4,
              current: currentPage,
            ),
          )
        ]
      ),
    );
  }
}
