import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:get/get.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

class Controller extends GetxController {

  final _amplify = Amplify;
  var userList = <User>[];

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

    try {
      await _amplify.Auth.signOut();
      //print('-I- Successfully signOut 🎉');
    } catch (e) {
      //print('-I- No need to signOut 🎉');
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
    try{
      //userList = RxList(await Amplify.DataStore.query(User.classType));
      final userLists = await Amplify.DataStore.query(User.classType);
      print('Users: $userLists');
      update();
    }catch(e){
      print(e);
    }
  }

  Future<void> updateUser(String? id, String? nombre, String? contact) async {
    try {

      readUser();
    } on Exception catch (e) {
      print(e);
    }
  }
}