import 'dart:math';
import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

// Contructor
  CuaHang(this._tenCuaHang, this._diaChi);

  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // --- Quản lý điện thoại ---

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienthoai) {
    _danhSachDienThoai.add(dienthoai);
    print('Đã thêm điện thoại: ${dienthoai.tenDienThoai}');
  }

  // Cập nhật thông tin điện thoại
  
  // Tạo 1 list có tên dienthoaiMoi để lưu thông tin thay đổi khi cập nhật
  void capNhatThongTinDienThoai(String maDienThoai, DienThoai dienthoaiMoi) {
    for (var dienthoai in _danhSachDienThoai) {
      if (dienthoai.maDienThoai == maDienThoai) {
        dienthoai.tenDienThoai = dienthoaiMoi.tenDienThoai;
        dienthoai.hangSanXuat = dienthoaiMoi.hangSanXuat;
        dienthoai.giaNhap = dienthoaiMoi.giaNhap;
        dienthoai.giaBan = dienthoaiMoi.giaBan;
        dienthoai.soLuongTonKho = dienthoaiMoi.soLuongTonKho;
        dienthoai.trangThai = dienthoaiMoi.trangThai;
        print('Đã cập nhật thông tin điện thoại: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dienthoai in _danhSachDienThoai) {
      if (dienthoai.maDienThoai == maDienThoai) {
        dienthoai.trangThai = false;
        print('Đã ngừng kinh doanh điện thoại: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  // Tìm kiếm điện thoại (theo mã, tên, hãng)
  void timKiemDienThoai({String? maDienThoai, String? tenDienThoai, String? hangSanXuat}) {
    var ketQua = _danhSachDienThoai.where((dt) {
      return (maDienThoai != null && dt.maDienThoai == maDienThoai) ||
          (tenDienThoai != null && dt.tenDienThoai.toLowerCase().contains(tenDienThoai.toLowerCase())) ||
          (hangSanXuat != null && dt.hangSanXuat.toLowerCase().contains(hangSanXuat.toLowerCase()));
    }).toList();

    if (ketQua.isNotEmpty) {
      print('Kết quả tìm kiếm:');
      for (var dienthoai in ketQua) {
        dienthoai.hienThiThongTin();
      }
    } else {
      print('Không tìm thấy điện thoại phù hợp');
    }
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print('Danh sách điện thoại:');
    for (var dienthoai in _danhSachDienThoai) {
      dienthoai.hienThiThongTin();
    }
  }

  // --- Quản lý hóa đơn ---

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoadon) {
    if (hoadon.soLuongMua > hoadon.dienThoaiDuocBan.soLuongTonKho) {
      print('Không đủ tồn kho để tạo hóa đơn');
      return;
    }
    _danhSachHoaDon.add(hoadon);
    print('Đã tạo hóa đơn: ${hoadon.maHoaDon}');
  }

  // Tìm kiếm hóa đơn (theo mã, ngày, khách hàng)
  void timKiemHoaDon({String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    var ketQua = _danhSachHoaDon.where((hoadon) {
      return (maHoaDon != null && hoadon.maHoaDon == maHoaDon) ||
          (ngayBan != null && hoadon.ngayBan == ngayBan) ||
          (tenKhachHang != null &&
              hoadon.tenKhachHang.toLowerCase().contains(tenKhachHang.toLowerCase()));
    }).toList();

    if (ketQua.isNotEmpty) {
      print('Kết quả tìm kiếm hóa đơn:');
      for (var hoadon in ketQua) {
        hoadon.hienThiThongTin();
      }
    } else {
      print('Không tìm thấy hóa đơn phù hợp');
    }
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print('Danh sách hóa đơn:');
    for (var hoadon in _danhSachHoaDon) {
      hoadon.hienThiThongTin();
    }
  }

  // ** Thống kê **

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime start, DateTime end) {
    return _danhSachHoaDon
        .where((hoadon) => hoadon.ngayBan.isAfter(start) && hoadon.ngayBan.isBefore(end))
        .fold(0, (sum, hoadon) => sum + hoadon.tinhTongTien());
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime start, DateTime end) {
    return _danhSachHoaDon
        .where((hoadon) => hoadon.ngayBan.isAfter(start) && hoadon.ngayBan.isBefore(end))
        .fold(0, (sum, hoadon) => sum + hoadon.tinhLoiNhuanThucTe());
  }

  // Thống kê top điện thoại bán chạy
  void thongKeTopBanChay(int topN) {
    var danhSachBanChay = _danhSachHoaDon.fold<Map<String, int>>({}, (map, hoadon) {
      map[hoadon.dienThoaiDuocBan.maDienThoai] =
          (map[hoadon.dienThoaiDuocBan.maDienThoai] ?? 0) + hoadon.soLuongMua;
      return map;
    });

    var sorted = danhSachBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    print('Top $topN điện thoại bán chạy:');
    for (var i = 0; i < min(topN, sorted.length); i++) {
      print('${sorted[i].key}: ${sorted[i].value} sản phẩm');
    }
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    print('Thống kê tồn kho:');
    for (var dienthoai in _danhSachDienThoai) {
      print('Mã: ${dienthoai.maDienThoai}, Tên: ${dienthoai.tenDienThoai}, Tồn: ${dienthoai.soLuongTonKho}');
    }
  }
}
