import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBorderButton extends StatelessWidget {
  final String svgAsset;
  final String title;
  final VoidCallback onPressed;

  const SvgBorderButton({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
       decoration: BoxDecoration(
  color: Colors.white, 
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2), 
      blurRadius: 10, 
      spreadRadius: 2, 
      offset: const Offset(0, 0), 
    ),
  ],
),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SvgPicture.asset(
              svgAsset,
              width: 35,
              height: 35,
              placeholderBuilder: (context) => const Icon(Icons.image_not_supported, size: 24),
            ),

            const SizedBox(width: 20),

            
            Container(
              height: 30, 
              width: 2, 
              color: Colors.grey,
            ),

            const SizedBox(width: 20),

           
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
