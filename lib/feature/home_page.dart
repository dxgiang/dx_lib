import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/feature/setting/user/user_detail_info.dart';
import 'package:uni_links/uni_links.dart';

import '../go_router/route_paths.dart';

bool _initialUriIsHandled = false;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
    _handleInitialUri();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  /// Handle incoming links - the ones that the app will receive from the OS
  /// while already started.
  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        print('got uri: $uri');
        if (uri != null) {
          String path = uri.toString().split('/').last;
          print(path);
          if (path == 'myactivity') {
            context.pushNamed(RoutePaths.myActivity); 
          }
        }
        setState(() {
          _latestUri = uri;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        print('got err: $err');
        setState(() {
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  /// Handle the initial Uri - the one the app was started with
  ///
  /// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
  /// ONLY ONCE in your app's lifetime, since it is not meant to change
  /// throughout your app's life.
  ///
  /// We handle all exceptions, since it is called from initState.
  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('falied to get initial uri');
      } on FormatException catch (err) {
        if (!mounted) return;
        print('malformed initial uri');
        setState(() => _err = err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final queryParams = _latestUri?.queryParametersAll.entries.toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: kPaddingAll16,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => context.pushNamed(RoutePaths.myActivity),
                  child: const Text('Go to activity'),
                ),
              ),
              SizedBox(height: kPadding16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () => context
                      .pushNamed(RoutePaths.settings, params: {'name': 'Alex'}),
                  child: const Text(
                    'Go to setting',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: kPadding16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    UserModel model = UserModel(
                      age: '22',
                      email: 'youremail@gmail.com',
                      address: 'Ho Chi Minh City',
                      userName: 'Alex',
                    );
                    context.goNamed(
                      RoutePaths.userDetailInfo,
                      params: {'name': 'Alex'},
                      extra: model,
                    );
                  },
                  child: const Text(
                    'Go to Detail with goNamed',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: kPadding16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    UserModel model = UserModel(
                      age: '22',
                      email: 'youremail@gmail.com',
                      address: 'Ho Chi Minh City',
                      userName: 'Alex',
                    );
                    context.pushNamed(
                      RoutePaths.userDetailInfo,
                      params: {'name': 'Alex'},
                      extra: model,
                    );
                  },
                  child: const Text(
                    'Go to Detail with pushNamed',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// @RouterObserver('name/{id}')
// class NamePage extends StatefulWidget {
//   final String id;
//   const NamePage({super.key});

//   @override
//   State<NamePage> createState() => _NamePageState();
// }

// class _NamePageState extends State<NamePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// <String, W>
