import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final List<BottomNavigatorComponentItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorComponent(
      {Key key,
      @required this.items,
      this.currentIndex = 0,
      @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items
                  .map((e) => e.copyWith(
                        isActive: items.indexOf(e) == currentIndex,
                        onTap: () => onTap(items.indexOf(e)),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigatorComponentItem extends StatelessWidget {
  final String label;
  final String activeIcon;
  final String icon;
  final bool isActive;
  final Function onTap;

  BottomNavigatorComponentItem copyWith(
      {String label,
      String activeIcon,
      String icon,
      bool isActive,
      Function onTap}) {
    return BottomNavigatorComponentItem(
      label: label ?? this.label,
      activeIcon: activeIcon ?? this.activeIcon,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
      onTap: onTap ?? this.onTap,
    );
  }

  const BottomNavigatorComponentItem(
      {Key key,
      @required this.label,
      @required this.activeIcon,
      @required this.icon,
      this.isActive = false,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            AppIcon(isActive ? activeIcon : icon),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
