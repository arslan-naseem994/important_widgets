import 'package:flutter/material.dart';

class SingleChildScrollScrenn extends StatefulWidget {
  const SingleChildScrollScrenn({super.key});

  @override
  State<SingleChildScrollScrenn> createState() =>
      _SingleChildScrollScrennState();
}

class _SingleChildScrollScrennState extends State<SingleChildScrollScrenn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('SingleChildScrollView'),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const ReuseWidgetContainer(
                  color: Colors.red,
                ),
                const ReuseWidgetContainer(
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.teal,
                    child: Center(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Enter you email'),
                      ),
                    ),
                  ),
                ),
                const ReuseWidgetContainer(
                  color: Colors.yellow,
                ),
                const ReuseWidgetContainer(
                  color: Colors.red,
                ),
                const ReuseWidgetContainer(
                  color: Colors.green,
                ),
                const ReuseWidgetContainer(
                  color: Colors.teal,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.black,
                    height: 80,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 100,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: double.infinity,
                            width: 80,
                            color: Colors.white,
                            child: Center(
                              child: Text('Con# ${index + 1}'),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const ReuseWidgetContainer(
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.black,
                    height: 80,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        RowContainerWidger(
                          color: Colors.pink,
                        ),
                        RowContainerWidger(
                          color: Colors.yellow,
                        ),
                        RowContainerWidger(
                          color: Colors.teal,
                        ),
                        RowContainerWidger(
                          color: Colors.green,
                        ),
                        RowContainerWidger(
                          color: Colors.amber,
                        ),
                        RowContainerWidger(
                          color: Colors.pink,
                        ),
                        RowContainerWidger(
                          color: Colors.yellow,
                        ),
                        RowContainerWidger(
                          color: Colors.teal,
                        ),
                        RowContainerWidger(
                          color: Colors.green,
                        ),
                        RowContainerWidger(
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
                const ReuseWidgetContainer(
                  color: Colors.teal,
                ),
                Container(
                  color: Colors.black,
                  height: 80,
                  width: double.infinity,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RowContainerWidger(
                          color: Colors.pink,
                        ),
                        RowContainerWidger(
                          color: Colors.yellow,
                        ),
                        RowContainerWidger(
                          color: Colors.teal,
                        ),
                        RowContainerWidger(
                          color: Colors.green,
                        ),
                        RowContainerWidger(
                          color: Colors.amber,
                        ),
                        RowContainerWidger(
                          color: Colors.pink,
                        ),
                        RowContainerWidger(
                          color: Colors.yellow,
                        ),
                        RowContainerWidger(
                          color: Colors.teal,
                        ),
                        RowContainerWidger(
                          color: Colors.green,
                        ),
                        RowContainerWidger(
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowContainerWidger extends StatelessWidget {
  final Color color;
  const RowContainerWidger({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        color: color,
        height: double.infinity,
        width: 50,
      ),
    );
  }
}

class ReuseWidgetContainer extends StatelessWidget {
  final Color color;
  const ReuseWidgetContainer({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 80,
        width: double.infinity,
        color: color,
      ),
    );
  }
}
