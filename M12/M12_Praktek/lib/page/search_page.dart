import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/profile_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = BehaviorSubject<List<User>?>();
  final scrollController = ScrollController();
  late ThemeSelection currentTheme;

  Timer? timer;

  @override
  void initState() {
    currentTheme = context.read<DarkModeProvider>().theme;
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search User"),
          centerTitle: true,
        ),
        body: StreamBuilder<List<User>?>(
            stream: controller,
            initialData: const [],
            builder: (context, snapshot) {
              List<User> userList = snapshot.data ?? [];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,
                              color: currentTheme == ThemeSelection.dark
                                  ? Colors.white
                                  : Colors.black)),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          controller.add(null);
                          return;
                        }
                        if (timer != null) {
                          timer!.cancel();
                        }
                        timer = Timer(
                          const Duration(milliseconds: 400),
                          () {
                            List<User>? newList = context
                                .read<UserProvider>()
                                .listProfile
                                .where((user) =>
                                    user.nama
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    user.username
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                .toList();
                            controller.add(newList);
                          },
                        );
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Scrollbar(
                          controller: scrollController,
                          child: ListView.builder(
                              itemCount: userList.length,
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                User user = userList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        slideInFromRight(ProfileDetail(
                                          profile: user,
                                        )));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        child: user.pictureLink.isEmpty
                                            ? const Icon(Icons.person)
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: FadeInImage(
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                  placeholder: const AssetImage(
                                                      "assets/placeholder.jpg"),
                                                  image: NetworkImage(
                                                      user.pictureLink),
                                                  imageErrorBuilder: (context,
                                                          error, stackTrace) =>
                                                      const Icon(Icons.person),
                                                ),
                                              )),
                                    title: Text(user.nama),
                                    subtitle: Text("@${user.username}"),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
