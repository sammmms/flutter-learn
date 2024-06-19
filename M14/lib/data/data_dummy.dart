import 'package:m02_praktek/models/comment_model.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';

User profile = User(
    pictureLink:
        "https://mrwallpaper.com/images/hd/cute-girl-vector-art-profile-picture-jhbu3wt713zj2bti.jpg",
    nama: "Samuel Onasis",
    username: "namesam_",
    password: "123",
    post: 4,
    following: 32,
    follower: 50,
    description: "Just a humble dog",
    postList: [
      Post(
        title: "Landscape painting",
        link:
            "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//catalog-image/89/MTA-143123318/tidak_ada_merk_lukisan_pemandangan_nuansa_tradisional_yang_asri_dan_indah_full09_ibper0i5.jpg",
      ),
      Post(
        title: "Gorgeous tree",
        link:
            "https://asset.kompas.com/crops/25hhF38dli3VSfKY5g8lIbzRDxA=/0x0:1000x667/750x500/data/photo/2022/05/01/626e236fbfeb9.png",
      ),
      Post(
        title: "Lakeside bridge",
        link:
            "https://cdns.klimg.com/merdeka.com/i/w/news/2021/10/21/1366484/540x270/10-pemandangan-keren-di-indonesia-wajib-dikunjungi-langsung.jpg",
      ),
      Post(
        title: "Mountain view",
        link:
            "https://asset.kompas.com/crops/T3BK9gGBxjdwRBJzXv9xfeERI3c=/83x0:707x416/750x500/data/photo/2020/08/30/5f4b2fa3709bc.jpg",
      ),
    ],
    userSetting: {
      "privacy": "public",
      "notifications": "important"
    });

User profile1 = User(
    pictureLink:
        "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
    nama: "Amanda Waller",
    username: "amanda.waller",
    password: "123",
    post: 3,
    following: 100,
    follower: 150,
    description: "Adventurer at heart",
    postList: [
      Post(
          title: "My new pet",
          link:
              "https://www.ruparupa.com/blog/wp-content/uploads/2020/08/pet-kingdom.jpg",
          commentList: [
            Comments(
                user: profile,
                content: "So cute!",
                like: 20,
                time: DateTime.now()),
            Comments(
                user: profile2,
                content: "I want one too!",
                like: 20,
                time: DateTime.now())
          ]),
      Post(
          title: "My new car",
          link:
              "https://cdn.motor1.com/images/mgl/MkO9NN/s1/future-supercars.webp",
          commentList: [
            Comments(
                user: profile,
                content: "Nice car!",
                like: 20,
                time: DateTime.now()),
            Comments(
                user: profile2,
                content: "I want one too!",
                like: 20,
                time: DateTime.now())
          ]),
      Post(
          title: "My new house",
          link:
              "https://www.houseplans.net/news/wp-content/uploads/2023/07/57260-768.jpeg",
          commentList: [
            Comments(
                user: profile,
                content: "Nice house!",
                like: 20,
                time: DateTime.now()),
            Comments(
                user: profile2,
                content: "I want one too!",
                like: 20,
                time: DateTime.now())
          ])
    ],
    userSetting: {
      "privacy": "public",
      "notifications": "all"
    });

User profile2 = User(
    pictureLink:
        "https://play-lh.googleusercontent.com/jInS55DYPnTZq8GpylyLmK2L2cDmUoahVacfN_Js_TsOkBEoizKmAl5-p8iFeLiNjtE=w526-h296-rw",
    nama: "Bukan Samuel",
    username: "notnamesam_",
    password: "123",
    post: 0,
    following: 10,
    follower: 20,
    description: "Just a humble cat",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "important"});

User profile3 = User(
    pictureLink: "",
    nama: "Michael Johnson",
    username: "mike_j",
    password: "123",
    post: 2,
    following: 250,
    follower: 200,
    description: "Tech enthusiast",
    postList: [
      Post(
          title: "My morning ritual",
          link:
              "https://static.vecteezy.com/system/resources/previews/029/803/200/large_2x/work-from-home-essentials-laptop-and-coffee-free-photo.jpg",
          commentList: [
            Comments(
                user: profile5,
                content: "Can't start a day without a coffee",
                like: 20,
                time: DateTime.now()),
            Comments(
                user: profile2,
                content: "Nice setup!",
                like: 20,
                time: DateTime.now())
          ]),
      Post(
          title: "New tech gadgets",
          link: "https://i.ebayimg.com/images/g/AeMAAOSwh7BhOvnE/s-l1600.jpg",
          commentList: [
            Comments(
                user: profile4,
                content: "Looks cool!",
                like: 20,
                time: DateTime.now()),
            Comments(
                user: profile2,
                content: "I want that!",
                like: 20,
                time: DateTime.now())
          ])
    ],
    userSetting: {
      "privacy": "public",
      "notifications": "none"
    });

