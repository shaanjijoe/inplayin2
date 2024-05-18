import 'package:inplayin2/components/announcementcard.dart';
import 'package:flutter/material.dart';

class AnnouncementsSection extends StatefulWidget {
  final List<String> announcements;

  AnnouncementsSection({required this.announcements});

  @override
  _AnnouncementsSectionState createState() => _AnnouncementsSectionState();
}

class _AnnouncementsSectionState extends State<AnnouncementsSection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose(){
    widget.announcements.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        //   child: Text(
        //     'Announcements',
        //     style: TextStyle(
        //       fontSize: 20.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 120, // Height of the announcement boxes
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.announcements.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return AnnouncementCard(announcement: widget.announcements[index], mode: false,);
              //   CustomContainer(
              //   child: Text(widget.announcements[index]),
              // );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.announcements.length,
                  (index) => Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: _currentPage == index ? BoxShape.rectangle : BoxShape.circle,
                  color: _currentPage == index ? Color(0xFF755DC1) : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
