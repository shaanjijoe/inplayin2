import 'package:flutter/material.dart';
import 'package:inplayin2/components/coursecalendar.dart';
import 'package:inplayin2/components/customcontainer.dart';
import 'package:inplayin2/components/announcementssection.dart';
import 'package:inplayin2/components/feedbackcard.dart';
import 'package:inplayin2/pages/feedbackpage.dart';
import '../components/attendancecountwidget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {



  @override
  Widget build(BuildContext context) {

    // final CoursePageData courseData = ModalRoute.of(context)!.settings.arguments;
    final CoursePageData courseData = ModalRoute.of(context)!.settings.arguments as CoursePageData;

    // print(courseData.absentDates);
    // print(courseData.feedbacks.toString());


    final List<DateTime>  AbsentDates = [];

    final List<DateTime>  PresentDates = [];

    for( DateTime dat in courseData.absentDates){
       AbsentDates.add(DateTime(dat.year, dat.month, dat.day));
    }

    for( DateTime dat in courseData.presentDates){
       PresentDates.add(DateTime(dat.year, dat.month, dat.day));
    }

    List<String> feedbacks = [];
    Map<DateTime, List<String>> temp = {};
    List<FeedbackData> feedData = [];

    courseData.feedbacks.forEach((key, value) {
      feedbacks.add(value);
      // print(key.);
      DateTime dat = DateTime(key.year, key.month, key.day);
      if (temp.containsKey(dat)) {
        temp[dat]!.add(value);
      } else {
        temp[dat] = [value];
      }
    });

    if(feedbacks.length==0){
      feedbacks.add("No feedbacks yet!");
    }

    temp.forEach((key, value) {
      feedData.add(FeedbackData(incharge: courseData.courseIncharge, feedbacks: value, date: key.toLocal().toString()));
    });


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF9F7BFF).withOpacity(0.5), // Interior color
                        border: Border.all(
                          color: Color(0xFF9F7BFF), // Border color
                          width: 1.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFF9F7BFF), // Icon color
                      ),
                    ),
                    const Text(
                      // courseData.courseName,
                      "Course Page",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9F7BFF),
                      ),
                    ),
                    SizedBox(width: 40.0), // Adjust the width as needed for spacing
                  ],
                ),
              ),

              // SizedBox(height: 10,),

              CustomContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(courseData.courseName,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(courseData.groupType,style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                        ],
                      ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF9F7BFF).withOpacity(0.1), // Background color


                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined, color: Color(0xFF9F7BFF)),
                          SizedBox(width: 8), // Add a small gap between the icon and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location', style: TextStyle(fontWeight: FontWeight.bold),), // Location heading
                              SizedBox(height: 4), // Add spacing between the heading and text
                              Container(
                                width: 150, // Limit the width of the location string
                                child: Text(
                                  'Near Central Library',
                                  style: TextStyle(color: Colors.grey.shade700),
                                  overflow: TextOverflow.ellipsis, // Fade text if it exceeds width
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.account_circle_outlined, color: Color(0xFF9F7BFF),),
                          SizedBox(width: 7,),
                          Text(courseData.courseIncharge,style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                        ],
                      ),



                      // ),
                    ],
                  )
              ),


              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Announcements",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(width: 150,),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/announcements', arguments: courseData
                        );

                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              AnnouncementsSection(announcements: courseData.announcements.values.toList()),


              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Feedback",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(width: 210,),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/feedbacks', arguments: feedData);
                        // widget.controller.animateToPage(1,
                        //     duration: const Duration(milliseconds: 500),
                        //     curve: Curves.ease);
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              FeedbackCard(incharge: "Ramesh", feedbacks: feedbacks,),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Attendance",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(width: 210,),


                  ],
                ),
              ),


              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                  child: AttendanceCountWidget(
                    totalAttendance: PresentDates.length + AbsentDates.length,
                    presentAttendance: PresentDates.length,
                    absentAttendance: AbsentDates.length,
                  ),
                ),
              ),




              CustomCalendarWidget(presentDates:  PresentDates,absentDates:  AbsentDates,),


              SizedBox(height: 10,),



            ],
          ),
        ),
      ),
    );
  }
}

class CoursePageData {
  final String courseName;
  final String groupType;
  final String courseIncharge;
  final Map<DateTime, String> announcements;
  final Map<DateTime, String> feedbacks;
  final List<DateTime> absentDates;
  final List<DateTime> presentDates;

  CoursePageData({
    required this.courseName,
    required this.groupType,
    required this.courseIncharge,
    required this.announcements,
    required this.absentDates,
    required this.presentDates,
    required this.feedbacks,
  });
}

