import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.toggleThemeMode});
  final Function() toggleThemeMode;

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
        appBar: AppBar(title: const Text('Curriculum Vitae'), actions: [
          const Icon(Icons.chat_bubble_outline_rounded),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(Icons.more_vert_rounded),
            ),
          ),
        ]),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
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
                  spacing: 8,
                  runSpacing: 8,
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
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(CupertinoIcons.at),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(CupertinoIcons.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Save'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color surfaceColor;
  final Color secondrayTextColor;
  final Color appBarColor;
  final Color backgroundColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondrayTextColor = Colors.white70,
        appBarColor = Colors.black,
        surfaceColor = const Color(0x0dffffff),
        brightness = Brightness.dark,
        backgroundColor = const Color.fromARGB(255, 30, 30, 30);

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondrayTextColor = Colors.grey.shade900.withOpacity(0.8),
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        surfaceColor = const Color(0x0d000000),
        brightness = Brightness.light,
        backgroundColor = Colors.white;

  ThemeData getTheme() {
    return ThemeData(
      dividerColor: surfaceColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      brightness: brightness,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor))),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        fillColor: surfaceColor,
        filled: true,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: appBarColor, foregroundColor: primaryTextColor),
      textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
          bodyLarge: TextStyle(
            fontSize: 13,
            color: primaryTextColor,
          ),
          headlineLarge:
              TextStyle(fontWeight: FontWeight.bold, color: secondrayTextColor),
          displayLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: secondrayTextColor))),
    );
  }
}
