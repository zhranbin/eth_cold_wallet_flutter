import 'package:flutter/cupertino.dart';
import '../utils/account/account_model.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel _accountModel  = AccountModel();
  AccountModel get accountModel => _accountModel;

  void changeAccountModel(AccountModel accountModel) {
   _accountModel = accountModel;
    notifyListeners();
  }

}
