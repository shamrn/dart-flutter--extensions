import 'package:first_app/media_config.dart';
import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: AdaptiveWidget(),
          ),
        ));
  }
}

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaConfig mediaConfig = MediaConfig(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Расширение флаттер для адаптации экрана и размера шрифта.',
                  style: TextStyle(fontSize: mediaConfig.safeBlockHorizontal * 6),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                    width: mediaConfig.safeBlockHorizontal * 98,
                    height: mediaConfig.safeBlockVertical * 20,
                    color: Colors.teal,
                    child: Center(
                        child: Padding(
                          padding:
                          EdgeInsets.all(mediaConfig.safeBlockHorizontal * 1.2),
                          child: Container(
                            color: Colors.amberAccent,
                          ),
                        ))),
                SizedBox(
                  height: mediaConfig.safeBlockVertical * 2,
                ),
                Container(
                    width: mediaConfig.safeBlockHorizontal * 80,
                    height: mediaConfig.safeBlockVertical * 20,
                    color: Colors.red),
                Form(child: TextFormField()),
              ],
            )),
      ),
    );
  }
}
