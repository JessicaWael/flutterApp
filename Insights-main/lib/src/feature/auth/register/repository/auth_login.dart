import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../../../main.dart';

class AuthRepository {
  signInWithGoogle() async {
    await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await sharedpref!.setString("email", googleUser!.email);

    var res = await checkEmail(googleUser!.email);
    return res;
    // Once signed in, return the UserCredential
    //  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signup() async {
    dynamic result;
    try {
      var response = await http.post(Uri.parse('${url}registeration.php'),
          body: jsonEncode({
            "u_email_v": await sharedpref!.getString("email"),
            "u_password_v": await sharedpref!.getString("password"),
            "u_first_name_v": await sharedpref!.getString("fname"),
            "u_last_name_v": await sharedpref!.getString("lname"),
            "u_name_v": await sharedpref!.getString("uname"),
            "u_birth_date_v": await sharedpref!.getString("bdate"),
            "u_phone_v": await sharedpref!.getString("phone"),
            "u_national_id_v": await sharedpref!.getString("id"),
          }));
      //   print('dataaa');
      //   print(jsonEncode({
      //
      //   "u_email_v":await sharedpref!.getString("email"),
      // "u_password_v":await sharedpref!.getString("password"),
      // "u_first_name_v":await sharedpref!.getString("fname"),
      // "u_last_name_v":await sharedpref!.getString("lname"),
      // "u_name_v":await sharedpref!.getString("uname"),
      // "u_birth_date_v":await sharedpref!.getString("bdate"),
      // "u_phone_v":await sharedpref!.getString("phone"),
      // "u_national_id_v":await sharedpref!.getString("id"),
      //
      // }).toString());
      //  print(response.body.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status_msg'] == 'saved_successfully') {
          await sharedpref!
              .setString("id_v", jsonDecode(response.body)['u_id']);

          result = 'success';
        } else {
          result = jsonDecode(response.body)['status_msg'];
        }
      } else if (response.statusCode == 422) {
      } else {
        result = jsonDecode(response.body)['status_msg'];
      }
    } catch (e) {
      if (e is SocketException) {}
    }
    return result;
  }

  subscribeUser(type) async {
    print('dataaa' + type.toString());

    dynamic result;
    try {
      var response = await http.post(Uri.parse('${url}subscribe.php'),
          body: jsonEncode({
            "user_id_v": sharedpref!.getString("id_v"),
            "subscribe_id_v": type
          }));
      print('dataaa');
      print(jsonEncode({
        "user_id_v": sharedpref!.getString("id_v"),
        "subscribe_id_v": type
      }).toString());

      if (response.statusCode == 200) {
        print('dataaa' + jsonDecode(response.body)['status_msg']);

        if (jsonDecode(response.body)['status_msg'] ==
            'user_email_already_exists') {
          result = 'exist';
        } else {
          result = 'success';
        }
      } else {
        result = jsonDecode(response.body)['status_msg'];
      }
    } catch (e) {
      if (e is SocketException) {}
    }
    return result;
  }

  checkEmail(email) async {
    print('dataaa');
    print(email);
    dynamic result;
    try {
      var response = await http.post(Uri.parse('${url}check_email.php'),
          body: jsonEncode({
            "u_email_v": email.toString(),
          }));

      print('dataaa' + response.statusCode.toString());
      print('dataaa' + jsonDecode(response.body)['status_msg']);

      if (response.statusCode == 200) {
        print('dataaa' + jsonDecode(response.body)['status_msg']);

        if (jsonDecode(response.body)['status_msg'] == 'User not registered') {
          result = 'exist';
        } else {
          result = 'success';
        }
      } else {
        result = jsonDecode(response.body)['status_msg'];
      }
    } catch (e) {
      if (e is SocketException) {}
    }
    return result;
  }
}
