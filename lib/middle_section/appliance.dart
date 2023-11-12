class Appliance {
  Appliance(this.id,
      {required this.name,
      required this.isActive,
      required this.selected,
      required this.activeIcon,
      required this.inActiveIcon,
      required this.selectedIcon});

  final int id;
  final String name;
  bool isActive;
  final String activeIcon;
  final String inActiveIcon;
  final String selectedIcon;
  bool selected;
}
