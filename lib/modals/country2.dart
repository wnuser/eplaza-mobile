class Country2 {
  final String code;
  final String country;
  final String phoneCode;
  final String flag;
  final int id;

  const Country2(this.code, this.country, this.phoneCode, this.flag, this.id);

  @override
  String toString() {
    return 'Country2{code: $code, country: $country, phoneCode: $phoneCode, flag: $flag, id: $id}';
  }
}
