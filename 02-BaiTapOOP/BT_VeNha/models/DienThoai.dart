class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

// Contructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

// Getter
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

// Setter
  set maDienThoai(String maDienThoai) {
    // Kiểm tra maDienThoai đúng định dạng DT-XXX
    if (!RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai)) {
      throw FormatException(
          'Mã điện thoại không hợp lệ. Định dạng phải là DT-XXX');
    }
    _maDienThoai = maDienThoai;
  }

  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isNotEmpty) {
      _tenDienThoai = tenDienThoai;
    }
  }

  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isNotEmpty) {
      _hangSanXuat = hangSanXuat;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  double tinhLoiNhuan() => (_giaBan - _giaNhap) * _soLuongTonKho;

  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng hàng tồn kho: $_soLuongTonKho");
    print("Trạng thái kinh doanh: ${_trangThai ? "Đã mượn" : "Chưa mượn"}");
  }

  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}
