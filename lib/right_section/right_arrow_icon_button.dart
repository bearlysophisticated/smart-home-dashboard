import 'package:flutter/material.dart';
import '../common/common.dart';
import '../constants/constant.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onClick,
    Key? key,
  }) : super(key: key);
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ContentContainer(
        child: Material(
          color: AppColors.containerFill,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: HandCursor(
            child: IconButton(
              hoverColor: AppColors.buttonHover,
              onPressed: onClick,
              icon: const Center(
                child: Icon(
                  Icons.arrow_right,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
