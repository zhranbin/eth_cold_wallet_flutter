import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import '../db/db_helper.dart';

import 'account_model.dart';
import 'byte.dart';

class AccountManager {

  /// 创建账户
  static Future<void> createAccount(String name, String password) async {
    // 生成随机的助记词
    String mnemonic = bip39.generateMnemonic();
    print("助记词 - ${mnemonic}");
    // 将助记词转换为种子
    Uint8List seed = bip39.mnemonicToSeed(mnemonic);
    // 从种子生成根私钥
    bip32.BIP32 root = bip32.BIP32.fromSeed(seed);
    // 按照 BIP-32 规范生成子私钥路径，例如 m/44'/60'/0'/0/0
    // 这里的路径可以根据需要进行调整
    bip32.BIP32 child = root.derivePath("m/44'/60'/0'/0/0");
    // 获取子私钥的字节数组
    Uint8List privateKeyBytes = child.privateKey ?? Uint8List(0);
    // 将字节数组转换为十六进制字符串表示私钥
    String privateKeyHex = bytesToHexString(privateKeyBytes);
    // 打印私钥
    print('生成的私钥: $privateKeyHex');
    // generateKeyStore();

  }




  /// 获取账户列表
  static Future<List<AccountModel>> getAccounts() async {
    List<AccountModel> accounts = [];
    List<Map<String, dynamic>> result = await DBHelper.query('account_table');
    for (var item in result) {
      accounts.add(AccountModel.fromJson(item));
    }
    DBHelper.close();
    return accounts;
  }

  /// 添加账户
  static Future<void> addAccount(AccountModel account) async {
    // 判断是否已经存在
    List<Map<String, dynamic>> result = await DBHelper.query('account_table');
    for (var item in result) {
      if (item['address'] == account.address) {
        return;
      }
    }
    await DBHelper.insert('account_table', account.toJson());
    DBHelper.close();
  }

  /// 删除账户
  static Future<void> deleteAccount(String address) async {
    await DBHelper.delete('account_table', where: 'address = $address');
    DBHelper.close();
  }

  /// 获取默认账户
  static Future<AccountModel?> getDefaultAccount() async {
    List<AccountModel> accounts = await getAccounts();
    for (var account in accounts) {
      if (account.isDefault) {
        return account;
      }
    }
    return null;
  }

  /// 设置默认账户
  static Future<void> setDefaultAccount(String address) async {
    List<AccountModel> accounts = await getAccounts();
    for (var item in accounts) {
      if (item.isDefault && item.address != address) {
        item.isDefault = false;
        await _updateAccount(item);
      }
      if (item.address == address) {
        item.isDefault = true;
        await _updateAccount(item);
      }
    }
    DBHelper.close();
  }

  static Future<void> _updateAccount(AccountModel account) async {
    await DBHelper.update('account_table', account.toJson(), where: 'address = ${account.address}',);
  }

}


class TimeFormatter {
  static String stringFromDate(DateTime date) {
    // 实现时间格式化逻辑
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}

class DateFormatter {
  static String stringFromDate(DateTime date) {
    // 实现日期格式化逻辑
    return "${date.hour}-${date.minute.toString().padLeft(2, '0')}-${date.second.toString().padLeft(2, '0')}";
  }
}