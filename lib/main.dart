import 'package:flutter/material.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//
class _MyAppState extends State<MyApp> {
  //sendmessage,
  //refresh
  //log
  final _watch = WatchConnectivity();
  final _log = <String>[];
  TextEditingController messageController = TextEditingController();

  var _receivedContexts = <Map<String, dynamic>>[];

    bool isNumeric(String str)  {
  RegExp regex = RegExp(r'^\d');
  return regex.hasMatch(str);
}
  @override
  void initState() {
    _watch.messageStream.listen((e) => setState(() {
          _log.add('Received message $e');
          String msg='$e';
          int colonIndex = msg.indexOf(' ');
          int bracketIndex = msg.indexOf('}');
          msg=msg.substring(colonIndex + 1, bracketIndex);
          if(isNumeric(msg))
          {
             msg='https://maps.apple.com/?ll=$msg';
             sendSMS(msg);
          }
          else
          {sendSMS(msg);}
        
        }));
    refresh(); 
  }

  void sendMessage(String msg) {
    final message = {'MesssageData': msg};
    _watch.sendMessage(message);
    setState(() {
      _log.add('Sent message : $message ');
    });
  }

  Future<void> refresh() async {
    _receivedContexts = await _watch.receivedApplicationContexts;
    setState(() {});
  }


 void sendSMS(String msg) async {
  String phoneNumber = '1223456789'; // Replace with recipient's phone number
  String message = 'Hello, this is a test message!'; // Replace with your message content
  String uri = 'sms:$phoneNumber?body=$msg';

  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

  Widget build(BuildContext context) {

    return MaterialApp(
    
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

       

        // default language
        return Locale('en', 'US');
      },
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Send message
                  // TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        labelText: "enter-your-message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  // Send button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () => sendMessage(messageController.text),
                      child: Text("send-message",
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  // Refresh button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () => refresh(),
                      child: Text("refresh",
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  // Log
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "log",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Expanded ListView
                  Expanded(
                    child: ListView.builder(
                      itemCount: _log.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(_log[index],
                              style: TextStyle(color: Colors.black)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
