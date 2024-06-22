import 'package:assignment/global/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String error = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: GoogleFonts.cherrySwash(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: AppColors.mainColor),
            ),
            Text(
              "Please enter your credentials to proceed ",
              style: GoogleFonts.exo(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.textColor),
            ),
            const SizedBox(
              height: 35,
            ), const SizedBox(
              height: 8,
            ),
            Text(
              "Full Name",
              style: GoogleFonts.exo(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.font600),
            ),

            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  fillColor: Colors.yellow,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'John welles',
                  hintStyle: const TextStyle(
                      color: AppColors.font700,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
            Text('gdffg'),
            SizedBox(
              height: 24,
            ),
            Text(
              "Phone",
              style: GoogleFonts.exo(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.font600),
            ),
            const SizedBox(
              height: 8,
            ),
            IntlPhoneField(
              style: TextStyle(
                color: AppColors.font700,
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),

            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Full Name",
              style: GoogleFonts.exo(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.font600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'John welles',
                  hintStyle: const TextStyle(
                      color: AppColors.font700,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
            Text('gdffg'),

            // ElevatedButton(
            //     onPressed: () {},
            //     child: Container(
            //       color: Colors.yellow,
            //       height: 40,
            //     ))
          ],
        ),
      ),
      // backgroundColor: Colors.yellow,
    );
  }
}
