import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> getUserDataByEmail(String email) async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference<Map<String, dynamic>> usersCollection = FirebaseFirestore.instance.collection('users');

    // Query Firestore for documents with the specified email address
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await usersCollection.where('email', isEqualTo: email).get();

    // Check if any documents match the query
    if (querySnapshot.docs.isNotEmpty) {
      // Get the data of the first document found
      Map<String, dynamic> userData = querySnapshot.docs.first.data();
      return userData;
    } else {
      // No document found with the specified email address
      print('No user found with email: $email');
      return null;
    }
  } catch (error) {
    // Handle error
    print('Error fetching user data: $error');
    return null;
  }
}

Future<List<Map<String, dynamic>>?> getSchedule() async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference<Map<String, dynamic>> usersCollection = FirebaseFirestore.instance.collection('schedule');

    // Query Firestore for documents with the specified email address
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await usersCollection.get();

    // Check if any documents match the query
    if (querySnapshot.docs.isNotEmpty) {
      // Get the data of the first document found
      List<Map<String, dynamic>> userData = [];

      querySnapshot.docs.forEach((doc) {
        userData.add(doc.data());
      });
      return userData;
    } else {
      // No document found with the specified email address
      print('No data present');
      return null;
    }
  } catch (error) {
    // Handle error
    print('Error fetching user data: $error');
    return null;
  }
}
