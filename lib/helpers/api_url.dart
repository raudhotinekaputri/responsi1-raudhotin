class ApiUrl {
  static const String baseUrl = 'https://responsi1b.dalhaqq.xyz/api/assignments'; // Ganti dengan URL API Anda

  static const String listTugas = '$baseUrl/tugas'; // Ganti dengan endpoint yang sesuai untuk daftar tugas
  static const String createTugas = '$baseUrl/tugas'; // Ganti dengan endpoint yang sesuai untuk membuat tugas

  static String updateTugas(int id) {
    return '$baseUrl/tugas/$id'; // Ganti dengan endpoint yang sesuai untuk memperbarui tugas berdasarkan ID
  }

  static String showTugas(int id) {
    return '$baseUrl/tugas/$id'; // Ganti dengan endpoint yang sesuai untuk menampilkan detail tugas berdasarkan ID
  }

  static String deleteTugas(int id) {
    return '$baseUrl/tugas/$id'; // Ganti dengan endpoint yang sesuai untuk menghapus tugas berdasarkan ID
  }
}
