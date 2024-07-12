import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final List<Widget> onboardingScreens = [
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Screen 1',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'Screen 2',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    ),
    Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Screen 3',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    ),
  ];

  final List<String> names = ['Screen1', 'Screen2', 'Screen3'];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('OnBoardScreen'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: onboardingScreens,
          ),
          Positioned(
            bottom: 10,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingScreens.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ReuseColumnWidget(
                    pageController: _pageController,
                    currentPage: _currentPage,
                    indexs: index,
                    namesx: names,
                  ),
                ),
              ),
            ),
          ),
          _currentPage == 0
              ? Positioned(
                  bottom: 10,
                  left: 20,
                  child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut,
                        );
                      },
                      child: const Text('Skip')),
                )
              : const Text(''),
          _currentPage == 2
              ? Positioned(
                  bottom: 10,
                  right: 20,
                  child:
                      GestureDetector(onTap: () {}, child: const Text('Done')),
                )
              : const Text(''),
        ],
      ),
    );
  }
}

class ReuseColumnWidget extends StatelessWidget {
  final int indexs;
  final PageController pageController;
  final int currentPage;
  final List<String> namesx;

  const ReuseColumnWidget({
    super.key,
    required this.indexs,
    required this.currentPage,
    required this.pageController,
    required this.namesx,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            pageController.animateToPage(
              indexs,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
            );
          },
          child: Container(
            width: currentPage == indexs ? 20 : 10,
            height: 10,
            decoration: BoxDecoration(
              shape:
                  currentPage == indexs ? BoxShape.circle : BoxShape.rectangle,
              color: currentPage == indexs ? Colors.greenAccent : Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(namesx[indexs]),
      ],
    );
  }
}

/*

Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingScreens.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReuseColumnWidget(
                  pageController: _pageController,
                  currentPage: _currentPage,
                  indexs: index,
                  namesx: names,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 150,
            color: Colors.blue,
            child: Center(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: onboardingScreens,
              ),
            ),
          ),

 */
