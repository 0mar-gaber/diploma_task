class FeaturedCourse {
  String? courseTitle ;
  int? studentEnrolled ;
  FeaturedCourse({required this.courseTitle,required this.studentEnrolled});

   FeaturedCourse.fromFirestore(Map<String, dynamic> data,) {
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