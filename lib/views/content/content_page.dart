import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/views/content/components/bottom_navigator_component.dart';

import 'components/content_tab_bar_component.dart';
import 'components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                HeaderLocationComponent(
                  location: "Rua jacarepaguá, n20",
                ),
                ContentTabBarComponent(
                  controller: tabController,
                  onTap: (index) {},
                ),
              ],
            ),
          ),
          BottomNavigatorComponent(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            items: [
              BottomNavigatorComponentItem(
                label: 'Início',
                activeIcon: AppIcons.homeActive,
                icon: AppIcons.home,
              ),
              BottomNavigatorComponentItem(
                  label: 'Busca',
                  activeIcon: AppIcons.searchActive,
                  icon: AppIcons.search),
              BottomNavigatorComponentItem(
                label: 'Pedidos',
                activeIcon: AppIcons.ordersActive,
                icon: AppIcons.orders,
              ),
              BottomNavigatorComponentItem(
                label: 'Perfil',
                activeIcon: AppIcons.profileActive,
                icon: AppIcons.profile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
