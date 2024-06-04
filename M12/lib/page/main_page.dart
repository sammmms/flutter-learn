import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/page/home_page.dart';
import 'package:m02_praktek/page/profile_page.dart';
import 'package:m02_praktek/page/search_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController link;
  late TextEditingController title;
  late TextEditingController description;
  late List<Widget> listOfPage;
  late ScaffoldMessengerState scaffoldState;

  @override
  void initState() {
    link = TextEditingController();
    title = TextEditingController();
    description = TextEditingController();

    listOfPage = [
      const HomePage(),
      const SearchPage(),
      AddPostPage(link: link, title: title, description: description),
      const ProfileDetail(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    scaffoldState.clearSnackBars();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    scaffoldState = ScaffoldMessenger.of(context);
    super.didChangeDependencies();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        context.watch<DarkModeProvider>().theme == ThemeSelection.dark;
    Color bottomNavbarBackground = isDarkMode ? Colors.black : Colors.white;
    return Scaffold(
      body: listOfPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (currentIndex == 1) {
            if (value != 1) {
              if (title.text != "" &&
                  description.text != "" &&
                  link.text != "") {
                Post newPost = Post(
                    title: title.text,
                    description: description.text,
                    link: link.text);
                Provider.of<UserProvider>(context, listen: false).addPost(
                    newPost,
                    Provider.of<CurrentUser>(context, listen: false).profile!);
                title.clear();
                description.clear();
                link.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Post berhasil ditambahkan."),
                    action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          Provider.of<UserProvider>(context, listen: false)
                              .undoAddPost(
                                  newPost,
                                  Provider.of<CurrentUser>(context,
                                          listen: false)
                                      .profile!);
                        }),
                  ),
                );
              }
              title.clear();
              description.clear();
              link.clear();
            }
          }
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: const Icon(Icons.home),
              backgroundColor: bottomNavbarBackground),
          BottomNavigationBarItem(
              label: "Search",
              icon: const Icon(Icons.search),
              backgroundColor: bottomNavbarBackground),
          BottomNavigationBarItem(
              label: "Add Post",
              icon: const Icon(Icons.add),
              backgroundColor: bottomNavbarBackground),
          BottomNavigationBarItem(
            label: "Profile",
            icon: CircleAvatar(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: FadeInImage(
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      context.watch<CurrentUser>().profile?.pictureLink ?? ""),
                  placeholder: const AssetImage("assets/placeholder.jpg"),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person)),
            )),
            backgroundColor: bottomNavbarBackground,
          )
        ],
      ),
    );
  }
}