User profile4 = User(
    pictureLink:
        "https://wp.catholicmatch.com/wp-content/uploads/2021/02/pexels-giftpunditscom-1310535-scaled-e1614001127258-1024x682.jpg",
    nama: "Emily Davis",
    username: "emily_d",
    password: "123",
    post: 4,
    following: 76,
    follower: 90,
    description: "Traveler and foodie",
    postList: [
      Post(
        title: "My morning ritual",
        link:
            "https://static.vecteezy.com/system/resources/previews/029/803/200/large_2x/work-from-home-essentials-laptop-and-coffee-free-photo.jpg",
      ),
      Post(
        title: "Sunflower",
        link:
            "https://wallpapers.com/images/featured/cute-aesthetic-profile-pictures-pjfl391j3q0f7rlz.jpg",
      ),
      Post(
        title: "Handsome man",
        link:
            "https://marketplace.canva.com/EAFSZhFumYM/1/0/1600w/canva-dark-red-neon-futuristic-instagram-profile-picture-MUPA4np8in0.jpg",
      ),
      Post(
        title: "Mafia Minion",
        link:
            "https://wallpapers.com/images/hd/cool-profile-picture-minion-13pu7815v42uvrsg.jpg",
      ),
    ],
    userSetting: {
      "privacy": "private",
      "notifications": "important"
    });

User profile5 = User(
    pictureLink:
        "https://pics.craiyon.com/2023-10-25/b65f72d6d11a48c1bc560059cc36e31f.webp",
    nama: "Chris Brown",
    username: "chris_b",
    password: "123",
    post: 3,
    following: 123,
    follower: 130,
    description: "Music addict",
    postList: [
      Post(
        title: "Sadboy",
        link:
            "https://wallpapers.com/images/hd/cool-profile-picture-l0hzjr9omwan07nt.jpg",
      ),
      Post(
        title: "Another sadboy me",
        link:
            "https://i.pinimg.com/736x/2b/a2/45/2ba2455ca817f7659e9ebfe9d494c5db.jpg",
      ),
      Post(
        title: "I'm so sad",
        link:
            "https://play-lh.googleusercontent.com/YVSwTRgv42MpB0QacBasBYjUk1yHkTh7lyrAXNHFeO4CCn77lH7wnmKWYnfOaL32n1M=w526-h296-rw",
      ),
    ],
    userSetting: {
      "privacy": "public",
      "notifications": "all"
    });

User profile6 = User(
    pictureLink:
        "https://w0.peakpx.com/wallpaper/357/667/HD-wallpaper-ghost-profile-thumbnail.jpg",
    nama: "Sarah Wilson",
    username: "sarah_wilson",
    password: "123",
    post: 3,
    following: 45,
    follower: 50,
    description: "Nature lover",
    postList: [
      Post(
        title: "Beautiful sunrise",
        link:
            "https://i.pinimg.com/736x/96/5a/33/965a33cf28be7e31250b6b87f1409a89.jpg",
      ),
      Post(
        title: "Lovely tree",
        link:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToOrqnS0gw291nReR6TzKeG3hmlKLlINeulA&usqp=CAU",
      ),
      Post(
        title: "<3",
        link:
            "https://i.pinimg.com/474x/4b/6e/b7/4b6eb76770193c55305234fd8c409188.jpg",
      ),
    ],
    userSetting: {
      "privacy": "private",
      "notifications": "mentions"
    });

User profile7 = User(
    pictureLink:
        "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
    nama: "David Martinez",
    username: "david_m",
    password: "123",
    post: 2,
    following: 89,
    follower: 100,
    description: "Fitness freak",
    postList: [
      Post(
        title: "Anonymouse vape",
        link:
            "https://i.pinimg.com/564x/18/01/f0/1801f0d9ab9302ce52b109407816833d.jpg",
      ),
      Post(
        title: "Smoke weed everday",
        link: "https://cdn.wallpapersafari.com/38/11/2WqNdH.jpg",
      ),
    ],
    userSetting: {
      "privacy": "public",
      "notifications": "none"
    });

User profile8 = User(
    pictureLink:
        "https://images.saymedia-content.com/.image/t_share/MTk4MDQzMTI5NzY3NTM1ODA2/short-captions-for-profile-pictures.png",
    nama: "Sophia Anderson",
    username: "sophia_a",
    password: "123",
    post: 0,
    following: 34,
    follower: 60,
    description: "Bookworm",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "important"});

User profile9 = User(
    pictureLink:
        "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
    nama: "James Thomas",
    username: "james_t",
    password: "123",
    post: 0,
    following: 78,
    follower: 85,
    description: "Aspiring chef",
    postList: [],
    userSetting: {"privacy": "public", "notifications": "all"});

User profile10 = User(
    pictureLink:
        "https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png",
    nama: "Olivia White",
    username: "olivia_white",
    password: "123",
    post: 0,
    following: 99,
    follower: 120,
    description: "Fashionista",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "mentions"});

User profile11 = User(
    pictureLink:
        "https://www.debrabenton.com/wp-content/uploads/2019/07/taking-a-picture-1269456_1280.jpg",
    nama: "Jessica Lee",
    username: "jessica_lee88",
    password: "123",
    post: 0,
    following: 58,
    follower: 75,
    description: "Coffee lover",
    postList: [],
    userSetting: {"privacy": "private", "notifications": "mentions"});

List<User> profiles = [
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
