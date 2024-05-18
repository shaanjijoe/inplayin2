import 'package:flutter/material.dart';


class NumberedList extends StatelessWidget {
  final List<String> sentences;

  NumberedList({required this.sentences});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sentences.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  sentences[index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}