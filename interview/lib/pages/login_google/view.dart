import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
    // clientId:
    // '474489435808-lmu5k834cc41757o5sv11bj93s51f98v.apps.googleusercontent.com'
    // serverClientId:
    //     '474489435808-lmu5k834cc41757o5sv11bj93s51f98v.apps.googleusercontent.com', // 这里替换为您的Web客户端ID
  );

  GoogleSignInAccount? _currentUser;
  String? _authCode;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _currentUser!.authentication.then((GoogleSignInAuthentication auth) {
          setState(() {
            _authCode = auth.serverAuthCode;
            // _authCode = GoogleSignInAccount.serverAuthCode;
          });
          // 在这里可以将_authCode发送到您的服务器进行验证
          print("验证码:Auth Code: $_authCode");
        });
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("登录出错: $error");
    }
  }

  // 其他教程拷贝的
  void googleSignIn() async {
    // Initialize GoogleSignIn with the scopes you want:
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
      serverClientId:
          // '474489435808-bgh06756jq9hmmtbn26niohjuqpmbt32.apps.googleusercontent.com', // 这里替换为您的Web客户端ID
          '474489435808-lmu5k834cc41757o5sv11bj93s51f98v.apps.googleusercontent.com',
    );

    // Get the user after successful sign in
    var googleUser = await googleSignIn.signIn();
    /*
    信息: GoogleSignInAccount:{
    displayName: 姜文凡, 
    email: zhan2103208467@gmail.com, 
    id: 110311852157832716656,
    photoUrl: https://lh3.googleusercontent.com/a/ACg8ocLG6_ZRPmne0XSJu6GPlu9fsDecwn5svT7FiBkIpZx7vEfeD31o,
    serverAuthCode: null}

    */
    print("信息: $googleUser");
  }

  Future<void> _handleSignIn2() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      String? serverAuthToken = googleUser.serverAuthCode;
      print("token: $serverAuthToken");
    } catch (error) {
      print("错误: $error");
    }
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    // ConstrainedBox(
    //  constraints: BoxConstraints.expand(),
    return Container(
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          user != null
              ? Column(
                  children: <Widget>[
                    ListTile(
                      leading: GoogleUserCircleAvatar(
                        identity: user,
                      ),
                      title: Text(user.displayName ?? ''),
                      subtitle: Text(user.email),
                    ),
                    const Text('登录成功.'),
                    ElevatedButton(
                      onPressed: _handleSignOut,
                      child: const Text('退出'),
                    ),
                    Text(_authCode != null ? "验证码: $_authCode" : "没有验证码"),
                  ],
                )
              : Column(
                  children: <Widget>[
                    const Text('你当前没有登录.'),
                    ElevatedButton(
                      // onPressed: _handleSignIn,
                      onPressed: _handleSignIn2,
                      // onPressed: googleSignIn,
                      child: const Text('登录'),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
