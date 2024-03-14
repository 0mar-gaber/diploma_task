class SellingCourse{
  String? courseTitle ;
  int? studentEnrolled ;

  SellingCourse({required this.courseTitle,required this.studentEnrolled});


  SellingCourse.fromFirestore(Map<String, dynamic> data,) {
    courseTitle =  data["course title"];
    studentEnrolled =  data["student enrolled"];
  }

  Map<String, dynamic> toFirestore() {
    Map<String,dynamic> data = {
      "course title": courseTitle,
      "student enrolled": studentEnrolled,
    };
    return data;
  }




}