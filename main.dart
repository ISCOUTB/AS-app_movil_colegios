import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RetosScreen(),
    );
  }
}

class RetosScreen extends StatelessWidget {
  final List<String> retos = ["Reto 1", "Reto 2", "Reto 3"];
  final List<String> urls = [
    "http://localhost:8080/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=1",
    "http://localhost:8080/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=4",
    "http://localhost:8080/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Retos Escolares")),
      body: ListView.builder(
        itemCount: retos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(retos[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(quizUrl: urls[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final String quizUrl;

  QuizScreen({required this.quizUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz H5P")),
      body: kIsWeb ? _buildWebViewForWeb() : _buildWebViewForMobile(),
    );
  }

  /// 🖥️ WebView para Web usando `flutter_inappwebview`
  Widget _buildWebViewForWeb() {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(quizUrl)), // ✅ SOLUCIÓN
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          useShouldOverrideUrlLoading: true,
        ),
      ),
    );
  }

  /// 📱 WebView para Android/iOS
  Widget _buildWebViewForMobile() {
    final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(Colors.transparent);

return WebViewWidget(controller: controller);

  }
}
