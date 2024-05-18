import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inplayin2/components/customcontainer.dart';
import 'package:inplayin2/components/numberedlist.dart';


class FeedbackCard extends StatelessWidget {
  final String incharge;
  // final bool mode;
  final List<String> feedbacks;
  FeedbackCard({
    super.key,
    required this.incharge,
    // required this.mode,
    required this.feedbacks,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding:EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child:
              Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle_outlined,size: 50,color: Color(0xFF9F7BFF),),
                  SizedBox(width: 5,),
                  Text(incharge,
                    // style: TextStyle(color: Color(0xFF9F7BFF)),
                  ),
              ],),
            ),

            Container(
              padding:EdgeInsets.symmetric(horizontal: 30, vertical: 1),
              margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 1.0),
              height: 1.0,
              color: Colors.grey.shade500,

            ),


            // NumberedList(sentences: feedbacks),


            // NumberedCard(sentences: feedbacks, fixSize: true,),

            Container(
              height: 150, // Set a fixed height for the container
              child: NumberedList(sentences: feedbacks),
            ),
          ],
        ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.all(1.0),
      //       padding: EdgeInsets.all(15.0),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10.0),
      //         color: Color(0xFF9F7BFF).withOpacity(0.2), // Background color
      //         // border: Border.all(
      //         //   color: Color(0xFF9F7BFF), // Border color
      //         //   width: 1.0,
      //         // ),
      //       )
      //       ,child: Icon(Icons.announcement_outlined, color: Color(0xFF9F7BFF)),),
      //
      //     // Icon(Icons.speaker, color: Colors.blue), // Speaker icon
      //     SizedBox(width: 8.0), // Add a small gap between icon and text
      //     Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             incharge.length > 2000 && !mode
      //                 ? '${incharge.substring(0, 2000)}...' // Limit text to 2000 characters
      //                 : incharge,
      //             maxLines: mode ? 10 : 3, // Limit to 3 lines
      //             overflow: TextOverflow.ellipsis, // Show ellipsis if more than 3 lines
      //             textAlign: TextAlign.left,
      //             style: TextStyle(fontSize: 16.0),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     Text(feedbacks.toString()),
      //   ],
      // ),



    );
  }
}
