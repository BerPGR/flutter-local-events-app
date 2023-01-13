// ignore_for_file: public_member_api_docs, sort_constructors_first
class Guest {
  final String? imagePath;

  Guest({
    this.imagePath,
  });
}

final guests = [
  Guest(imagePath: "assets/guest_images/guest1.jpg"),
  Guest(imagePath: "assets/guest_images/guest2.jpg"),
  Guest(imagePath: "assets/guest_images/guest3.jpg"),
  Guest(imagePath: "assets/guest_images/guest4.jpeg"),
  Guest(imagePath: "assets/guest_images/guest5.jpg"),
  Guest(imagePath: "assets/guest_images/guest6.jpg"),
];
