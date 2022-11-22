import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/User.dart';

class Controller extends GetxController {

  final _amplify = Amplify;

  var userList = <User>[].obs;

  @override
  void onInit() {
    _configureAmplify();
    super.onInit();
  }


  void _configureAmplify() async {
    _amplify.addPlugins([AmplifyAuthCognito(), AmplifyStorageS3(), AmplifyDataStore(modelProvider: ModelProvider.instance), AmplifyAPI()]);
    try {
      await _amplify.configure(amplifyconfig);
      print('Successfully configured Amplify 🎉');
    } catch (e) {
      print('Could not configure Amplify ☠️');
    }
  }

  Future <void> createUser(User newUser) async {
    try{


      await Amplify.DataStore.save(newUser);
      readUser();
      print('Saved ${newUser.toString()}');
    }catch(e){
      print(e);
    }
  }

  Future <void> readUser() async{
    var userList = <User>[].obs;
    var currentUser;
    try{
      //currentUser = await Amplify.DataStore.query(User.classType,
      //    where: User.email.eq(_emailController?.text));
      userList = RxList(await Amplify.DataStore.query(User.classType));
    }catch(e){
      print(e);
    }
  }
}