import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/feature/setting/user/user_detail_info.dart';
import 'package:uni_links/uni_links.dart';

import '../go_router/route_paths.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
    _initURIHandler();
    _incomingLinkHandler();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  bool _initialURIHandled = false;

  ///Declare two [Uri] variables to identify the initial and active/current URI
  Uri? _initialURI;
  Uri? _currentURI;

  ///An [Object] to store the error in case of link parsing malfunctions
  Object? _err;

  ///A [StreamSubscription] object to listen to incoming links when the app is
  /// in the foreground
  StreamSubscription? _streamSubscription;

  ///Create the [_initURIHandler] method

  Future<void> _initURIHandler() async {
    //1 Used a check here so that the _initURIHandler will only be called once
    // even in case of a widget being disposed of
    if (_initialURIHandled) {
      _initialURIHandled = true;
      //2 Displayed a toast using the fluttertoast package when this method was
      // invoked
      Fluttertoast.showToast(
        msg: 'Invoked _initURIHandler',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      try {
        //3 Used the getInitialUri method to parse and return the link as a new
        // URI in initialURI variable
        final initialURI = await getInitialUri();
        //4 Checked whether the initialURI is null or not. If not null, set up
        // the _initialURI value w.r.t initialURI
        if (initialURI != null) {
          log('Initial URI received $initialURI');
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
        } else {
          log('Null Initial URI received');
        }
      } on PlatformException {
        //5 Handled the platform messages fail using PlatformException
        log('Failed to receive initial uri');
      } on FormatException catch (err) {
        //6 Handled the FormatException if the link is not valid as a URI
        if (!mounted) return;
        log('Malformed Initial URI received');
        setState(() {
          _err = err;
        });
      }
    }
  }

  void _incomingLinkHandler() {
    //1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        log('Received URI :$uri ');
        setState(() {
          _currentURI = uri;
          _err = null;
        });
        //3
      }, onError: (Object err) {
        if (!mounted) return;
        log('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
      _streamSubscription?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
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
