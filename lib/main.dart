import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test1/pages/cart.dart';
import 'package:test1/pages/dashboard.dart';
import 'package:test1/pages/home/home.dart';
import 'package:test1/pages/login.dart';
import 'package:test1/pages/profile.dart';
import 'package:test1/pages/setting.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      builder: (context, child) =>
          ResponsiveBreakpoints.builder(child: child!, breakpoints: [
        const Breakpoint(
          start: 0,
          end: 450,
          name: MOBILE,
        ),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ]),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigator,
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
    ),
    ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => Dashboard(page: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => Home(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => Profile(),
          ),
          GoRoute(
            path: '/setting',
            builder: (context, state) => Setting(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => Cart(),
          ),
        ])
  ],
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).orientation ==
                        Orientation.landscape
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                children: [
                  ResponsiveRowColumnItem(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      child: SizedBox(
                    height: ResponsiveBreakpoints.of(context).orientation ==
                            Orientation.portrait
                        ? 15
                        : 0,
                    width: ResponsiveBreakpoints.of(context).orientation ==
                            Orientation.portrait
                        ? 0
                        : 15,
                  )),
                  ResponsiveRowColumnItem(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                      child: SizedBox(
                    height: ResponsiveBreakpoints.of(context).orientation ==
                            Orientation.portrait
                        ? 15
                        : 0,
                    width: ResponsiveBreakpoints.of(context).orientation ==
                            Orientation.portrait
                        ? 0
                        : 15,
                  )),
                  ResponsiveRowColumnItem(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                ]),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
