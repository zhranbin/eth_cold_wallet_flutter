// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "address": MessageLookupByLibrary.simpleMessage("地址"),
        "appName": MessageLookupByLibrary.simpleMessage("以太坊冷钱包"),
        "createAccount": MessageLookupByLibrary.simpleMessage("创建账户"),
        "currentWallet": MessageLookupByLibrary.simpleMessage("当前钱包："),
        "importAccount": MessageLookupByLibrary.simpleMessage("导入账户"),
        "inputName": MessageLookupByLibrary.simpleMessage("请输入名称"),
        "inputPassword": MessageLookupByLibrary.simpleMessage("请输入密码"),
        "mnemonic": MessageLookupByLibrary.simpleMessage("助记词"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
        "nameTip": MessageLookupByLibrary.simpleMessage("账户名称"),
        "noAccount": MessageLookupByLibrary.simpleMessage("暂无账户"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "passwordTip": MessageLookupByLibrary.simpleMessage(
            "该密码将用于加密私钥并存储加密后的数据，我们不会存储您的私钥以及密码，请务必记住该密码!"),
        "privateKey": MessageLookupByLibrary.simpleMessage("私钥")
      };
}
