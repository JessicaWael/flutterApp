import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/account/view/notifications/notifications_screen.dart';
import 'package:app/src/feature/account/view/settings/settings_screen.dart';
import 'package:app/src/feature/account/view/change_language/change_language_screen.dart';
import 'package:app/src/feature/account/view/widget/container_body_profile.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? _image;
  String currentUsername = '';
  String currentEmail = '';
  String errorMessage = '';
  bool isLoading = true;
  String photoUrl = '';
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data on screen initialization
    _loadImageFromPreferences(); // Load saved image path when screen initializes
  }

  Future<void> _fetchUserData() async {
    print("Fetching user data...");

    try {
      await _fetchCurrentUsername();
      await _fetchCurrentEmail();
      await _fetchCurrentPhoto();
    } catch (error) {
      print('Error fetching user data: $error');
      _showErrorSnackbar('An error occurred. Please try again later.');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchCurrentUsername() async {
    print("Fetching current username...");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences: $userId");

      if (userId != null) {
        final response = await http.get(
          Uri.parse(
              'http://192.168.1.2/insghts/get_username.php?userId=$userId'),
        );
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          setState(() {
            currentUsername = json.decode(response.body)['u_name'];
          });
        } else {
          _showErrorSnackbar('Error fetching username: ${response.body}');
        }
      } else {
        _showErrorSnackbar('User ID is null.');
      }
    } catch (error) {
      _showErrorSnackbar('An error occurred while fetching username.');
      print("Error: $error");
    }
  }

  Future<void> _fetchCurrentEmail() async {
    print("Fetching current email...");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences: $userId");

      if (userId != null) {
        final response = await http.get(
          Uri.parse(
              'http://192.168.1.2/insghts/get_email.php?userId=$userId'),
        );
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['u_email'] != null) {
            setState(() {
              currentEmail = data['u_email'];
            });
          } else {
            _showErrorSnackbar('Failed to fetch current email');
          }
        } else {
          _showErrorSnackbar('Failed to fetch current email: ${response.body}');
        }
      } else {
        _showErrorSnackbar('User ID is null.');
      }
    } catch (error) {
      _showErrorSnackbar('An error occurred while fetching email.');
      print("Error: $error");
    }
  }

  Future<void> _fetchCurrentPhoto() async {
    print("Fetching current photo...");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences: $userId");

      if (userId != null) {
        final response = await http.get(
          Uri.parse(
              'http://192.168.1.2/insghts/get_photo.php?userId=$userId'),
        );
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['photo'] != null && data['photo'].isNotEmpty) {
            setState(() {
              photoUrl = 'http://192.168.1.2/insghts/${data['photo']}';
            });
            await _saveImageToPreferences(photoUrl);
          } else {
            setState(() {
              photoUrl = ''; // Set to empty string if photo doesn't exist
            });
            await _saveImageToPreferences(photoUrl);
          }
        } else {
          _showErrorSnackbar('Failed to fetch current photo: ${response.body}');
        }
      } else {
        _showErrorSnackbar('User ID is null.');
      }
    } catch (error) {
      _showErrorSnackbar('An error occurred while fetching photo.');
      print("Error: $error");
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      _showErrorSnackbar('No image selected');
    }
  }

  Future<void> _uploadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userId');

    if (userId == null) {
      _showErrorSnackbar('User ID not found. Please login again.');
      return;
    }

    if (_image == null) {
      _showErrorSnackbar('Please select an image');
      return;
    }

    print('Image path: ${_image!.path}');
    final filename = _image!.path.split('/').last;
    print('Filename: $filename');

    final Uri uri =
        Uri.parse('http://192.168.1.2/insghts/upload_image.php');
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.fields['u_id'] = userId.toString(); // Convert userId to string

    try {
      // Ensure the file exists before trying to upload
      if (!await _image!.exists()) {
        throw Exception('File does not exist');
      }

      final pic = await http.MultipartFile.fromPath(
        'photo',
        _image!.path,
        filename: filename,
      );

      request.files.add(pic);
      print('File added to request: ${request.files.length}');

      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final http.Response responseBody =
            await http.Response.fromStream(response);
        final Map<String, dynamic> data = json.decode(responseBody.body);

        if (data['success'] != null) {
          final uploadedPhotoUrl =
              'http://192.168.1.2/insghts/${data['photo']}';
          await _saveImageToPreferences(
              uploadedPhotoUrl); // Save photoUrl instead of local path
          _showSuccessSnackbar('Image uploaded successfully');
          _fetchUserData(); // Refresh user data after successful upload
          setState(() {
            photoUrl = uploadedPhotoUrl; // Update photoUrl state
          });
        } else {
          _showErrorSnackbar(data['message'] ?? 'Failed to upload image');
        }
      } else {
        _showErrorSnackbar(
            'Image upload failed. Status code: ${response.statusCode}');
      }
    } catch (error) {
      _showErrorSnackbar('An error occurred while uploading image');
      print('Error during image upload: $error');
    }
  }

  Future<void> _saveImageToPreferences(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('photo', imagePath);
  }

  Future<void> _loadImageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      photoUrl = prefs.getString('photo') ?? '';
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 20.h,
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'profile_image',
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: _image != null
                                  ? DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover,
                                    )
                                  : photoUrl.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(photoUrl),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                            ),
                            alignment: Alignment.center,
                            child: _image == null && photoUrl.isEmpty
                                ? Icon(Icons.person_outline, size: 60.w)
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: _getImageFromGallery,
                            child: SvgPicture.asset(
                              'assets/icons/icons_add_photo.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUsername,
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                      ),
                      Text(
                        currentEmail,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                      if (errorMessage.isNotEmpty)
                        Text(
                          errorMessage,
                          style: TextStyle(fontSize: 14.sp, color: Colors.red),
                        ),
                    ],
                  ),
                ],
              ),
              Gap(MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text(S.of(context).Upload_Image),
              ),
              Gap(MediaQuery.of(context).size.height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.97,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65.r),
                    topRight: Radius.circular(65.r),
                  ),
                ),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(70.h),
                    ContainerBodyProfile(
                      pahtSvg: 'assets/icons/bell_icon.svg',
                      title: S.of(context).Notifications,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(NotifivationsScreen.routeName);
                      },
                    ),
                    Gap(30.h),
                    Divider(color: Colors.grey),
                    Gap(40.h),
                    ContainerBodyProfile(
                      pahtSvg: 'assets/icons/Setting_icon.svg',
                      title: S.of(context).Setting,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SettingsScreen.routeName);
                      },
                    ),
                    Gap(30.h),
                    Divider(color: Colors.grey),
                    Gap(40.h),
                    ContainerBodyProfile(
                      pahtSvg: 'assets/icons/globe_icon.svg',
                      title: S.of(context).Change_Language,
                      onTap: () {
                        showModalBottomLunguage();
                      },
                    ),
                    Gap(30.h),
                    Divider(color: Colors.grey),
                    Gap(40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModalBottomLunguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => changeLanguage(),
    );
  }
}
