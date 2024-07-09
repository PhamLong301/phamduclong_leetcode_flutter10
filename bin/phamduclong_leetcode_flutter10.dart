void main() {
  //exe 1
  print('--------------------------------------------------');
  List<List<int>> input = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  print('Tong 2 gach cheo: ${exercise1(input)}');
  // exe 2

  print('--------------------------------------------------');
  List<SinhVien> dsSinhVien = [
    SinhVien(id: '001', name: 'An', age: 20, point: 6.0),
    SinhVien(id: '002', name: 'Binh', age: 21, point: 4.5),
    SinhVien(id: '003', name: 'Chi', age: 22, point: 7.0),
    SinhVien(id: '004', name: 'Dung', age: 23, point: 3.0),
    SinhVien(id: '005', name: 'Hoa', age: 20, point: 8.0),
  ];
  QuanLySinhVien qlsv = QuanLySinhVien(dsSinhVien);
  print('Sinh Vien Tot Nghiep');
  List<SinhVien> totNghiep = qlsv.phanLoaiSinhVien();
  for (var sv in totNghiep){
    print('${sv.id}, ${sv.name}, ${sv.age}, ${sv.point},');
  }
  print('Tim Sinh Vien');
  List<SinhVien> timKiem = qlsv.timTheoChuCai('i');
  for (var sv in timKiem){
    print('${sv.id}, ${sv.name}, ${sv.age}, ${sv.point},');
  }

  // exe3
  print('--------------------------------------------------');
  print(  exercise3(10, 30));

  // exe4
  print('--------------------------------------------------');
  String num1 = "23156513184151841516";
  String num2 = "61531816510845133431";
  print(exercise4(num1, num2));
}

///Exercise 1

int exercise1(List<List<int>> input) {
  int gach_1 = 0;
  int gach_2 = 0;

  for (int i = 0; i < input.length; i++) {
    if (i == input.length - i - 1) {
      gach_1 += input[i][i];
    } else {
      gach_1 += input[i][i];
      gach_2 += input[i][input.length - i - 1];
    }
  }
  int tong = gach_1 + gach_2;
  return tong;
}

///Exercise 2
class SinhVien {
  String id;
  String name;
  int age;
  double point;
  bool? isGraduated;

  SinhVien(
      {required this.id,
      required this.name,
      required this.age,
      required this.point,
      this.isGraduated});

  String get getId => id;
  set setId(String id) => this.id = id;

  String get getname => name;
  set setname(String name) => this.name = name;

  int get getage => age;
  set setage(int age) => this.age = age;

  double get getpoint => point;
  set setpoint(double point) => this.point = point;

  bool? get getisGraduated => isGraduated;
  set setisGraduated(bool? isGraduated) => this.isGraduated = isGraduated;
}


class QuanLySinhVien{
  List<SinhVien> listSinhVien;

  QuanLySinhVien(this.listSinhVien);

  List<SinhVien> phanLoaiSinhVien(){
    for(var sv in listSinhVien){
      if(sv.point >= 5.0){
        sv.isGraduated = true;
      }else{
        sv.isGraduated = false;
      }
    }
    return listSinhVien.where((sv) => sv.isGraduated == true).toList();
  }

  List<SinhVien> timTheoChuCai(String nameSearch){
    return listSinhVien.where((sv) => sv.name.toLowerCase().contains(nameSearch.toLowerCase())).toList();
  }
}
///Exercise 3

int exercise3(int x, int y){
  int tong = 0;
  int dau = x < y? x : y;
  int cuoi = x < y? y : x;
  for(int i = dau; i <= cuoi; i++){
    if(i % 13 != 0){
      tong += i;
    }
  }
  return tong;
}

///Exercise 4

String exercise4(String num1, String num2){

 int so1 = int.tryParse(num1) ?? 0;
 int so2 = int.tryParse(num2) ?? 0;

 int tong = so1 + so2;

 return tong.toString();
}