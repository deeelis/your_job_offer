import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HH.ru Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String clientId = "JVK1MQ18SJ51T97OQ8VTET0SRM042AJDEGSN9PQ9056LLOEOG90S18L9630GJLM8";
  final String clientSecret = "GUSTOVDGMU60SFS2MGGL45CJ5TD0GU1LFDSU4F9SG0ONOI1V9BC5AKIDKJF16G7K";
  final String redirectUri = "myapp://callback";

  String? accessToken;
  String? refreshToken;

  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }
  
  void _handleRedirect() async {
    getInitialUri().then((Uri? uri) {
      if (uri != null && uri.toString().startsWith(redirectUri)) {
        final String? code = uri.queryParameters['code'];
        if (code != null) {
          _fetchAccessToken(code);
        }
      }
    });

    uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.toString().startsWith(redirectUri)) {
        final String? code = uri.queryParameters['code'];
        if (code != null) {
          _fetchAccessToken(code);
        }
      }
    });
  }

  String get authUrl {
    return "https://hh.ru/oauth/authorize?"
        "response_type=code"
        "&client_id=$clientId"
        "&client_secret=$clientSecret"
        "&redirect_uri=${Uri.encodeComponent(redirectUri)}";
  }

  Future<void> _fetchAccessToken(String code) async {
    final String tokenUrl = "https://hh.ru/oauth/token";

    try {
      final response = await http.post(
        Uri.parse(tokenUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'authorization_code',
          'client_id': clientId,
          'client_secret': clientSecret,
          'redirect_uri': redirectUri,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> tokenData = json.decode(response.body);
        setState(() {
          accessToken = tokenData['access_token'];
          refreshToken = tokenData['refresh_token'];
        });
        print("Access Token: $accessToken");
        print("Refresh Token: $refreshToken");
      } else {
        print("Ошибка получения токена: ${response.body}");
      }
    } catch (e) {
      print("Произошла ошибка: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HH.ru Авторизация')),
      body: Center(
        child: accessToken == null
            ? ElevatedButton(
          onPressed: () {
            _launchAuthUrl();
          },
          child: const Text('Авторизоваться'),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Успешная авторизация!'),
            Text('Access Token: $accessToken'),
            Text('Refresh Token: $refreshToken'),
          ],
        ),
      ),
    );
  }
  void _launchAuthUrl() async {
    final Uri authUri = Uri.parse(authUrl);
    print(authUri);
    await launchUrl(authUri, mode: LaunchMode.externalApplication);
  }
}
