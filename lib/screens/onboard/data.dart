
import 'package:udex_driver/utils/strings.dart';

class OnBoardingItem {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingItem({required  this.title,  required this.subTitle, required  this.image});
}

class OnBoardingItems {
  static List<OnBoardingItem> loadOnboardItem () {
    const fi = <OnBoardingItem> [
      OnBoardingItem(
        title: Strings.title1,
        subTitle: Strings.subTitle1,
        image: 'assets/onboard/1.png',
      ),
      OnBoardingItem(
          title: Strings.title2,
          subTitle: Strings.subTitle2,
        image: 'assets/onboard/2.png',
      ),
      OnBoardingItem(
          title: Strings.title3,
          subTitle: Strings.subTitle3,
          image: 'assets/onboard/3.png',
      ),
    ];
    return fi;
  }
}