// // ignore_for_file: import_of_legacy_library_into_null_safe

// import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

// import 'package:udex_driver/utils/colors.dart';

// class MyRating extends StatefulWidget {
//   final String rating;

//   const MyRating({Key? key, required this.rating}) : super(key: key);

//   @override
//   _MyRatingState createState() => _MyRatingState();
// }

// class _MyRatingState extends State<MyRating> {
//   @override
//   Widget build(BuildContext context) {
//     return SmoothStarRating(
//         allowHalfRating: true,
//         onRated: (v) {},
//         starCount: 5,
//         rating: double.parse(widget.rating),
//         size: 20.0,
//         isReadOnly: true,
//         filledIconData: Icons.star,
//         halfFilledIconData: Icons.star,
//         color: CustomColor.accentColor,
//         borderColor: CustomColor.secondaryColor,
//         spacing: 0.0);
//   }
// }
