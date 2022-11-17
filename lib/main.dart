import 'package:flutter/material.dart';
import 'app_style.dart';
import 'size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLighterWhite,
        body: HomeScreen(),
      ),

    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: [
          Row(children: [
            Container(
              height: 51,
              width: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kLightBlue,
                image: const DecorationImage(
                  image: NetworkImage("https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png"),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  'Welcome Back',
                  style: KPoppinsBold.copyWith(
                    fontSize:SizeConfig.blockSizeHorizontal!*4,
                  ),
                )
              ],
            )
          ],)
        ],
      ),
    );
  }
}

