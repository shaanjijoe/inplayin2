import 'package:flutter/material.dart';
import 'package:inplayin2/components/announcementcard.dart';
import 'coursepage.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final CoursePageData courseData = ModalRoute.of(context)!.settings.arguments as CoursePageData;

    Map<DateTime, List<String>> groupedAnnouncements = {};

    // Iterate through the announcements and group them by date
    courseData.announcements.forEach((key, value) {
      DateTime date = DateTime.parse(key.toString().split(' ')[0]);
      String announcement = value.toString();
      if (!groupedAnnouncements.containsKey(date)) {
        groupedAnnouncements[date] = [];
      }
      groupedAnnouncements[date]!.add(announcement);
    });

    List<DateTime> sortedDates = groupedAnnouncements.keys.toList()
      ..sort((a, b) => a.compareTo(b));


    // print(sortedDates.toString());

    List<AnnouncementData> announcementList = [];
    sortedDates.forEach((date) {
      announcementList.add(
        AnnouncementData(
          date: '${date.year}-${date.month}-${date.day}',
          announcements: groupedAnnouncements[date]!,
        ),
      );
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
                        color: Color(0xFF9F7BFF).withOpacity(0.1), // Interior color
                        border: Border.all(
                          color: Color(0xFF9F7BFF), // Border color
                          width: 1.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFF9F7BFF), // Icon color
                      ),
                    ),
                    const Text(
                      "Announcements",
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





              SizedBox(height: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < announcementList.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (i == 0 || announcementList[i].date != announcementList[i - 1].date)

                          Padding(padding:EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                            child:
                            Row(

                              mainAxisAlignment: MainAxisAlignment.start, children: [
                              Text(announcementList[i].date),
                            ],),
                          ),

                            Container(
                              padding:EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 1.0),
                              height: 1.0,
                              color: Colors.grey.shade500,

                            ),


                        for (var announcement in announcementList[i].announcements)

                          AnnouncementCard(announcement: announcement, mode: true),


                      ],
                    ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class AnnouncementData {
  final String date;
  final List<String> announcements;
  AnnouncementData({
    required this.date,
    required this.announcements});
}
