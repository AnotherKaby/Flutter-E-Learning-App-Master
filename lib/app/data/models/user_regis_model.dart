class UserRegistration {
  final String namaLengkap;
  final String email;
  final String namaSekolah;
  final String jenjang;
  final String kelas;
  final String gender;
  final String photoUrl;

  const UserRegistration({
    required this.namaLengkap,
    required this.email,
    required this.namaSekolah,
    required this.jenjang,
    required this.kelas,
    required this.gender,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama_lengkap': namaLengkap,
      'email': email,
      'nama_sekolah': namaSekolah,
      'jenjang': 'SMA',
      'kelas': kelas,
      'gender': gender,
      'foto': photoUrl,
    };
  }

  factory UserRegistration.fromMap(Map<String, dynamic> map) {
    return UserRegistration(
      namaLengkap: map['nama_lengkap'] as String,
      email: map['email'] as String,
      namaSekolah: map['nama_sekolah'] as String,
      jenjang: map['jenjang'] as String,
      kelas: map['kelas'] as String,
      gender: map['gender'] as String,
      photoUrl: map['foto'] as String,
    );
  }
}
