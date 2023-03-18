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
    Color surfaceColor = const Color(0x0dffffff);
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        dividerColor: surfaceColor,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { photoshop, illustrator, xd, afterEffect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;
  void updateSelectedSkill(_SkillType type) {
    setState(() {
      _skill = type;
    });
  }

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
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
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
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Skill(
                    title: 'Photoshop',
                    type: _SkillType.photoshop,
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    isSelected: _skill == _SkillType.photoshop,
                    onTap: () {
                      updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  Skill(
                    title: 'Adobe XD',
                    type: _SkillType.xd,
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    isSelected: _skill == _SkillType.xd,
                    onTap: () {
                      updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                  Skill(
                    title: 'Illustrator',
                    type: _SkillType.illustrator,
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange.shade100,
                    isSelected: _skill == _SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  Skill(
                    title: 'After Effect',
                    type: _SkillType.afterEffect,
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.blue.shade800,
                    isSelected: _skill == _SkillType.afterEffect,
                    onTap: () {
                      updateSelectedSkill(_SkillType.afterEffect);
                    },
                  ),
                  Skill(
                    title: 'Lightroom',
                    type: _SkillType.lightRoom,
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blue,
                    isSelected: _skill == _SkillType.lightRoom,
                    onTap: () {
                      updateSelectedSkill(_SkillType.lightRoom);
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class Skill extends StatelessWidget {
  final String title;
  final _SkillType type;
  final String imagePath;
  final Color shadowColor;
  final bool isSelected;
  final Function() onTap;

  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isSelected,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: defaultBorderRadius,
                color: Theme.of(context).dividerColor)
            : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.5),
                      blurRadius: 20,
                    )
                  ])
                : null,
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title),
        ]),
      ),
    );
  }
}
