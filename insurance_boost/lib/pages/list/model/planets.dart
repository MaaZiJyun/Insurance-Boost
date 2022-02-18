class Planet {
  final String id;
  final String package;
  final String user;
  final String style;
  final String date;
  final String description;
  final String image;

  const Planet(
      {required this.id,
      required this.package,
      required this.user,
      required this.style,
      required this.date,
      required this.description,
      required this.image});
}

List<Planet> planets = [
  const Planet(
    id: "1",
    package: "page1",
    user: "user1",
    style: "medical",
    date: "2022/2/8 ",
    description: "Lorem ipsum...",
    image: "assets/img/mars.png",
  ),
  const Planet(
    id: "2",
    package: "page1",
    user: "user1",
    style: "medical",
    date: "2022/2/8 ",
    description: "Lorem ipsum...",
    image: "assets/img/neptune.png",
  ),
  const Planet(
    id: "3",
    package: "page1",
    user: "user1",
    style: "medical",
    date: "2022/2/8 ",
    description: "Lorem ipsum...",
    image: "assets/img/moon.png",
  ),
  const Planet(
    id: "4",
    package: "page1",
    user: "user1",
    style: "medical",
    date: "2022/2/8 ",
    description: "Lorem ipsum...",
    image: "assets/img/earth.png",
  ),
  const Planet(
    id: "5",
    package: "page1",
    user: "user1",
    style: "medical",
    date: "2022/2/8 ",
    description: "Lorem ipsum...",
    // name: "page1",
    // location: "user1",
    // distance: "medical",
    // gravity: "2022/2/8 ",
    // description: "Lorem ipsum...",
    image: "assets/img/mercury.png",
  ),
];
