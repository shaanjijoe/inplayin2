import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inplayin2/components/mycoursessection.dart';
import 'package:inplayin2/components/weekviewcalendar.dart';
import '../logicscripts/firestoreData.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? userData = {};

  Future<void> fetchData() async {


    User? currentUser = FirebaseAuth.instance.currentUser;
    String email = '';
    if(currentUser!=null){
      User tempuser = currentUser!;
      if(tempuser.email!=null){
        email = tempuser.email!;
      } else {
        return;
      }
    } else{
      return;
    }

    userData = await getUserDataByEmail(email);
    setState(() {
      userData = userData;
    });

    // print(userData?['courses'].toString());

  }

  @override
  void initState(){

    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // String img = 'https://149357281.v2.pressablecdn.com/wp-content/uploads/2023/07/GettyImages-1306184112-scaled.jpg';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF9F7BFF),),
                        ),
                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white, // Adjust the color as needed
                        border: Border.all(color: Color(0xFF837E93), width: 2),
                      ),
                      child:
                          IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(context, '/authpage');
                            },
                            icon: const Icon(Icons.logout_rounded, color: Color(0xFF9F7BFF),),
                            iconSize: 20, // Adjust the size based on the device type
                            color: Colors.black, // Adjust the icon color as needed
                            tooltip: 'Sync Data',

                          ),


                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20,),


              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("My Courses",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
                ),
              ),

              const SizedBox(height: 10,),

              MyCourseSection(userData: userData,),


              SizedBox(height: 15,),


              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                height: 1.0,
                color: Colors.grey.shade500,

              ),

              const SizedBox(height: 15,),



              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Schedule",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),


              WeekViewCalendar(),


            ],
          ),
        ),
      ),
    );
  }
}
