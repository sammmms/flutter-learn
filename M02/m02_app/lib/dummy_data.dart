class Pic {
  String title;
  String description;
  String link;

  Pic({required this.title, required this.description, required this.link});
}

var p1 = Pic(
    title: "Pemandangan",
    description: "Gambar pemandangan anak SD",
    link: "pemandangan.jpg");

var p2 =
    Pic(title: "Gunung", description: "Gambar gunung es", link: "gunung.jpg");

var p3 = Pic(
    title: "Restoran",
    description: "Gambar restoran basamo di jalan thamrin",
    link: "restoran.jpg");

var p4 = Pic(
    title: "Sungai",
    description: "Gambar sungai dengan arus yang deras",
    link: "sungai.jpg");
