import 'package:flutter/material.dart';

class StackWidgetScreen extends StatefulWidget {
  const StackWidgetScreen({super.key});

  @override
  State<StackWidgetScreen> createState() => _StackWidgetScreenState();
}

class _StackWidgetScreenState extends State<StackWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.red,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                          ),
                          Text(
                            'Building',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                      bottom: 50,
                      right: 0,
                      left: 100,
                      top: 50,
                      child: Image(
                          image: AssetImage('assets/images/building.png'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
