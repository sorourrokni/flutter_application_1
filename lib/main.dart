import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primaryColor: Colors.pink.shade400,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
            bodyMedium: TextStyle(fontSize: 15),
            bodyLarge: TextStyle(
                fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
            headlineLarge: TextStyle(fontWeight: FontWeight.bold),
            displayLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Curriculum Vitae'), actions: const [
          Icon(Icons.chat_bubble_outline_rounded),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(Icons.more_vert_rounded),
          ),
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Brice Séraphin',
                            style: Theme.of(context).textTheme.displayLarge),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Product & Print Designer',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Paris, France',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                  'Enthusiastic young computer Geek, Freelance Designer in love of independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w900, color: Colors.white),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            )
          ],
        ));
  }
}
