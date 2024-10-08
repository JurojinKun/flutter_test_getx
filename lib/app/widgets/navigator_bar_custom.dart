import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarCustom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationBarCustom(
      {super.key,
      required this.currentIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)))),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: NavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
              indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              destinations: [
                NavigationDestination(
                    label: "home.title".tr,
                    icon: Icon(CupertinoIcons.home,
                        color: Theme.of(context).indicatorColor)),
                NavigationDestination(
                    label: "searching.title".tr,
                    icon: Icon(CupertinoIcons.search,
                        color: Theme.of(context).indicatorColor)),
                NavigationDestination(
                    label: "settings.title".tr,
                    icon: Icon(CupertinoIcons.settings,
                        color: Theme.of(context).indicatorColor)),
              ],
              selectedIndex: currentIndex,
              onDestinationSelected: onDestinationSelected,
            ),
          )
        ],
      ),
    );
  }
}
