import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';
import '../common/custom_switch.dart' as cs;
import '../constants/constant.dart';

class AppliancesListItem extends StatelessWidget {
  const AppliancesListItem({
    required this.name,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.selectedIcon,
    this.value = true,
    this.selected = false,
    required this.onStateChange,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final String name;
  final String activeIcon;
  final String inActiveIcon;
  final String selectedIcon;
  final bool selected;
  final bool value;
  final Function(bool) onStateChange;
  final Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return _build;
  }

  Widget get _build {
    return ContentContainer(
      borderRadius: 20,
      child: Container(
        width: 140,
        height: 56,
        child: HandCursor(
          child: Material(
            color:
                selected ? AppColors.switchContainer : AppColors.containerFill,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: InkWell(
              onTap: onSelected,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        child: Text(
                          value ? 'ON' : 'OFF',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 16, bottom: 8),
                        child: cs.Switch(
                          value: value,
                          activeTrackColor: selected
                              ? AppColors.white
                              : AppColors.switchActive,
                          inActiveTrackColor: selected
                              ? AppColors.white
                              : AppColors.switchTrack,
                          indicatorActiveColor: selected
                              ? AppColors.selectedSwitchIndicatorActive
                              : AppColors.white,
                          indicatorInActiveColor:
                              selected ? AppColors.grey : AppColors.white,
                          onChanged: onStateChange,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Image.asset(
                      selected
                          ? selectedIcon
                          : (value ? activeIcon : inActiveIcon),
                      height: 30,
                      width: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.54,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
