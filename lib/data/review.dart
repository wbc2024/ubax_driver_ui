
class Review {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String time;
  final String rating;

  const Review({required this.image, required this.id, required this.title, required this.subtitle, required this.time, required this.rating});

}

class ReviewList {
  static List<Review> list() {
    const list = <Review> [
      Review(
        id: 1,
        image: 'assets/user.png',
        title: 'Jonson Robert',
          subtitle: 'Contrary to pop psunosimplyrandom It has roots in a piece of classical ',
        time: '1 day ago',
        rating: '5'
      ),
      Review(
        id: 2,
          image: 'assets/driver.png',
        title: 'Robinson Cruise',
          subtitle: 'Contrary to pop psunosimplyrandom It has roots in a piece of classical ',
          time: '7 day ago',
          rating: '4'
      ),
      Review(
        id: 3,
          image: 'assets/user.png',
        title: 'Henry Nickel',
          subtitle: 'Contrary to pop psunosimplyrandom It has roots in a piece of classical ',
          time: '1 month ago',
          rating: '5'
      ),
      Review(
        id: 4,
          image: 'assets/driver.png',
        title: 'Usain Bolt',
          subtitle: 'Contrary to pop psunosimplyrandom It has roots in a piece of classical ',
          time: '2 month ago',
          rating: '4'
      ),
    ];
    return list;
  }
}