import 'package:flutter/material.dart';
import '../../utils/helper.dart';

class StarDisplay extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final int starCount;

  const StarDisplay({
    this.starCount = 5,
    this.rating = 0,
    this.size = 16,
    this.color = ThemeColors.colorPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        starCount,
        (index) => Icon(
          (rating - index >= 0.8)
              ? Icons.star
              : (rating - index >= 0.3)
                  ? Icons.star_half
                  : Icons.star_border,
          color: this.color,
          size: this.size,
        ),
      ),
    );
  }
}
