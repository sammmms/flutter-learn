import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/shuffle_loading.dart';
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
        body: OuterConstraint(
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
                    () async {
                      controller.add([]);
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
                      await Future.delayed(const Duration(seconds: 2));
                      controller.add(newList);
                    },
                  );
                },
              ),
              Expanded(
                child: StreamBuilder<List<User>?>(
                    stream: controller,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      }
                      List<User> userList = snapshot.data ?? [];
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: ShuffleLoading(),
                        );
                      }
                      return Padding(
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
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
