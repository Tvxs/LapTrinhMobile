import 'Sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachSachDangMuon = [];

  DocGia(this._maDocGia, this._hoTen);

  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachSachDangMuon => _danhSachSachDangMuon;

  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  void muonSach(Sach sach) {
    // Nếu trạng thái mượn == true thì có thể mượn
    if (sach.trangThaiMuon) {
      print("Sách '${sach.tenSach}' đã có người mượn.");
    } 
    else {
      _danhSachSachDangMuon.add(sach);
      sach.trangThaiMuon = true;
      print("Mượn sách '${sach.tenSach}' thành công.");
    }
  }

  void traSach(Sach sach) {
    // Kiểm tra sách đang mượn có trong danh sách không
    if (_danhSachSachDangMuon.contains(sach)) {
      _danhSachSachDangMuon.remove(sach);
      sach.trangThaiMuon = false;
      print("Trả sách '${sach.tenSach}' thành công.");
    } else {
      print("Bạn không mượn sách này.");
    }
  }
}
