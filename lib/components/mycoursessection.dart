import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'courseCard.dart';

class MyCourseSection extends StatefulWidget {
  Map<String, dynamic>? userData = {};

  MyCourseSection({
    super.key,
    required this.userData,
  });

  @override
  State<MyCourseSection> createState() => _MyCourseSectionState();
}

class _MyCourseSectionState extends State<MyCourseSection> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 150, // Height of the course cards
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('courses').get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final List<DocumentSnapshot> courses = snapshot.data!.docs;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {

                Map<DateTime, String> emptymap = {
                  DateTime.now(): "No announcements yet"
                };

                Map<DateTime, String> newmap = {};
                final course = courses[index].data() as Map<String, dynamic>;
                if(course['announcements']!=null){
                  dynamic data = course['announcements'];
                  if(data is Map<dynamic, dynamic>){
                    data.forEach((key, value) {
                      if (key is String ) {
                        newmap[DateTime.parse(key)] = value;
                      }

                    });
                  }


                  // for(var dat in data){
                  //   print(dat.toString());
                  // }
                }

                List<DateTime>absentDates = [];
                List<DateTime>presentDates = [];
                Map<DateTime, String> feedbacks = {};



                if(widget.userData!=null){
                  if(widget.userData?['courses']!=null){
                    if(widget.userData?['courses']?[course['courseId']]!=null){

                        if(widget.userData?['courses']?[course['courseId']]['feedbacks']!=null){
                          widget.userData?['courses']?[course['courseId']]['feedbacks'].forEach((key, value) => {
                            // print(key.toString()),
                            // print(value),
                            feedbacks[DateTime.parse(key)] = value,
                          });
                        }

                        // print(feedbacks);

                        if(widget.userData?['courses']?[course['courseId']]['absentDates']!=null){

                            for( var time in widget.userData?['courses']?[course['courseId']]['absentDates']){
                              Timestamp firebaseTimestamp =time;
                              absentDates.add(firebaseTimestamp.toDate());
                            }
                          }

                        if(widget.userData?['courses']?[course['courseId']]['presentDates']!=null){

                          for( var time in widget.userData?['courses']?[course['courseId']]['presentDates']){
                            Timestamp firebaseTimestamp =time;
                            presentDates.add(firebaseTimestamp.toDate());

                          }
                        }
                        //

                    }
                  }


                }

                // final ann = course['announcements'] != null ? course['announcements'] : emptymap;
                return Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: CourseCard(
                    imageUrl: course['courseImage'],
                    courseName: course['courseName'],
                    groupType: course['courseGroup'],
                    courseIncharge: course['courseIncharge'],
                    announcements: newmap.length!=0 ? newmap : emptymap,
                    absentDates: absentDates,
                    presentDates: presentDates,
                    feedbacks: feedbacks,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
