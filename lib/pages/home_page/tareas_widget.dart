import 'package:flutter/material.dart';
import 'webview_page.dart'; // Asegúrate de crear este archivo

class TareasWidget extends StatelessWidget {
  const TareasWidget({super.key});

  static String routeName = 'Tareas';
  static String routePath = '/tareas';

  final tareas = const [
    {
      'titulo': 'Tarea 1',
      'url': 'http://52.249.219.110/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=1'
    },
    {
      'titulo': 'Tarea 2',
      'url': 'http://52.249.219.110/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=2'
    },
    {
      'titulo': 'Tarea 3',
      'url': 'http://52.249.219.110/wordpress/wp-admin/admin-ajax.php?action=h5p_embed&id=3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tareas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: tareas.length,
          separatorBuilder: (_, __) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final tarea = tareas[index];
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WebViewPage(
                      title: tarea['titulo']!,
                      url: tarea['url']!,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text(tarea['titulo']!),
            );
          },
        ),
      ),
    );
  }
}
