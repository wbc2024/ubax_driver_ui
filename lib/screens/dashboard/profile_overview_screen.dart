import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/widgets/my_rating.dart';
import 'package:udex_driver/data/review.dart';

class ProfileOverviewScreen extends StatefulWidget {
  @override
  _ProfileOverviewScreenState createState() => _ProfileOverviewScreenState();
}

class _ProfileOverviewScreenState extends State<ProfileOverviewScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              DraggableScrollableSheet(
                builder: (context, scrollController){
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions
                            .radius * 3),
                            topRight: Radius.circular(Dimensions.radius * 3))
                    ),
                    child: SingleChildScrollView(
                      child: bodyWidget(context),
                      controller: scrollController,
                    ),
                  );
                },
                initialChildSize: 0.77,
                minChildSize: 0.77,
                maxChildSize: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5.0',
                    style: GoogleFonts.roboto(
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryColor
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                      ),
                      SizedBox(width: Dimensions.widthSize,),
                      Text(
                        '450 Total User',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  ),
                  // MyRating(rating: '5',)
                ],
              ),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomColor.accentColor,
                    width: 12
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60.0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '478',
                      style: GoogleFonts.roboto(
                          fontSize: Dimensions.extraLargeTextSize * 1.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.primaryColor
                      ),
                    ),
                    Text(
                      Strings.totalRide,
                      style: CustomStyle.textStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 3,),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: ReviewList.list().length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Review review = ReviewList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.heightSize),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 2))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.radius),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              review.image,
                              height: 40.0,
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            review.title,
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: Dimensions.defaultTextSize,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(height: Dimensions.heightSize * 0.5,),
                                          Text(
                                            '${review.time}',
                                            style: CustomStyle.textStyle,
                                          ),
                                        ],
                                      ),
                                      // MyRating(rating: review.rating,)
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.heightSize,),
                                  Text(
                                    review.subtitle,
                                    style: CustomStyle.textStyle,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
