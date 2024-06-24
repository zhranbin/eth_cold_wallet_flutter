// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "appName": MessageLookupByLibrary.simpleMessage("Ethereum Cold Wallet"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "currentWallet":
            MessageLookupByLibrary.simpleMessage("Current wallet: "),
        "importAccount": MessageLookupByLibrary.simpleMessage("Import account"),
        "inputName":
            MessageLookupByLibrary.simpleMessage("Please enter a name"),
        "inputPassword":
            MessageLookupByLibrary.simpleMessage("Please enter the password"),
        "mnemonic": MessageLookupByLibrary.simpleMessage("Mnemonic"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameTip": MessageLookupByLibrary.simpleMessage("Account name"),
        "noAccount": MessageLookupByLibrary.simpleMessage("No account"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordTip": MessageLookupByLibrary.simpleMessage(
            "This password will be used to encrypt the private key and store the encrypted data. We will not store your private key and password. Please remember this password!"),
        "privateKey": MessageLookupByLibrary.simpleMessage("Private key")
      };
}
