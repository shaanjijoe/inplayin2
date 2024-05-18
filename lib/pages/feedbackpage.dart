import 'package:flutter/material.dart';
import 'package:inplayin2/components/feedbackcard.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<FeedbackData> feedData = ModalRoute.of(context)!.settings.arguments as List<FeedbackData>;

    // FeedbackData(
    //   date: 'May 10, 2024',
    //   incharge: 'rajnish',
    //   feedbacks: [
    //     'Congratulations to the winners of the coding competition!',
    //     'Stay tuned for updates on the upcoming hackathon event.',
    //   ],
    // ),
    List<FeedbackData> feedbackList = [];
    feedbackList = feedData;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                      "Feedbacks",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9F7BFF),
                      ),
                    ),
                    const SizedBox(width: 40.0), // Adjust the width as needed for spacing
                  ],
                ),
              ),





              const SizedBox(height: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < feedbackList.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (i == 0 || feedbackList[i].date != feedbackList[i - 1].date)

                          Padding(padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                            child:
                            Row(

                              mainAxisAlignment: MainAxisAlignment.start, children: [
                              Text(feedbackList[i].date),
                            ],),
                          ),

                        if (i == 0 || feedbackList[i].date != feedbackList[i - 1].date)
                              Container(
                                padding:EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                                margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 1.0),
                                height: 1.0,
                                color: Colors.grey.shade500,

                              ),


                          FeedbackCard(feedbacks: feedbackList[i].feedbacks, incharge: feedbackList[i].incharge,),


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


class FeedbackData {
  final String date;
  final String incharge;
  final List<String> feedbacks;

  FeedbackData({required this.incharge, required this.feedbacks, required this.date});
}
