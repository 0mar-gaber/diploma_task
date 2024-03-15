import 'package:diploma_task/account/log_in_screen.dart';
import 'package:diploma_task/firestore.dart';
import 'package:diploma_task/model/selling_card.dart';
import 'package:diploma_task/shared/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/featured_course.dart';
import '../reusable_combatant/best_selling_course.dart';
import '../reusable_combatant/featured_courses.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "home screen";

   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreensProvider provider = Provider.of<ScreensProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Container(
              margin: EdgeInsets.all(width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        provider.themeMode==ThemeMode.light
                        ?"assets/images/logo_svg.svg"
                        :"assets/images/logo_dark_svg.svg",
                        width: width * 0.25,
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: height * 0.013),
                          Text(
                            "Welcome to Route",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onSecondaryContainer
                            ),
                          ),
                          Text(
                            "Enjoy our courses",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface
              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();

                          if(provider.themeMode==ThemeMode.light){
                            provider.changeAppTheme(ThemeMode.dark);
                            prefs.setBool("is dark", true);

                          }else{
                            provider.changeAppTheme(ThemeMode.light);
                            prefs.setBool("is dark", false);

                          }


                        },
                        child: SvgPicture.asset(
                          provider.themeMode==ThemeMode.light
                              ?"assets/icons/icon_moon.svg"
                              :"assets/icons/icon_sun.svg"
                          ,
                          width: width * 0.06,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(context, LogInScreen.route, (route) => false);
                        },
                        icon: Icon(Icons.logout_sharp, size: width * 0.06, color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            toolbarHeight: height * 0.08,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                Container(
                  margin: EdgeInsets.all(width * 0.03),
                  child: Row(
                    children: [
                      Text(
                        "Featured",
                        style: TextStyle(
                          color:  Theme.of(context).colorScheme.onTertiary,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " Courses",
                        style: TextStyle(
                          color:  Theme.of(context).colorScheme.onTertiaryContainer,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.35,
                  child: StreamBuilder(
                    stream: FireStore.getAllFeaturedCoursesRealTime(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<FeaturedCourse>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingAnimationWidget.staggeredDotsWave(
                          color:  Theme.of(context).colorScheme.onTertiaryContainer,
                          size: width * 0.2,
                        );
                      } // loading

                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } //error

                      List<FeaturedCourse> allFeaturedCourse = snapshot.data ?? [];


                      return ListView.builder(
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(left: width*0.03),
                            child: CourseCard(featuredCourse: allFeaturedCourse[index])),
                        itemCount: allFeaturedCourse.length,
                        scrollDirection: Axis.horizontal,
                      ); // success
                    },
                  ),
                ),
                SizedBox(height: height*0.04,),
                Container(
                  margin: EdgeInsets.all(width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Best Selling",
                            style: TextStyle(
                              color:  Theme.of(context).colorScheme.onTertiary,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " Courses",
                            style: TextStyle(
                              color:  Theme.of(context).colorScheme.onTertiaryContainer,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: FireStore.getAllSellingCourseRealTime(),
            builder: (BuildContext context,
                AsyncSnapshot<List<SellingCourse>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color:  Theme.of(context).colorScheme.onTertiaryContainer,
                    size: width * 0.2,
                  ),
                );
              } // loading

              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Text("Error: ${snapshot.error}"),
                );
              } //error

              List<SellingCourse> allSellingCourse = snapshot.data ?? [];


              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) => Container(
                  margin: EdgeInsets.only(left: width*0.03,bottom:width*0.04,right: width*0.03 ),
                    child: SellingCard(sellingCourse: allSellingCourse[index])),
                  childCount: allSellingCourse.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
