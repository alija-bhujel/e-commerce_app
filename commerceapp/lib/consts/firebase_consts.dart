import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//for authenication
FirebaseAuth auth = FirebaseAuth.instance;
//to enter and get the data in cloudstore
FirebaseFirestore firestore = FirebaseFirestore.instance;
//User is variable just to get auth and login data of user also get from it
User? currentUser = auth.currentUser;

//Collections
const userCollections = "users";
