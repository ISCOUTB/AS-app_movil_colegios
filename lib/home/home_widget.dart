import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconColor,
    required String route,
  }) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x19000000),
              offset: Offset(0.0, 2.0),
            ),
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Colegio',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 12.0,
                buttonSize: 45.0,
                fillColor: FlutterFlowTheme.of(context).info,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 70.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con imagen
              Container(
                width: double.infinity,
                height: 180.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://source.unsplash.com/1200x600?school'),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x80000000), Color(0xCC000000)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenido!',
                        style: FlutterFlowTheme.of(context).displaySmall.override(
                              fontFamily: 'Inter Tight',
                              color: FlutterFlowTheme.of(context).info,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Lunes, marzo 24',
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Inter Tight',
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                      ),
                    ],
                  ),
                ),
              ),

              // Menú principal
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  'Menú',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter Tight',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.9,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildMenuItem(
                      context: context,
                      title: 'Calendario',
                      icon: Icons.calendar_today,
                      iconColor: FlutterFlowTheme.of(context).primary,
                      route: '/calendario',
                    ),
                    buildMenuItem(
                      context: context,
                      title: 'Tareas',
                      icon: Icons.assignment,
                      iconColor: FlutterFlowTheme.of(context).secondary,
                      route: '/tareas',
                    ),
                    buildMenuItem(
                      context: context,
                      title: 'Cursos',
                      icon: Icons.menu_book,
                      iconColor: FlutterFlowTheme.of(context).tertiary,
                      route: '/cursos',
                    ),
                    buildMenuItem(
                      context: context,
                      title: 'Profesores',
                      icon: Icons.people_alt,
                      iconColor: FlutterFlowTheme.of(context).success,
                      route: '/profesores',
                    ),
                    buildMenuItem(
                      context: context,
                      title: 'Notas',
                      icon: Icons.assessment,
                      iconColor: FlutterFlowTheme.of(context).warning,
                      route: '/notas',
                    ),
                    buildMenuItem(
                      context: context,
                      title: 'Eventos',
                      icon: Icons.event,
                      iconColor: FlutterFlowTheme.of(context).error,
                      route: '/eventos',
                    ),
                  ],
                ),
              ),

              // Aquí puedes dejar el resto del contenido tal como estaba:
              // próximas clases, anuncios, etc.
              // (No incluido aquí para no hacer el archivo demasiado largo)
            ],
          ),
        ),
      ),
    );
  }
}
