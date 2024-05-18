import 'package:flutter/material.dart';
import 'package:inplayin2/components/customcontainer.dart';


class AnnouncementCard extends StatelessWidget {
  final String announcement;
  final bool mode;
  const AnnouncementCard({
    super.key,
    required this.announcement,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF9F7BFF).withOpacity(0.2), // Background color
              // border: Border.all(
              //   color: Color(0xFF9F7BFF), // Border color
              //   width: 1.0,
              // ),
            )
            ,child: Icon(Icons.announcement_outlined, color: Color(0xFF9F7BFF)),),

          // Icon(Icons.speaker, color: Colors.blue), // Speaker icon
          SizedBox(width: 8.0), // Add a small gap between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  announcement.length > 2000 && !mode
                      ? '${announcement.substring(0, 2000)}...' // Limit text to 2000 characters
                      : announcement,
                  maxLines: mode ? 10 : 3, // Limit to 3 lines
                  overflow: TextOverflow.ellipsis, // Show ellipsis if more than 3 lines
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
