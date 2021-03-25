import 'package:flutter/material.dart';
import 'package:praylist_joy/presentation/main/components/checking_account_card.dart';
import 'package:praylist_joy/presentation/main/components/main_ad_card.dart';
import 'package:praylist_joy/presentation/main/components/main_app_bar.dart';
import 'package:praylist_joy/presentation/main/components/more_button.dart';
import 'package:praylist_joy/presentation/main/components/savings_account_card.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343b57),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          constraints: BoxConstraints(
            maxWidth: 632,
          ),
          child: CustomScrollView(
            key: PageStorageKey<String>('main'),
            slivers: [
              SliverAppBar(
                titleSpacing: 10,
                backgroundColor: Color(0xff343b57),
                title: MainAppBar(),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: 20,
                  ),
                  MainAdCard(
                    title: 'PrayList',
                    content: '기도제목을 나누는 곳',
                  ),
                  SizedBox( // card끼리 여백
                    height: 15,
                  ),
                  CheckingMaterialCard(),
                  SizedBox(height: 15,),
                  SavingsAccountCard(
                    color: Color(0xfff1a8af),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SavingsAccountCard(
                    color: Color(0xffd16562),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SavingsAccountCard(
                    color: Color(0xffdd8369),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MoreButton(),
                  SizedBox(
                    height: 50,
                  )
                ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
