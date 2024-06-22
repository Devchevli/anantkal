import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Group chat",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              "Hi, <Username>",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 360,
              child: Row(
                children: [
                  Text("Dev"),
                  Spacer(),
                  Text("10:22 am"),
                ],
              ),
            ),
            Container(
              width: 360,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: const Padding(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
                child: Text(
                  "xyzzz",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Dev"),
                  Spacer(),
                  Text("10:22 am"),
                ],
              ),
            ),
            Container(
              width: 360,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: const Padding(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
                child: Text(
                  "xyzzz",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              height: 90,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Icon(CupertinoIcons.smiley),
                      ),
                      Spacer(),
                      Text("Enter Meassage"),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Icon(Icons.image),
                      ),
                      Container(
                        child: Icon(Icons.telegram),
                        width: 200,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}