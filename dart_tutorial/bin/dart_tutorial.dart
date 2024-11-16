import 'package:dart_tutorial/dart_tutorial.dart' as dart_tutorial;

void main(List<String> arguments) {
  var ten = "Son";
  int tuoi = 20;

  String? tenNullablle;
  tenNullablle = null;

  late String moTa;
  moTa = "Lap trinh Dart";

  final String quocGia = "VietNam";
  const int nam = 2024;

  print(
      "Ten: $ten \n Tuoi: $tuoi \n MoTa: $moTa \n QuocGia: $quocGia \n Nam: $nam");

  int? soLuong;
  assert(soLuong == null);
  print("SoLuong: $soLuong");
}
