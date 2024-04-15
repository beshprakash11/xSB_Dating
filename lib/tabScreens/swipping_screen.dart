import 'package:dating_appfv1/controllers/profile-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({Key? key}) : super(key: key);

  @override
  _SwippingScreenState createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return PageView.builder(
            itemCount: profileController.allUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.allUsersProfileList[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      eachProfileInfo.imageProfile.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    //filter icon button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    //User data
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          //name
                          Text(
                            eachProfileInfo.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //Age - city
                          Text(
                            "${eachProfileInfo.age} ⦿ ${eachProfileInfo.city}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 4,
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
