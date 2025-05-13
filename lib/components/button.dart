import 'package:curry_leaf/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

enum ButtonVariant { primary, outlined, text }

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  final ButtonSize size;
  final ButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.size = ButtonSize.medium,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets getPadding() {
      switch (size) {
        case ButtonSize.small:
          return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
        case ButtonSize.medium:
          return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
        case ButtonSize.large:
          return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
      }
    }

    double getTextSize() {
      switch (size) {
        case ButtonSize.small:
          return 14;
        case ButtonSize.medium:
          return 16;
        case ButtonSize.large:
          return 18;
      }
    }

    Color getBackgroundColor() {
      switch (variant) {
        case ButtonVariant.primary:
          return AppTheme.primaryColor;
        case ButtonVariant.outlined:
        case ButtonVariant.text:
          return Colors.transparent;
      }
    }

    Color getTextColor() {
      switch (variant) {
        case ButtonVariant.primary:
          return Colors.white;
        case ButtonVariant.outlined:
        case ButtonVariant.text:
          return AppTheme.primaryColor;
      }
    }

    Border? getBorder() {
      switch (variant) {
        case ButtonVariant.outlined:
          return Border.all(color: AppTheme.primaryColor, width: 2);
        case ButtonVariant.primary:
        case ButtonVariant.text:
          return null;
      }
    }

    List<BoxShadow>? getShadow() {
      switch (variant) {
        case ButtonVariant.primary:
          return [
            BoxShadow(
              color: AppTheme.primaryColor.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ];
        case ButtonVariant.outlined:
        case ButtonVariant.text:
          return null;
      }
    }

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: fullWidth ? double.infinity : null,
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          borderRadius: BorderRadius.circular(40),
          boxShadow: getShadow(),
          border: getBorder(),
        ),
        padding: getPadding(),
        child: Row(
          mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: getTextColor(),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: TextStyle(
                color: getTextColor(),
                fontSize: getTextSize(),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            if (icon != null && !isLoading) ...[
              const SizedBox(width: 10),
              Icon(
                icon,
                color: getTextColor(),
                size: getTextSize() + 4,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
