// Core/widgets/main_botton.dart
import 'package:flutter/material.dart';

class MainBotton extends StatelessWidget {
  final String Titel;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final double width;
  final String? image;

  const MainBotton({
    super.key,
    required this.Titel,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.height = 56,
    this.borderRadius = 15,
    this.width = 360,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: image != null
                  ? const Color(0xFFE2E8F0)
                  : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[
              Image.network(
                image!,
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported);
                },
              ),
              const SizedBox(width: 15),
            ],
            Text(
              Titel,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
