import '../models/Sach.dart';
import '../models/DocGia.dart';
import '../models/ThuVien.dart';
void main() {
  var thuVien = ThuVien();

  var sach1 = Sach("S001", "Lập trình Dart", "Nguyễn Văn A");
  var sach2 = Sach("S002", "Flutter cơ bản", "Trần Văn B");
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  var docGia1 = DocGia("DG001", "Lê Văn C");
  thuVien.themDocGia(docGia1);

  docGia1.muonSach(sach1);
  docGia1.muonSach(sach2);

  thuVien.hienThiDanhSachSach();
  thuVien.hienThiDanhSachDocGia();

  docGia1.traSach(sach1);

  thuVien.hienThiDanhSachSach();
  thuVien.hienThiDanhSachDocGia();
}
