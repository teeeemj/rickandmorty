import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricky/config/theme/app_colors.dart';
import 'package:ricky/config/theme/app_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bottomNavBarColor,
        items: _buildBottomNavBarItem,
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.selectedItemColor,
        unselectedItemColor: AppColors.unselectedItemColor,
        selectedLabelStyle:
            AppFonts.s12w400.copyWith(color: AppColors.selectedItemColor),
        unselectedLabelStyle: AppFonts.s12w400.copyWith(
          color: AppColors.unselectedItemColor,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItem => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Персонажи',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Локации',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.live_tv_rounded),
          label: 'Эпизоды',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Настройки',
        )
      ];
}
