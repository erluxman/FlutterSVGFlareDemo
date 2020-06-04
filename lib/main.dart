import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SVGFlareWidget(),
    );
  }
}

class SVGFlareWidget extends StatefulWidget {
  @override
  _SVGFlareWidgetState createState() => _SVGFlareWidgetState();
}

class _SVGFlareWidgetState extends State<SVGFlareWidget> {
  bool isSvgPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            //Text("Flare & SVG Demo"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                    child: Text(
                      "SVG",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        isSvgPage = true;
                      });
                    },
                    color: isSvgPage ? Colors.pink : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                    child: Text(
                      "Flare",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        isSvgPage = false;
                      });
                    },
                    color: isSvgPage ? Colors.grey : Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[..._getWidgets(isSvgPage)],
      ),
    );
  }
}

List<Widget> _getWidgets(bool isSvg) => isSvg ? svgWidgets : flareWidgets;

var flareWidgets = [
  Image.network(
    "https://pbs.twimg.com/media/EZp5RQnVAAIOiWU?format=png&name=4096x4096",
    loadingBuilder: (context, child, loading) {
      var progress = (loading?.cumulativeBytesLoaded ?? 0) / (loading?.expectedTotalBytes ?? 1);
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        child: (loading == null)
            ? child
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(128.0),
                  child: Container(
                    height: 128,
                    width: 128,
                    child: CircularProgressIndicator(
                      value: progress,
                    ),
                  ),
                ),
              ),
      );
    },
  ),
  FlareWidget("assets/loading.flr", "Alarm"),
  FlareWidget("assets/midnight.flr", "midnight"),
  FlareWidget("assets/world.flr", "world"),
  FlareWidget("assets/programmer.flr", "coding"),
  FlareWidget("assets/progress.flr", "progress"),
];

var svgWidgets = [
  Image.network(
    "https://pbs.twimg.com/media/EZpGOinVAAE4muw?format=png&name=4096x4096",
    loadingBuilder: (context, child, loading) {
      var progress = (loading?.cumulativeBytesLoaded ?? 0) / (loading?.expectedTotalBytes ?? 1);
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        child: (loading == null)
            ? child
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(128.0),
                  child: Container(
                    height: 128,
                    width: 128,
                    child: CircularProgressIndicator(
                      value: progress,
                    ),
                  ),
                ),
              ),
      );
    },
  ),
  Container(
    height: 20,
  ),
  SvgPicture.asset(
    "assets/ufo.svg",
    height: 200,
  ),
  SvgPicture.network(
    "https://image.flaticon.com/icons/svg/124/124555.svg",
    height: 150,
  ),
];

class FlareWidget extends StatefulWidget {
  const FlareWidget(this.fileName, this.animationName, {this.height = 300});

  final String fileName;
  final String animationName;
  final double height;

  @override
  _FlareWidgetState createState() => _FlareWidgetState();
}

class _FlareWidgetState extends State<FlareWidget> {
  var isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPlaying = !isPlaying;
          });
        },
        child: FlareActor(
          widget.fileName,
          animation: widget.animationName,
          isPaused: !isPlaying,
        ),
      ),
    );
  }
}
