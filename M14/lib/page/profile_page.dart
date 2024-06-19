import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/profile_post.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/page/settings_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final User? profile;
  const ProfilePage({super.key, this.profile});
  @override
  Widget build(BuildContext context) {
    final isOwner = profile == null;
    final currentProfile = profile ?? context.watch<CurrentUser>().profile;

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () {
                Navigator.of(context)
                    .push(slideInFromRight(const SettingsPage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.more_vert),
              ))
        ],
        title: Text("@${currentProfile?.username ?? ''}"),
      ),
      body: OuterConstraint(
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => InteractiveViewer(
                                    panEnabled: true,
                                    child: Dialog(
                                      shape: const CircleBorder(),
                                      child: CircleAvatar(
                                          radius: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            child: FadeInImage(
                                                height: 200,
                                                width: 200,
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    currentProfile
                                                            ?.pictureLink ??
                                                        ""),
                                                placeholder: const AssetImage(
                                                    "assets/placeholder.jpg"),
                                                imageErrorBuilder: (context,
                                                        error, stackTrace) =>
                                                    const Icon(Icons.person)),
                                          )),
                                    ),
                                  ));
                        },
                        child: CircleAvatar(
                            radius: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: FadeInImage(
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      currentProfile?.pictureLink ?? ""),
                                  placeholder: const AssetImage(
                                      "assets/placeholder.jpg"),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(Icons.person)),
                            )),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 1,
                          ),
                          Column(
                            children: [
                              Text(currentProfile?.post.toString() ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const Text("Post")
                            ],
                          ),
                          Column(
                            children: [
                              Text(currentProfile?.following.toString() ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const Text("Following")
                            ],
                          ),
                          Column(
                            children: [
                              Text(currentProfile?.follower.toString() ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const Text("Follower")
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentProfile?.nama ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(currentProfile?.description ?? ""),
                  const SizedBox(
                    height: 10,
                  ),
                  if (currentProfile?.postList.isNotEmpty ?? false) ...[
                    const Text(
                      "Posts",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ProfilePostGrid(
                      user: currentProfile,
                      isOwner: isOwner,
                    )
                  ] else
                    const SizedBox(
                      height: 500,
                      child: Center(
                        child: Text("No Post Yet"),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
