import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inplayin2/logicscripts/firestoreData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class WeekViewCalendar extends StatefulWidget {
  @override
  _WeekViewCalendarState createState() => _WeekViewCalendarState();
}

class _WeekViewCalendarState extends State<WeekViewCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  List<Map<String, dynamic>>? scheduleData;

  Map<DateTime, List<CourseClass>> events = {

    // DateTime(2024, 5, 10): [
    //   CourseClass('Sophia','Public', '9:00 AM', '10:00 AM'),
    //   CourseClass('Michael','Private', '12:00 PM', '01:00 PM'),
    // ],

  };

  Future<void> fetchSchedule() async {

    scheduleData = await getSchedule();
    // setState(() {
    //   scheduleData = scheduleData;
    // });

    if(scheduleData!=null){

      for(var dat in scheduleData!){
        Timestamp firebaseTimestamp =dat['startTime'];
        Timestamp endTimestamp =dat['endTime'];
        DateTime enddate = endTimestamp.toDate();
        DateTime startdate = firebaseTimestamp.toDate();
        DateTime startdate2 = DateTime(startdate.year, startdate.month, startdate.day);
        // print(date);
        if(events.containsKey(startdate)){
          events[startdate2]?.add(
              CourseClass(dat['courseName'], dat['courseGroup'], DateFormat('hh:mm a').format(startdate), DateFormat('hh:mm a').format(enddate)
          ));
        } else {
          events[startdate2] = [CourseClass(dat['courseName'], dat['courseGroup'], DateFormat('hh:mm a').format(startdate), DateFormat('hh:mm a').format(enddate))];
        }
      }
    }



    setState(() {
      events = events;
    });

  }



  @override
  void initState() {
    super.initState();
    fetchSchedule();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TableCalendar(
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold, fontSize: 18,),
            formatButtonVisible : false,
            titleCentered: true,
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarFormat: CalendarFormat.week,
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
            });
            print('Selected Day: $_selectedDay');
          },
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFF9F7BFF).withOpacity(0.3), width: 2),
                ),
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        if (events.containsKey(DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)))
          for (var event in events[DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)]!)
            Column(
              children: [
                Container(
                  width: screenWidth/1.2, // Make the container wider
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF9F7BFF).withOpacity(0.15),
                    border: Border.all(
                      color: Colors.grey[300]!, // Thin border color
                      width: 1, // Thin border width
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.courseName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Group Type: ${event.courseGroup}',
                            ),
                          ),
                          Text(
                            'Time: ${event.startTime} - ${event.endTime}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),


      ],
    );
  }
}

class CourseClass {
  final String courseName;
  final String courseGroup;
  final String startTime;
  final String endTime;

  CourseClass(
      this.courseName,
      this.courseGroup,
      this.startTime,
      this.endTime
      );
}

