class ModelAkun {
  String? pesan;
  DataAkun? data;

  ModelAkun({this.pesan, this.data});

  ModelAkun.fromJson(Map<String, dynamic> json) {
    pesan = json['pesan'];
    data = json['data'] != null ? new DataAkun.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pesan'] = this.pesan;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataAkun {
  int? idAkun;
  String? email;
  String? password;
  String? namaAkun;
  int? umur;
  int? kodeOtp;
  String? tanggalLahir;
  int? nomerHp;
  String? jenisKelamin;
  String? yourInterested;
  String? gambarProfile;
  String? lokasi;
  String? deskripsiSingkat;
  String? pekerjaan;

  DataAkun(
      {this.idAkun,
      this.email,
      this.password,
      this.namaAkun,
      this.umur,
      this.kodeOtp,
      this.tanggalLahir,
      this.nomerHp,
      this.jenisKelamin,
      this.yourInterested,
      this.gambarProfile,
      this.lokasi,
      this.deskripsiSingkat,
      this.pekerjaan});

  DataAkun.fromJson(Map<String, dynamic> json) {
    idAkun = json['id_akun'];
    email = json['email'];
    password = json['password'];
    namaAkun = json['nama_akun'];
    umur = json['umur'];
    kodeOtp = json['kode_otp'];
    tanggalLahir = json['tanggal_lahir'];
    nomerHp = json['nomer_hp'];
    jenisKelamin = json['jenis_kelamin'];
    yourInterested = json['your_interested'];
    gambarProfile = json['gambar_profile'];
    lokasi = json['lokasi'];
    deskripsiSingkat = json['deskripsi_singkat'];
    pekerjaan = json['pekerjaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_akun'] = this.idAkun;
    data['email'] = this.email;
    data['password'] = this.password;
    data['nama_akun'] = this.namaAkun;
    data['umur'] = this.umur;
    data['kode_otp'] = this.kodeOtp;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['nomer_hp'] = this.nomerHp;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['your_interested'] = this.yourInterested;
    data['gambar_profile'] = this.gambarProfile;
    data['lokasi'] = this.lokasi;
    data['deskripsi_singkat'] = this.deskripsiSingkat;
    data['pekerjaan'] = this.pekerjaan;
    return data;
  }
}
