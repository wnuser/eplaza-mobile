import 'package:e_plaza/widgets/rating_reviews/star_display.dart';
import 'package:flutter/material.dart';
import '../../utils/helper.dart';

class PercentRatingReviews extends StatelessWidget {
  final List<String> stars;
  final List<double> values;
  final double rating;

  final int totalRating;

  final double average;
  final double starSize;

  final int starCount;
  final MyTextStyle ratingAverageTextStyle;
  final MyTextStyle progressTitleTextStyle;
  final MyTextStyle totalRatingsTextStyle;
  final MyTextStyle percentTextStyle;

  PercentRatingReviews({
    this.stars = const [],
    this.values = const [],
    this.rating = 0,
    this.totalRating = 0,
    this.average = 0,
    this.starSize = 14,
    this.starCount = 5,
    this.ratingAverageTextStyle = const MyTextStyle(
        color: ThemeColors.colorPrimary, fontSize: 25, fontWeight: FontWeight.bold),
    this.progressTitleTextStyle = const MyTextStyle(color: Colors.black, fontSize: fontSizeMedium),
    this.totalRatingsTextStyle = const MyTextStyle(fontSize: fontSizeSmall),
    this.percentTextStyle = const MyTextStyle(
        color: Colors.black, fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
  }) : assert(stars.length == values.length);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Helper.spaceHorizontal(10),
        Column(
          children: <Widget>[
            Text(
              this.average.toString(),
              style: ratingAverageTextStyle,
            ),
            StarDisplay(
              rating: this.average,
              size: starSize,
              color: ThemeColors.colorPrimary,
              starCount: starCount,
            ),
            Helper.spaceVertical(10),
            Text(
              '${this.totalRating} ratings',
              style: totalRatingsTextStyle,
            )
          ],
        ),
        Helper.spaceHorizontal(10),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                itemCount: values.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: _progressBar))
      ],
    );
  }

  Widget _progressBar(BuildContext context, int index) {
    String _prefix =
        List.generate(5 - (values[index] * 100).toString().length, (index) => '  ').join();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(stars[index], style: progressTitleTextStyle),
          Helper.spaceHorizontal(10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                minHeight: 8,
                valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.colorPrimary),
                value: values[index],
              ),
            ),
          ),
          Helper.spaceHorizontal(10),
          Text((values[index] * 100).toStringAsFixed(0) + '%' + _prefix, style: percentTextStyle),
        ],
      ),
    );
  }
}
