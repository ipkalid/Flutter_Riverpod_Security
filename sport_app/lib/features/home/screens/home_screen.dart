import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_app/core/style/app_colors.dart';
import 'package:sport_app/core/widgets/background_color.dart';
import 'package:sport_app/core/widgets/common/widgets.dart';
import 'package:sport_app/core/widgets/item_background_color.dart';
import 'package:sport_app/core/widgets/item_title.dart';
import 'package:sport_app/features/home/controller/home_controller.dart';
import 'package:sport_app/features/login/controller/auth_controller.dart';
import 'package:sport_app/features/login/screens/login_screen.dart';

import '../models/data_models.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var homeController = ref.read(homeControllerProvider);
    Future(() async {
      await homeController.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeController = ref.watch(homeControllerProvider);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SafeArea(
            child: homeController.showLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        headerWidget(context),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            enableInfiniteScroll: false,
                          ),
                          items: [1, 2, 3].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    "assets/Video.png",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: RowWithSpacing(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homeController.types
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        homeController.selectType(e);
                                      },
                                      child: SportWidgetView(
                                        title: e.name ?? "",
                                        isSelected:
                                            homeController.selectedType == e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ).itemTitle(
                          "Popular Prosess",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                          padding: EdgeInsets.only(
                            left: 16,
                            top: 16,
                            right: 16,
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                (homeController.selectedType?.courseList !=
                                        null)
                                    ? homeController.selectedType!.courseList!
                                        .map((e) => CourseItem(
                                              course: e,
                                            ))
                                        .toList()
                                    : [],
                          ).itemTitle(
                            "Todays Course",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 64),
                      ],
                    ),
                  ),
          ).backgroundColor(),
          tabBarWidget(),
        ],
      ),
    );
  }

  Padding headerWidget(BuildContext context) {
    var authController = ref.watch(authControllerProvider);
    final name = authController.user?.name ?? "";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, $name ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                children: [
                  Text(
                    "let's Get Exercise",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _showMyDialog();
            },
            child: CircleAvatar(),
          ),
        ],
      ),
    );
  }

  LayoutBuilder tabBarWidget() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.constrainHeight();
        final width = constraints.constrainWidth();
        return SizedBox(
          height: height,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.viewBackgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 135,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x50FFC6AA),
                      blurRadius: 135,
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                height: height * 0.1,
              ),
              Positioned(
                bottom: height * 0.06,
                child: CircleAvatar(
                  radius: height * 0.04,
                  backgroundColor: AppColors.darkBlue,
                  child: CircleAvatar(
                    radius: height * 0.04 * 0.75,
                    backgroundColor: AppColors.mauve,
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    var authController = ref.watch(authControllerProvider);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                await authController.logout();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CourseItem extends StatelessWidget {
  final CourseList course;
  const CourseItem({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.viewBackgroundColor,
              radius: 55 / 2,
              child: Icon(
                Icons.directions_bike,
                color: AppColors.mauve,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 1,
                height: 50,
                color: AppColors.viewBackgroundColor,
              ),
            )
          ],
        ),
        SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowWithSpacing(
              spacing: 8,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    GradientWidget(
                      child: CircleAvatar(radius: 15),
                    ),
                    Icon(Icons.watch_later_outlined),
                  ],
                ),
                Text("10:10"),
                Text("10:10")
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name ?? ""),
                  Text(course.description ?? ""),
                ],
              ),
            ).viewBackground()
          ],
        ),
      ],
    );
  }
}

class SportWidgetView extends StatelessWidget {
  const SportWidgetView({
    super.key,
    required this.title,
    this.isSelected = false,
    this.icon = Icons.abc_outlined,
  });
  final String title;
  final IconData icon;
  final bool isSelected;

  Widget _iconWidget() => Icon(icon, size: 32);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: (!isSelected) ? AppColors.viewBackgroundColor : null,
        gradient: (isSelected) ? AppColors.primaryGradinColor : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 0,
        ),
        child: SizedBox(
          height: 80,
          width: 44,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!isSelected)
                GradientWidget(
                  child: _iconWidget(),
                ),
              if (isSelected) _iconWidget(),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
                // ?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
