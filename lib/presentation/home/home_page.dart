import 'package:flutter/material.dart';
import 'package:praylist_joy/blocs/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praylist_joy/presentation/catalog/catalog_page.dart';
import 'package:praylist_joy/presentation/main/main_page.dart';
import 'package:praylist_joy/presentation/more/more_page.dart';
import 'package:praylist_joy/presentation/notification/notification.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (_, state){
        return WillPopScope(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                _chageBottomNav(_, index);
              },
              currentIndex: state,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Main",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: "Catalog",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notification",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: "More",
                )
              ],
            ),
            body: _buildBody(state),
          ),
        );
      },
    );
  }

  void _chageBottomNav(BuildContext context, int index){
    switch(index){
      case 0:
        context.bloc<HomeCubit>().getMain();
        break;
      case 1:
        context.bloc<HomeCubit>().getCatalog();
        break;
      case 2:
        context.bloc<HomeCubit>().getNotification();
        break;
      case 3:
        context.bloc<HomeCubit>().getMore();
        break;
    }
  }

  Widget _buildBody(index){
    switch(index){
      case 0:
        return MainPage();
      case 1:
        return CatalogPage();
      case 2:
        return NotificationPage();
      case 3:
        return MorePage();
    }
  }
}