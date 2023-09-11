import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_manage/second_page.dart';

import 'home_page_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX State Management Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter GetX State Management Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final HomePageController controller = Get.put(HomePageController());
  FToast? fToast;

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast?.init(context);
  }

  showCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blueGrey,
      ),
      child: const Text(
        "This is a Custom Toast Message okay ???",
        style: TextStyle(color: Colors.white),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Hi", "I'm GetX snackbar");
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showCustomToast();
              },
              child: const Text('Show Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  backgroundColor: Colors.blue,
                  content: const Text('Yay! A Scaffold SnackBar!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show SnackBar'),
            ),

            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(              //VVI(GetX)
                () => Text(
                    '${controller.count.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white),
              onPressed: () {
                // print("pressed");
                Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue);
              },
              child: const Text('GetX Snackbar'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: 'GetX Alert',
                      middleText: 'Simple GetX alert',
                      textConfirm: 'Okay',
                      confirmTextColor: Colors.white,
                      textCancel: 'Cancel');
                },
                child: const Text('Show AlertDialog'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white
                  ),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text("Go to next screen"),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => const SecondPage());
                  }),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
