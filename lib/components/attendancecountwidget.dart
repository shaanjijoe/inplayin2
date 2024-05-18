import 'package:flutter/material.dart';
class AttendanceCountWidget extends StatelessWidget {
  final int totalAttendance;
  final int presentAttendance;
  final int absentAttendance;

  AttendanceCountWidget({
    required this.totalAttendance,
    required this.presentAttendance,
    required this.absentAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, ),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAttendanceSection('Total days', totalAttendance, Color(0xFF9F7BFF).withOpacity(0.2),Color(0xFF9F7BFF)),
            _buildAttendanceSection('Days Present', presentAttendance, Colors.green.withOpacity(0.3), Colors.green),
            _buildAttendanceSection('Days Absent', absentAttendance, Colors.red.withOpacity(0.2), Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceSection(String label, int value, Color color, Color textColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
        // margin: EdgeInsets.symmetric( horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(label == 'Total days' ? 10.0 : 0.0),
            bottomLeft: Radius.circular(label == 'Total days' ? 10.0 : 0.0),
            topRight: Radius.circular(label == 'Days Absent' ? 10.0 : 0.0),
            bottomRight: Radius.circular(label == 'Days Absent' ? 10.0 : 0.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 10.0),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
