import 'package:actvidad_personal/pages/second-route.dart';
import 'package:actvidad_personal/services/firebase_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
            future: FirebaseService.firebaseInit(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MyWidget();
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';

----------------------------------------------------------
                        DARK THEME                      /
=========================================================

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
} */

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async => {await FirebaseService.signInGoggle()},
              child: Text("Iniciar con Google!")),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondRoute(),
                        ))
                  },
              child: Text("Facebook")),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondRoute(),
                        ))
                  },
              child: Text("Twitter")),
        ],
      ),
    );
  }
}
