import 'dart:io';
import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

void main() {
  // Tạo cửa hàng
  var cuaHang = CuaHang('Cửa hàng ABC', '123 Đường Chính, TP. HCM');

  // Thêm điện thoại
  var dt1 = DienThoai('DT-001', 'iPhone 14', 'Apple', 20000000, 24000000, 10, true);
  var dt2 = DienThoai('DT-002', 'Samsung Galaxy S23', 'Samsung', 15000000, 20000000, 8, true);
  var dt3 = DienThoai('DT-003', 'Xiaomi 15Pro', 'Xiaomi', 5000000, 7000000, 20, true);

  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  cuaHang.themDienThoai(dt3);

  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  var hoaDon1 = HoaDon('HD-001', DateTime.now(), dt1, 2, 24000000, 'Nguyen Van A', '0123456789');
  var hoaDon2 = HoaDon('HD-002', DateTime.now(), dt2, 1, 20000000, 'Le Thi B', '0987654321');

  cuaHang.taoHoaDon(hoaDon1);
  cuaHang.taoHoaDon(hoaDon2);

  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê
  print('Tổng doanh thu: ${cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime(2024, 12, 31))}');
  print('Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(DateTime(2024, 1, 1), DateTime(2024, 12, 31))}');

  cuaHang.thongKeTopBanChay(2);
  cuaHang.thongKeTonKho();
}
