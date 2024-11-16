import 'dart:io';
import 'dart:math';

double? giaTriDauVao(String message) {
  double? kq;
  do {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print('Vui lòng không để trống! Mời nhập lại!');
      continue;
    }
    try {
      kq = double.parse(input);
    } catch (ex) {
      print('Vui lòng nhập số! Mời nhập lại!');
      kq = null;
    }
  } while (kq == null);
  return kq;
}

double nhapA() {
  double? a;
  do {
    a = giaTriDauVao('Nhập hệ số a (a != 0): ');
    if (a == 0) {
      print('Hệ số a phải khác 0! Vui lòng nhập lại.');
    }
  } while (a == null || a == 0);
  return a;
}

void giaiPT(double a, double b, double c) {
  print('\nPhương trình là: ${a}x² + ${b}x + $c = 0');

  double delta = b * b - 4 * a * c;
  print('Delta = $delta');

  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép x1 = x2 = ${x.toStringAsFixed(2)}');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = ${x1.toStringAsFixed(2)}');
    print('x2 = ${x2.toStringAsFixed(2)}');
  }
}

void main() {
  print('CHƯƠNG TRÌNH GIẢI PHƯƠNG TRÌNH BẬC 2');
  print('Phương trình có dạng: ax² + bx + c = 0');

  try {
    double a = nhapA();

    double? b;
    do {
      b = giaTriDauVao('Nhập hệ số b: ');
    } while (b == null);

    double? c;
    do {
      c = giaTriDauVao('Nhập hệ số c: ');
    } while (c == null);

    giaiPT(a, b, c);
  } catch (ex) {
    print('Phương trình có lỗi xảy ra: $ex');
  }
}
