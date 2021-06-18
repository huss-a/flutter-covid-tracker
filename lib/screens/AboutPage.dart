import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double _logosize = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => setState(() => _logosize = 200));
  }

  Future<void> _launch(String url) async {
    if (await canLaunch(url))
      launch(url);
    else
      throw "Cannot launch $url";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App info"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: FlutterLogo(
                      size: _logosize,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800),
                      style: FlutterLogoStyle.horizontal,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      "Relevant Links",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      child: Text(
                        "Github Repository",
                        style: TextStyle(
                          color: Colors.red[500],
                          fontSize: 17,
                        ),
                      ),
                      onTap: () => _launch(
                          "https://github.com/huss-a/flutter-covid-tracker"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      child: Text(
                        "Report a bug",
                        style: TextStyle(
                          color: Colors.red[500],
                          fontSize: 17,
                        ),
                      ),
                      onTap: () => _launch(
                          "https://github.com/huss-a/flutter-covid-tracker/issues"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 25,
                    ),
                    child: Text(
                      "Social Links",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          color: Colors.red[500],
                          iconSize: 30,
                          onPressed: () => _launch("https://github.com/huss-a"),
                        ),
                      ), //here
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          color: Colors.red[500],
                          iconSize: 30,
                          onPressed: () =>
                              _launch("https://twitter.com/reactsimp"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
