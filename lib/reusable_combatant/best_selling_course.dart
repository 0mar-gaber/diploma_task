import 'package:diploma_task/model/selling_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellingCard extends StatelessWidget {

  SellingCourse sellingCourse ;
  SellingCard({super.key, required this.sellingCourse});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return     Container(
      height: height*0.12,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:  EdgeInsets.all(width*0.008),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: height,
                  margin: EdgeInsets.all(width*0.01),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 65, 130, 1.0),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: SvgPicture.asset("assets/images/logo_dark_svg.svg"),),
                SizedBox(width: width*0.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(sellingCourse.courseTitle??"",
                      style: TextStyle(
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primaryContainer,

                      ),),
                    Text("${sellingCourse.studentEnrolled} Students Enrolled",
                      style: TextStyle(
                        fontSize: width*0.03,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.scrim,
                    ),
                    )],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  fixedSize: Size(width*0.25, height*0.05),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text("Join Now",style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w400
                ),)
            ),

          ],
        ),
      ),
    );
  }
}
