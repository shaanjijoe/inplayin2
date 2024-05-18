import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatelessWidget {
  final List<DateTime> absentDates;
  final List<DateTime> presentDates;

  CustomCalendarWidget({required this.absentDates, required this.presentDates});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Container(
        child: TableCalendar(
          // headerVisible: false,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold, fontSize: 18,),
            formatButtonVisible : false,
            titleCentered: true,
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, _) {
              final dateWithoutTime = DateTime(date.year, date.month, date.day);
              if (absentDates.contains(dateWithoutTime)) {

                return Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else if(presentDates.contains(dateWithoutTime)){
                return Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              else {
                // print(date);
                // print(highlightedDates.toString());
                return null; // Return null for default behavior
              }
            },
          ),
        ),
      ),
    );
  }
}
