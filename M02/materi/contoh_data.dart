class Pic{
  String judul;
  String desc;
  String fileName;

  Pic({required this.judul, required this.desc, required this.fileName});
}

var p1 = Pic(
    judul: "Pemandangan",
    desc: "Gambar pemandangan anak SD",
    fileName: "pemandangan.png"
);

var p2 = Pic(
    judul: "Gunung",
    desc: "Gambar gunung es",
    fileName: "gunung.jpg"
);

var p3 = Pic(
    judul: "Restoran",
    desc: "Gambar restoran basamo di jalan thamrin",
    fileName: "restoran.jpg"
);

var p4 = Pic(
    judul: "Sungai",
    desc: "Gambar sungai dengan arus yang deras",
    fileName: "sungai.jpeg"
);