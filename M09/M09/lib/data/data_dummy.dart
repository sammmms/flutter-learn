import 'package:m02_praktek/models/comment_model.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';

var p1 = Post(
    title: "Pemandangan",
    description: "Gambar pemandangan anak SD",
    link: "pemandangan.jpg",
    currentLike: "1.9k",
    currentComment: "521");

var p2 = Post(
    title: "Gunung",
    description: "Gambar gunung es",
    link: "gunung.jpg",
    currentLike: "2k",
    currentComment: "1.2k");

var p3 = Post(
    title: "Restoran",
    description: "Gambar restoran basamo di jalan thamrin",
    link: "restoran.jpg",
    currentLike: "5k",
    currentComment: "3k");

var p4 = Post(
    title: "Sungai",
    description: "Gambar sungai dengan arus yang deras",
    link: "sungai.jpg",
    currentLike: "6k",
    currentComment: "5k");

var p5 = Post(
    title: "Hutan",
    description: "Gambar hutan dengan pohon yang lebat",
    link: "hutan.jpeg",
    currentLike: "3.3k",
    currentComment: "1.5k");

var p6 = Post(
    title: "Danau",
    description: "Gambar danau dengan arus yang tenang",
    link: "danau.jpg",
    currentLike: "1.9k",
    currentComment: "1.2k");

var p7 = Post(
    title: "Harimau",
    description: "Harimau ganas",
    link: "harimau.jpeg",
    currentLike: "211",
    currentComment: "20");

var p8 = Post(
    title: "Laba Laba",
    description: "Laba laba lucu",
    link: "labalaba.jpeg",
    currentLike: "899",
    currentComment: "502");

var p9 = Post(
    title: "Pohon Akasia",
    description: "Pohon akasia yang cantik",
    link: "akasia.jpeg",
    currentLike: "100k",
    currentComment: "99.9k");

var listPost = [p1, p2, p3, p4, p5, p6, p7, p8, p9];

var profile2 = User(
    pictureLink: "Profile.jpeg",
    nama: "Bukan Samuel",
    username: "notnamesam_",
    password: "123",
    post: listPost.length - 4,
    following: 10,
    follower: 20,
    description: "Just a humble cat",
    postList: listPost.sublist(0, 5),
    userSetting: {"privacy": "public", "notifications": "important"});

var c1 = Comments(
    user: profile2, content: "Dih keren", like: 14, time: DateTime.now());

var p10 = Post(
    title: "Pohon Akasia",
    description: "Pohon akasia yang cantik",
    link: "akasia.jpeg",
    currentLike: "100k",
    currentComment: "99.9k",
    commentList: [c1]);

var listPost2 = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10];

var profile = User(
    pictureLink: "Profile.jpeg",
    nama: "Samuel Onasis",
    username: "namesam_",
    password: "123",
    post: listPost2.length,
    following: 32,
    follower: 50,
    description: "Just a humble dog",
    postList: listPost2,
    userSetting: {"privacy": "public", "notifications": "important"});
