import 'package:flutter/material.dart';
import 'package:inplayin2/pages/coursepage.dart';
class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String courseName;
  final String groupType;
  final String courseIncharge;
  final Map<DateTime, String> announcements;
  final List<DateTime> absentDates; // Optional parameter
  final List<DateTime> presentDates;
  final Map<DateTime, String> feedbacks;

  CourseCard({
    required this.imageUrl,
    required this.courseName,
    required this.groupType,
    required this.courseIncharge,
    required this.announcements,
    required this.presentDates,
    required this.absentDates,
    required this.feedbacks
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.pushNamed(context, '/coursepage', arguments: CoursePageData(courseName: courseName, groupType: groupType, courseIncharge: courseIncharge, announcements: announcements, absentDates: absentDates, presentDates: presentDates, feedbacks: feedbacks));
    },
    child:
      Card(
      elevation: 4, // Adjust elevation for raised effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      child: Container(
        height: 150, // Set a fixed height for the card
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
          image: DecorationImage(
            image: NetworkImage(imageUrl), // Background image
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,// Cover the whole container
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Text(
                courseName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Text(
                groupType,
                style: TextStyle(
                  // color: Color(0xFF9F7BFF),
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
