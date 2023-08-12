import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showcaseview Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ShowCaseWidget(
        builder: Builder(
          builder: (context) => const MyHomePage(title: 'Showcaseview Flutter'),
        ),
      ),
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
  final GlobalKey showcase1 = GlobalKey();
  final GlobalKey showcase2 = GlobalKey();
  final GlobalKey showcase3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context)
          .startShowCase([showcase1, showcase2, showcase3]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Showcase(
                  key: showcase1,
                  description: 'Tap for search',
                  overlayOpacity: 0.8,
                  targetShapeBorder: const StadiumBorder(),
                  targetPadding: const EdgeInsets.all(8),
                  child: const Icon(Icons.search),
                )),
          ],
        ),
        body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => index == 4
              ? Showcase(
                  key: showcase3,
                  description: 'แถบข้อมูลลำดับที่ $index',
                  overlayOpacity: 0.5,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      child: Icon(
                        Icons.apps,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Title $index"),
                    subtitle: Text("Subtitle $index"),
                    trailing: const Text("Aug 2023"),
                  ),
                )
              : ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.apps,
                      color: Colors.white,
                    ),
                  ),
                  title: Text("Title $index"),
                  subtitle: Text("Subtitle $index"),
                  trailing: const Text("Aug 2023"),
                ),
        ),
        floatingActionButton: Showcase(
          key: showcase2,
          description: 'กดปุ่มนี้เพื่อเพิ่มข้อมูล',
          overlayOpacity: 0.5,
          targetShapeBorder: const CircleBorder(),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ));
  }
}
