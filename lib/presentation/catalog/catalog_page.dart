import 'package:flutter/material.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_account_card.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_ad_card.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_alliance_card.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_app_bar.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_loan_card.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_service_card.dart';
import 'package:praylist_joy/presentation/catalog/components/catalog_tab_bar.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> with TickerProviderStateMixin{
  TabController _tabController;
  ScrollController _scrollController;

  final adKey = new GlobalKey();
  final accountKey = new GlobalKey();
  final loanKey = new GlobalKey();
  final serviceKey = new GlobalKey();
  final allianceKey = new GlobalKey();

  double adHeight = 0;
  double accountHeight = 0;
  double loanHeight = 0;
  double serviceHeight = 0;
  double allianceHeight = 0;
  bool isTapToScroll = false;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          constraints: BoxConstraints(
            maxWidth: 632,
          ),
          child: CustomScrollView(
            key: PageStorageKey<String>('catalog'),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                titleSpacing: 10,
                elevation: 0,
                title: CatalogAppBar(),
                backgroundColor: Colors.white,
                // pinned: true,
              ),
              SliverAppBar(
                titleSpacing: 0,
                elevation: 0,
                title: CatalogTabBar(
                  tabController: _tabController,
                  onTap: _onTapToScroll,
                ),
                backgroundColor: Colors.white,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    CatalogAdCard(
                      key: adKey,
                    ),
                    CatalogAccountCard(
                      key: accountKey,
                    ),
                    CatalogLoanCard(
                      key: loanKey,

                    ),
                    CatalogServiceCard(
                      key: serviceKey,

                    ),
                    CatalogAllianceCard(
                      key: allianceKey,

                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll(){
    if(isTapToScroll) return;

    if(adKey.currentContext != null){
      adHeight = adKey.currentContext.size.height;
    }
    if(accountKey.currentContext != null){
      accountHeight = accountKey.currentContext.size.height;
    }
    if(loanKey.currentContext != null){
      loanHeight = loanKey.currentContext.size.height;
    }
    if(serviceKey.currentContext != null){
      serviceHeight = serviceKey.currentContext.size.height;
    }
    if(allianceKey.currentContext != null){
      allianceHeight = allianceKey.currentContext.size.height;
    }

    if(_scrollController.offset<=adHeight){
      _tabController.animateTo(0, duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
    else if(_scrollController.offset> adHeight &&
        _scrollController.offset<= adHeight + accountHeight){
      _tabController.animateTo(1, duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
    else if(_scrollController.offset> adHeight + accountHeight &&
        _scrollController.offset<= adHeight + accountHeight + loanHeight){
      _tabController.animateTo(2, duration: const Duration(milliseconds: 0), curve: Curves.linear);
    }
    else if(_scrollController.offset> adHeight + accountHeight  + loanHeight  &&
        _scrollController.offset<= adHeight + accountHeight  + loanHeight + serviceHeight){
      if(_scrollController.offset>=_scrollController.position.maxScrollExtent){
        _tabController.animateTo(4, duration: const Duration(milliseconds: 0), curve: Curves.linear);
      }else{
        _tabController.animateTo(3, duration: const Duration(milliseconds: 0), curve: Curves.linear);
      }

    }
  }

  void _onTapToScroll(int index) async {
    var keys = [adKey, accountKey, loanKey, serviceKey, allianceKey];
    var previousIndex = _tabController.previousIndex;

    isTapToScroll = true;
    if(index ==0){
      await _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }else{
      if(previousIndex < index){
        for(var i = previousIndex;i<=index;i++){
          await _scrollController.position.ensureVisible(
            keys[i].currentContext.findRenderObject(),
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      } else{
        for(var i = previousIndex;i>=index;i--){
          await _scrollController.position.ensureVisible(
            keys[i].currentContext.findRenderObject(),
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );
        }
      }
    }
    isTapToScroll = false;
  }
}
