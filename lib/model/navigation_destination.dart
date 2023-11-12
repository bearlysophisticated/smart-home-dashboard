class NavigationDestination {
  NavigationDestination(
      {required this.tooltip, required this.icon, this.isActive = false});

  final String tooltip;
  final String icon;
  bool isActive;
}
