import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ml_project/Profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ml_project/prediction_model.dart';
import 'package:http/http.dart' as http;

class HomePageWidget extends StatefulWidget {
    const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final picker = ImagePicker();

  late String imagePath;

  void initState(){
    imagePath = "empty";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                onTap: (){
                },
                title: Text(
                  'Home Page',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              ListTile(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileWidget()));},
                title: Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF825B4D),
        automaticallyImplyLeading: true,
        actions: [
          ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( '¿Quieres saber a que raza pertenece\n tu peludo?'
                        ,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No te quedes con la duda...\n¡Nosotros te ayudamos!',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Carga una imagen clara del rostro de \ntu mascota y obtén su raza de\ninmediato.',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (imagePath == "empty") ? Image.asset('assets/images/puppy.jpg',width: 200,height: 200,fit: BoxFit.cover) : Image.file(File(imagePath),width: 200,height: 200,fit: BoxFit.cover),
                  ],
                ),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FFButtonWidget(
                          onPressed: uploadImage,
                          text: 'Cargar imagen',
                          icon: Icon(
                            Icons.image,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 190,
                            height: 40,
                            color: Color(0xFF825B4D),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 400,
                  height: 30,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Container(
                  width: 400,
                  height: 10,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Color(0xFFD4A973)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage() async {
    // Select image from user's gallery
    final pickedFile = await picker.getImage(source: ImageSource.gallery);


    if (pickedFile == null) {
       safePrint('No image selected');
       return;
    }
  // Upload image with the current time as the key
    final key = DateTime.now().toString();
    final file = File(pickedFile.path);

    imagePath = pickedFile.path;
    setState((){});

    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
        local: file,
        key: key,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.getFractionCompleted()}');
        },
      );

      //var url = Uri.parse('http://52.86.193.151:8000/clasify');
      //var response = await http.post(url, body: result);
      //var response = await http.post(url, body: {'file: file, 'filename':key});
      //safePrint('status image: ${response.statusCode}');

      safePrint('Successfully uploaded image: ${result.key}');
   } on StorageException catch (e) {
        safePrint('Error uploading image: $e');
   }
  }
}

