import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
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

  final List<String> names = ['main', 'dashboard', 'profile'];

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
        title: const Text('PageViewScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            width: 50,
            height: 50.0,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
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
