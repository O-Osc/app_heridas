import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  final bool compact;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const CustomFilterChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.compact = false,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg =
        backgroundColor ?? (selected ? AppColors.verdeOscuro : Colors.white);
    final Color border = borderColor ??
        (selected ? AppColors.verdeOscuro : AppColors.greyTextBox);
    final Color fg =
        textColor ?? (selected ? Colors.white : AppColors.negroOscuro);

    return Material(
      color: bg,
      shape: StadiumBorder(side: BorderSide(color: border)),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 14 : 18,
            vertical: compact ? 8 : 11,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                Icon(leadingIcon, size: 16, color: fg),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: TextStyle(
                  color: fg,
                  fontSize: compact ? 13 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 4),
                Icon(trailingIcon, size: 18, color: fg),
              ],
            ],
          ),
        ),
      ),
    );
  }
}