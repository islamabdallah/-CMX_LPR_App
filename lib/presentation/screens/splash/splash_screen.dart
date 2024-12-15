import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/datasources/secure_storage.dart';
import '../../widgets/powered_by.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? user;
  int? langId;

  String? version;


  _startDelay() async {
    Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() async {
    await _getUserData();
    if (user == null) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.routeName, (Route<dynamic> route) => false);
    }
  }
  _getUserData() async {
    final secureStorage=SecureStorageImpl();
    String? userId=await secureStorage.readSecureData('user number');
    Map<String,dynamic> savedUser = {
      'user number':userId,
    };
    final String cachedUser=jsonEncode(savedUser);
    setState(() {
      if(userId==null)
      {
        user=null;
      }
      else
      {
        user = cachedUser;
        userNumber=int.parse(savedUser['user number']);
      }
    });
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 209.h,
                  width: 275.w,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  color: Color(0xFF1980ff),
                ),
              ),
            ),
            Spacer(),
            PoweredByCemex(),
            SizedBox(
              height: 40.h,
            )
          ],
        )
      ),
    );
  }
}
