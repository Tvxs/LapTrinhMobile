import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKhachHang;

  HoaDon(
      this._maHoaDon,
      this._ngayBan,
      this._dienThoaiDuocBan,
      this._soLuongMua,
      this._giaBanThucTe,
      this._tenKhachHang,
      this._sdtKhachHang);

  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get sdtKhachHang => _sdtKhachHang;

  set maHoaDon(String maHoaDon) {
    // Kiểm tra maHoaDon đúng định dạng HD-XXX
    if (!RegExp(r'^HD-\d{3}$').hasMatch(maHoaDon)) {
      throw FormatException(
          'Mã hóa đơn không hợp lệ. Định dạng phải là HD-XXX');
    }
    _maHoaDon = maHoaDon;
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now())) {
      _ngayBan = ngayBan;
    } else {
      throw ArgumentError('Ngày bán không thể sau ngày hiện tại');
    }
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= _dienThoaiDuocBan.soLuongTonKho) {
      _soLuongMua = soLuongMua;
      _dienThoaiDuocBan.soLuongTonKho -= soLuongMua;
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    }
  }

  set sdtKhachHang(String sdtKhachHang) {
    if (RegExp(r'^\d{10}$').hasMatch(sdtKhachHang)) {
      _sdtKhachHang = sdtKhachHang;
    }
  }

  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoaiDuocBan.giaNhap) * _soLuongMua;
  }

  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại: $_sdtKhachHang');
    print('Điện thoại: ${_dienThoaiDuocBan.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
  }
}
