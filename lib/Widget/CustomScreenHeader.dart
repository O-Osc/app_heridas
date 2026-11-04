import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class CustomScreenHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomScreenHeader({
    super.key,
    required this.title,
    this.actionText,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (actionText != null)
            ElevatedButton.icon(
              onPressed: onActionPressed,
              icon: Icon(actionIcon ?? Icons.add, size: 18),
              label: Text(
                actionText!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.verdeOscuro,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}