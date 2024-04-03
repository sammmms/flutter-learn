import 'package:flutter/material.dart';

class Profile{
  String username;
  String nama;
  String pictureLink;
  int post;
  int following;
  int follower;
  String description;
  String password;
  List postList;

  Profile({required this.pictureLink, required this.username, required this.nama, required this.post, required this.following, required this.follower, required this.description, required this.postList, required this.password});
}

class Post{
  String title;
  String description;
  String link;

  Post({required this.title, required this.description, required this.link});
}

var p1 = Post(
    title: "Pemandangan",
    description: "Gambar pemandangan anak SD",
    link: "pemandangan.jpg");

var p2 =
    Post(title: "Gunung", description: "Gambar gunung es", link: "gunung.jpg");

var p3 = Post(
    title: "Restoran",
    description: "Gambar restoran basamo di jalan thamrin",
    link: "restoran.jpg");

var p4 = Post(
    title: "Sungai",
    description: "Gambar sungai dengan arus yang deras",
    link: "sungai.jpg");

var p5 = Post(
    title: "Hutan",
    description: "Gambar hutan dengan pohon yang lebat",
    link: "hutan.jpeg");

var p6 = Post(
    title: "Danau",
    description: "Gambar danau dengan arus yang tenang",
    link: "danau.jpg");

var p7 = Post(
    title: "Harimau",
    description: "Harimau ganas",
    link: "harimau.jpeg");

var p8 = Post(
    title: "Laba Laba",
    description: "Laba laba lucu",
    link: "labalaba.jpeg");

var p9 = Post(
    title: "Pohon Akasia",
    description: "Pohon akasia yang cantik",
    link: "akasia.jpeg");


var listPost = [p1,p2,p3,p4,p5,p6,p7,p8,p9];
var profile = Profile(pictureLink: "Profile.jpeg", nama: "Samuel Onasis", username: "namesam_", password: "123", post: listPost.length, following: 32, follower: 50, description: "Just a humble dog", postList: listPost);

class UserProvider extends ChangeNotifier{
  List<Profile> listProfile;

  UserProvider({required this.listProfile});

  void addUser(Profile profile){
    listProfile.add(profile);
    notifyListeners();
  }

  void addPost(Post post, Profile profile){
    var indexProfile = listProfile.indexOf(profile);
    if(indexProfile != -1){
      listProfile[indexProfile].postList.add(post);
      listProfile[indexProfile].post += 1;
    }
    notifyListeners();
  }
}

class CurrentUser extends ChangeNotifier{
  var profile;

  CurrentUser({this.profile});

  void changeUser(String newProfile){
    profile = newProfile;
    notifyListeners();
  }
}