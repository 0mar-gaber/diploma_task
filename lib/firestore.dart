import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diploma_task/model/featured_course.dart';

import 'model/selling_card.dart';

class FireStore{

  static CollectionReference<FeaturedCourse> getFeaturedCourseCollection(){
    var reference =  FirebaseFirestore.instance.collection("Featured").withConverter(

      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data =  snapshot.data();
        return FeaturedCourse.fromFirestore(data??{});
      },


      toFirestore: (featuredCourse, options) {
        return featuredCourse.toFirestore();
      },

    );


    return reference ;
  }

  static CollectionReference<SellingCourse> getSellingCourseCollection(){
    var reference =  FirebaseFirestore.instance.collection("Selling Course").withConverter(

      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data =  snapshot.data();
        return SellingCourse.fromFirestore(data??{});
      },


      toFirestore: (sellingCard, options) {
        return sellingCard.toFirestore();
      },

    );


    return reference ;
  }



  static Stream<List<FeaturedCourse>> getAllFeaturedCoursesRealTime()async*{
    var featuredCourseQueryStream = getFeaturedCourseCollection().snapshots();

    Stream<List<FeaturedCourse>> featuredCourseStream = featuredCourseQueryStream.map((snapshot) => snapshot.docs.map((document) => document.data()).toList());

    yield* featuredCourseStream ;

  }


  static Stream<List<SellingCourse>> getAllSellingCourseRealTime()async*{
    var featuredCourseQueryStream = getSellingCourseCollection().snapshots();

    Stream<List<SellingCourse>> featuredCourseStream = featuredCourseQueryStream.map((snapshot) => snapshot.docs.map((document) => document.data()).toList());

    yield* featuredCourseStream ;

  }





}