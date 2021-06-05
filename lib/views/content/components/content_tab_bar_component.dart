import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typograph.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController controller;
  final Function(int) onTap;

  const ContentTabBarComponent(
      {Key key, @required this.controller, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponentDelegate(controller, onTap),
    );
  }
}

class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final Function(int) onTap;

  _ContentTabBarComponentDelegate(
    this.controller,
    this.onTap,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 16, right: (width / 2) - 16),
      child: TabBar(
          labelPadding: EdgeInsets.zero,
          onTap: onTap,
          indicatorPadding: EdgeInsets.zero,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.black54,
          labelStyle: AppTypograph.tabBarStyle(context),
          indicator: MaterialIndicator(
            color: AppColors.primaryColor,
            height: 2,
            bottomLeftRadius: 5,
            bottomRightRadius: 5,
          ),
          controller: controller,
          tabs: [
            Tab(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Restaurantes'))),
            Tab(child: Text('Mercados')),
          ]),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
