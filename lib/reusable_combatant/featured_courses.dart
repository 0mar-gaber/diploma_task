import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/featured_course.dart';

class CourseCard extends StatelessWidget {
  FeaturedCourse featuredCourse ;
   CourseCard({super.key,required this.featuredCourse});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding:  EdgeInsets.all(width*0.01),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(20),

      ),
      width: width*0.5,
      height: height*0.35,
      child: Container(
        margin: EdgeInsets.all(width*0.02),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 65, 130, 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              width: width,
              height: height*0.15,
              child:   Container(
                  margin: EdgeInsets.all(width*0.04),
                  child: SvgPicture.asset("assets/images/logo_dark_svg.svg")),


            ),
            SizedBox(height: height*0.01,),
            Text(featuredCourse.courseTitle??"",style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: width*0.05,fontWeight: FontWeight.w500 )),
            SizedBox(height: height*0.008,),
            Text("${featuredCourse.studentEnrolled} Students Enrolled",style: TextStyle(
                color: Theme.of(context).colorScheme.scrim,
                fontSize: width*0.04,fontWeight: FontWeight.w300 )),
            SizedBox(height: height*0.013,),
            ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  fixedSize: Size(width, height*0.055),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: Text("Enroll Now",style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: width*0.04,fontWeight: FontWeight.w400),)
            ),

          ],
        ),
      ),
    )
    ;
  }
}
