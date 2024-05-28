import 'package:m02_praktek/models/comment_model.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';

var p1 = Post(
    title: "Pemandangan",
    description: "Gambar pemandangan anak SD",
    link: "pemandangan.jpg",
    currentLike: "1.9k",
    currentComment: 0);

var p2 = Post(
    title: "Gunung",
    description: "Gambar gunung es",
    link: "gunung.jpg",
    currentLike: "2k",
    currentComment: 0);

var p3 = Post(
    title: "Restoran",
    description: "Gambar restoran basamo di jalan thamrin",
    link: "restoran.jpg",
    currentLike: "5k",
    currentComment: 0);

var p4 = Post(
    title: "Sungai",
    description: "Gambar sungai dengan arus yang deras",
    link: "sungai.jpg",
    currentLike: "6k",
    currentComment: 0);

var p5 = Post(
    title: "Hutan",
    description: "Gambar hutan dengan pohon yang lebat",
    link: "hutan.jpeg",
    currentLike: "3.3k",
    currentComment: 0);

var p6 = Post(
    title: "Danau",
    description: "Gambar danau dengan arus yang tenang",
    link: "danau.jpg",
    currentLike: "1.9k",
    currentComment: 0);

var p7 = Post(
    title: "Harimau",
    description: "Harimau ganas",
    link: "harimau.jpeg",
    currentLike: "211",
    currentComment: 0);

var p8 = Post(
    title: "Laba Laba",
    description: "Laba laba lucu",
    link: "labalaba.jpeg",
    currentLike: "899",
    currentComment: 0);

var p9 = Post(
    title: "Pohon Akasia",
    description: "Pohon akasia yang cantik",
    link: "akasia.jpeg",
    currentLike: "100k",
    currentComment: 0);

var listPost = [p1, p2, p3, p4, p5, p6, p7, p8, p9];

var c1 = Comments(
    user: profile2, content: "Dih keren", like: 14, time: DateTime.now());

var p10 = Post(
    title: "Pohon Akasia",
    description: "Pohon akasia yang cantik",
    link: "akasia.jpeg",
    currentLike: "100k",
    currentComment: 1,
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

var profile1 = User(
    pictureLink: "Profile.jpeg",
    nama: "Alex Smith",
    username: "alex_smith",
    password: "abc123",
    post: 0,
    following: 100,
    follower: 150,
    description: "Adventurer at heart",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "all"});

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

var profile3 = User(
    pictureLink: "Profile.jpeg",
    nama: "Michael Johnson",
    username: "mike_j",
    password: "secure456",
    post: 0,
    following: 250,
    follower: 200,
    description: "Tech enthusiast",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "none"});

var profile4 = User(
    pictureLink: "Profile.jpeg",
    nama: "Emily Davis",
    username: "emily_d",
    password: "password1",
    post: 0,
    following: 76,
    follower: 90,
    description: "Traveler and foodie",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "important"});

var profile5 = User(
    pictureLink: "Profile.jpeg",
    nama: "Chris Brown",
    username: "chris_b",
    password: "qwerty",
    post: 0,
    following: 123,
    follower: 130,
    description: "Music addict",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "all"});

var profile6 = User(
    pictureLink: "Profile.jpeg",
    nama: "Sarah Wilson",
    username: "sarah_wilson",
    password: "mypassword",
    post: 0,
    following: 45,
    follower: 50,
    description: "Nature lover",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "mentions"});

var profile7 = User(
    pictureLink: "Profile.jpeg",
    nama: "David Martinez",
    username: "david_m",
    password: "david123",
    post: 0,
    following: 89,
    follower: 100,
    description: "Fitness freak",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "none"});

var profile8 = User(
    pictureLink: "Profile.jpeg",
    nama: "Sophia Anderson",
    username: "sophia_a",
    password: "sophia456",
    post: 0,
    following: 34,
    follower: 60,
    description: "Bookworm",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "important"});

var profile9 = User(
    pictureLink: "Profile.jpeg",
    nama: "James Thomas",
    username: "james_t",
    password: "james789",
    post: 0,
    following: 78,
    follower: 85,
    description: "Aspiring chef",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "all"});

var profile10 = User(
    pictureLink: "Profile.jpeg",
    nama: "Olivia White",
    username: "olivia_white",
    password: "olivia123",
    post: 0,
    following: 99,
    follower: 120,
    description: "Fashionista",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "mentions"});

var profile11 = User(
    pictureLink: "Profile.jpeg",
    nama: "Jessica Lee",
    username: "jessica_lee88",
    password: "pass987",
    post: 0,
    following: 58,
    follower: 75,
    description: "Coffee lover",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "mentions"});

var profiles = [
  profile,
  profile1,
  profile2,
  profile3,
  profile4,
  profile5,
  profile6,
  profile7,
  profile8,
  profile9,
  profile10,
  profile11
];
