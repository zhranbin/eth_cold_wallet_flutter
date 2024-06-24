class AccountModel {
  String address = '';
  String keystore = '';
  bool isDefault = false;

  AccountModel({
    this.address = '',
    this.keystore = '',
    this.isDefault = false,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      address: json['address'],
      keystore: json['keystore'],
      isDefault: json['isDefault'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'keystore': keystore,
      'isDefault': isDefault ? 1 : 0,
    };
  }
}