import 'package:flutter/material.dart';

import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/core/theme/app_typograph.dart';

class FilterComponent extends StatelessWidget {
  final String location;

  const FilterComponent({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FilterComponentDelegate(location),
    );
  }
}

class FilterComponentDelegate extends SliverPersistentHeaderDelegate {
  final String location;

  FilterComponentDelegate(
    this.location,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      height: 54,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 16,
          ),
          FilterItemComponent(label: 'Ordenar', icon: AppIcons.arrowDown),
          FilterItemComponent(
            label: 'Ordenar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Pra retirar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega Grátis',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Vale Refeição',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Distância',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega Parceira',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Filtros',
            icon: AppIcons.arrowDown,
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 54;

  @override
  // TODO: implement minExtent
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  final String label;
  final String icon;

  const FilterItemComponent({Key key, @required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            border: Border.all(color: AppColors.grey200)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text(
                label,
                style: AppTypograph.filterItemStyle(context)
                    .copyWith(color: AppColors.grey700),
              ),
              if (icon != null)
                AppIcon(
                  icon,
                  size: Size(16, 16),
                )
            ],
          ),
        ),
      ),
    );
  }
}
