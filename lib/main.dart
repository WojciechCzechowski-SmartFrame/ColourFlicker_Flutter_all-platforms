import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromRGBO(85, 128, 170, 1)),
      home: const MyHomePage(title: 'Flutter Colour Flicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _alternatingAnimation;

  bool _alternate = false;

  void _startAlternating() {
    _controller.repeat(reverse: true);
  }

  void _stopAlternating() {
    _controller.stop();
  }

  @override
  initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 16), vsync: this);
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return SizedBox(
                    width: 400,
                    height: 400,
                    child: CustomPaint(
                      painter: FlickeringPainter(_controller.value),
                    ),
                  );
                }),
            Row(
              children: <Widget>[
                Expanded(
                  child: Theme(
                      data: ThemeData(primarySwatch: Colors.green),
                      child: FloatingActionButton(
                          onPressed: _startAlternating,
                          child: const Icon(Icons.play_arrow))),
                ),
                Expanded(
                  child: Theme(
                      data: ThemeData(primarySwatch: Colors.red),
                      child: FloatingActionButton(
                          onPressed: _stopAlternating,
                          child: const Icon(Icons.stop))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FlickeringPainter extends CustomPainter {
  double alternate;
  FlickeringPainter(this.alternate);

  @override
  void paint(Canvas canvas, Size size) {
    List<int> mainColor = [85, 128, 170];
    List<int> first = [95, 142, 152];
    List<int> second = [75, 114, 152];

    var mainPaint = Paint()
      ..color = Color.fromRGBO(mainColor[0], mainColor[1], mainColor[2], 1)
      ..style = PaintingStyle.fill;

    var fc = [...first, ...second];

    Color firstColor = Color.fromRGBO(fc[0], fc[1], fc[2], 1);
    Color secondColor = Color.fromRGBO(fc[3], fc[4], fc[5], 1);

    var firstPaint = Paint()
      ..color = alternate < 0.5 ? firstColor : secondColor
      ..style = PaintingStyle.fill;

    var secondPaint = Paint()
      ..color = alternate < 0.5 ? secondColor : firstColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(const Offset(100, 100) & const Size(200, 200), mainPaint);
    canvas.drawRect(const Offset(150, 175) & const Size(50, 50), firstPaint);
    canvas.drawRect(const Offset(200, 175) & const Size(50, 50), secondPaint);
  }

  @override
  bool shouldRepaint(FlickeringPainter oldDelegate) =>
      oldDelegate.alternate != alternate;
}
