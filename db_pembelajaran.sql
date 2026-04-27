-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 27 Apr 2026 pada 10.18
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pembelajaran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bab`
--

CREATE TABLE `bab` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `urutan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bab`
--

INSERT INTO `bab` (`id`, `judul`, `urutan`) VALUES
(1, 'Pengenalan Flutter', 1),
(2, 'Widget Dasar', 2),
(3, 'State Management', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `badge`
--

CREATE TABLE `badge` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `icon` varchar(50) NOT NULL,
  `warna` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `badge`
--

INSERT INTO `badge` (`id`, `nama`, `deskripsi`, `icon`, `warna`) VALUES
(1, 'Pemula', 'Selamat! Kamu sudah terdaftar di Ardata Learning.', 'star_border_rounded', 'amber'),
(2, 'Pelajar Aktif', 'Kamu telah membaca materi pertamamu.', 'timer_outlined', 'blue'),
(3, 'Master Kuis', 'Kamu berhasil menyelesaikan kuis dengan skor sempurna.', 'auto_awesome_rounded', 'purple'),
(4, 'Pembaca Tekun', 'Kamu telah membaca semua materi yang tersedia.', 'menu_book_rounded', 'green');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuis`
--

CREATE TABLE `kuis` (
  `id` int(11) NOT NULL,
  `soal` text NOT NULL,
  `opsi_a` varchar(255) NOT NULL,
  `opsi_b` varchar(255) NOT NULL,
  `opsi_c` varchar(255) NOT NULL,
  `opsi_d` varchar(255) NOT NULL,
  `opsi_e` varchar(255) DEFAULT NULL,
  `jawaban_benar` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kuis`
--

INSERT INTO `kuis` (`id`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `jawaban_benar`) VALUES
(2, 'Di suatu daerah, pemerintah ingin meningkatkan akses keuangan masyarakat pedesaan yang sebagian besar berprofesi sebagai petani dan pedagang kecil. Selama ini, mereka kesulitan mendapatkan pinjaman dari bank umum karena persyaratan yang cukup kompleks dan kurangnya jaminan formal. Di sisi lain, terdapat lembaga keuangan yang mampu memberikan kredit dengan prosedur lebih sederhana serta memiliki kedekatan dengan masyarakat setempat.\nBerdasarkan kondisi tersebut, kebijakan yang paling tepat untuk meningkatkan inklusi keuangan adalah…', 'Memperbanyak bank umum dengan layanan digital', 'Mengembangkan peran BPR di daerah tersebut', 'Membatasi pemberian kredit kepada masyarakat kecil', 'Mengalihkan seluruh pembiayaan ke lembaga non-keuangan', 'Meningkatkan suku bunga simpanan masyarakat', 'B'),
(3, 'Sebuah perusahaan besar membutuhkan pembiayaan dalam jumlah besar untuk ekspansi usaha ke luar negeri. Perusahaan tersebut juga membutuhkan layanan transaksi lintas negara, seperti transfer internasional dan pembiayaan ekspor-impor.\nJika dilihat dari karakteristik layanan yang dibutuhkan, lembaga keuangan yang paling tepat digunakan adalah…', 'BPR karena lebih fleksibel', 'Bank umum karena memiliki layanan luas', 'Koperasi simpan pinjam', 'Lembaga pembiayaan non-bank', 'Pegadaian', 'B'),
(4, 'Seorang pedagang pasar lebih memilih meminjam dana di BPR dibandingkan bank umum meskipun bunga yang ditawarkan sedikit lebih tinggi. Ia merasa prosesnya lebih mudah dan petugas bank lebih memahami kondisi usahanya.\nDari sudut pandang ekonomi, keputusan tersebut menunjukkan bahwa…', 'Pedagang tidak rasional dalam mengambil keputusan', 'Faktor non-finansial memengaruhi pilihan lembaga keuangan', 'BPR selalu lebih menguntungkan dibanding bank umum', 'Bank umum tidak memiliki peran penting', 'Bunga bukan faktor utama dalam kredit', 'B'),
(5, 'Dalam sistem keuangan, keberadaan bank umum dan BPR sering dikatakan saling melengkapi. Namun, jika salah satu dihilangkan, akan muncul dampak tertentu terhadap perekonomian.\nJika BPR tidak ada, dampak yang paling mungkin terjadi adalah…', 'Transaksi internasional terhambat', 'Pelaku usaha kecil kesulitan akses kredit', 'Bank umum tidak dapat beroperasi', 'Sistem pembayaran terganggu total', 'Nilai tukar menjadi tidak stabil', 'B'),
(6, 'Sebuah wilayah mengalami peningkatan penggunaan layanan digital banking. Namun, masih banyak masyarakat yang belum memahami teknologi dan lebih nyaman dengan layanan langsung.\nEvaluasi terbaik terhadap kondisi ini adalah…', 'Digitalisasi harus menggantikan semua layanan manual', 'Bank umum tidak relevan lagi', 'Perlu kombinasi layanan digital dan pendekatan personal', 'BPR harus dihapuskan', 'Layanan manual tidak efisien', 'C'),
(7, 'Jika dilihat dari sudut pandang stabilitas sistem keuangan, keberagaman jenis bank (bank umum dan BPR) memberikan manfaat karena…', 'Mengurangi jumlah uang beredar', 'Menyebabkan persaingan tidak sehat', 'Menjangkau berbagai segmen masyarakat', 'Menghilangkan risiko kredit', 'Menurunkan keuntungan bank', 'C'),
(8, 'Seorang mahasiswa menggunakan fasilitas paylater untuk membeli barang elektronik tanpa mempertimbangkan kemampuan membayar. Awalnya cicilan terasa ringan, tetapi kemudian ia kesulitan karena memiliki beberapa tagihan sekaligus.\nEvaluasi terbaik terhadap perilaku tersebut adalah…', 'Keputusan tepat karena memanfaatkan teknologi', 'Risiko kredit hanya ditanggung bank', 'Kurangnya perencanaan keuangan meningkatkan risiko gagal bayar', 'Semua kredit pasti menguntungkan', 'Kredit tidak memiliki risiko', 'C'),
(9, 'Sebuah bank menolak pengajuan kredit dari seorang pelaku usaha meskipun usaha tersebut cukup ramai. Setelah dianalisis, ternyata arus kas usaha tidak stabil dan tidak ada pencatatan keuangan yang jelas.\nKeputusan bank tersebut menunjukkan bahwa…', 'Bank tidak ingin mengambil keuntungan', 'Bank menerapkan prinsip kehati-hatian', 'Bank tidak mendukung usaha kecil', 'Kredit hanya untuk perusahaan besar', 'Analisis kredit tidak diperlukan', 'B'),
(10, 'Dalam kondisi ekonomi menurun, banyak nasabah mengalami kesulitan membayar cicilan. Bank kemudian memberikan kebijakan restrukturisasi kredit.\nDari sudut pandang manajemen risiko, kebijakan tersebut bertujuan untuk…', 'Menghapus kewajiban nasabah', 'Menghindari kerugian total akibat kredit macet', 'Menambah beban nasabah', 'Mengurangi keuntungan bank', 'Menghentikan semua kredit', 'B'),
(11, 'Seorang pengusaha menggunakan kredit untuk memperluas usaha, tetapi dana tersebut justru digunakan untuk konsumsi pribadi. Akibatnya, usaha tidak berkembang dan pembayaran kredit terganggu.\nKasus tersebut menunjukkan bahwa risiko kredit dapat disebabkan oleh…', 'Faktor eksternal saja', 'Faktor internal berupa penyalahgunaan dana', 'Kebijakan bank yang salah', 'Sistem ekonomi global', 'Tingkat bunga rendah', 'B'),
(12, 'Jika tingkat kredit macet meningkat secara signifikan di suatu bank, dampak yang paling logis terhadap bank tersebut adalah…', 'Likuiditas meningkat', 'Kepercayaan masyarakat meningkat', 'Kemampuan menyalurkan kredit menurun', 'Keuntungan meningkat drastis', 'Risiko menurun', 'C'),
(13, 'Dalam evaluasi pemberian kredit, bank mempertimbangkan kondisi ekonomi makro seperti inflasi and daya beli masyarakat. Hal ini menunjukkan bahwa…', 'Kredit hanya dipengaruhi faktor internal', 'Analisis kredit bersifat menyeluruh', 'Bank tidak fokus pada nasabah', 'Ekonomi tidak berpengaruh', 'Kredit selalu aman', 'B'),
(14, 'Seorang siswa memiliki uang saku yang cukup, tetapi selalu habis sebelum akhir bulan karena sering membeli barang diskon yang tidak dibutuhkan.\nEvaluasi terbaik terhadap kondisi tersebut adalah…', 'Pendapatan kurang', 'Kurangnya literasi keuangan', 'Harga barang terlalu mahal', 'Tidak ada solusi', 'Semua orang sama', 'B'),
(15, 'Seseorang memilih investasi dengan imbal hasil tinggi tanpa memahami risikonya, lalu mengalami kerugian besar.\nHal ini menunjukkan bahwa literasi keuangan penting untuk…', 'Meningkatkan konsumsi', 'Menghindari risiko investasi', 'Menjamin keuntungan', 'Menghapus kerugian', 'Mengurangi pendapatan', 'B'),
(16, 'Dalam kondisi darurat, seseorang yang memiliki dana cadangan tidak perlu berutang.\nHal ini menunjukkan bahwa literasi keuangan membantu dalam…', 'Meningkatkan gaya hidup', 'Mengurangi kebutuhan', 'Mengelola risiko keuangan', 'Menghindari bank', 'Menghapus pengeluaran', 'C'),
(17, 'Jika masyarakat memiliki literasi keuangan rendah, dampak yang paling mungkin terjadi adalah…', 'Stabilitas ekonomi meningkat', 'Konsumsi menurun', 'Pengambilan keputusan keuangan tidak tepat', 'Investasi meningkat', 'Pendapatan naik', 'C'),
(18, 'Seorang pelaku usaha memisahkan keuangan pribadi dan usaha serta membuat pencatatan rutin.\nTindakan tersebut mencerminkan…', 'Perilaku konsumtif', 'Literasi keuangan yang baik', 'Risiko tinggi', 'Ketergantungan kredit', 'Pengeluaran besar', 'B'),
(19, 'Literasi keuangan tidak hanya penting bagi individu, tetapi juga bagi negara karena…', 'Mengurangi jumlah bank', 'Meningkatkan stabilitas ekonomi', 'Menambah utang', 'Mengurangi investasi', 'Menghilangkan risiko', 'B'),
(20, 'Seorang siswa secara rutin menyisihkan uang sakunya untuk ditabung di bank setiap bulan. Ia menganggap bahwa menabung hanya bertujuan untuk menyimpan uang agar tidak cepat habis. Namun, tanpa disadari, dana yang ia simpan tersebut digabungkan dengan dana dari nasabah lain dan kemudian disalurkan oleh bank kepada pelaku usaha dalam bentuk kredit untuk mengembangkan bisnisnya.\nBerdasarkan ilustrasi tersebut, peran utama bank dalam kegiatan tersebut adalah sebagai…', 'Konsumen', 'Produsen', 'Perantara keuangan', 'Investor', 'Distributor', 'C'),
(21, 'Di suatu daerah, masyarakat cenderung menyimpan uang mereka di rumah karena kurang percaya terhadap bank. Akibatnya, jumlah dana yang dihimpun oleh bank menjadi sangat terbatas. Kondisi ini menyebabkan bank kesulitan dalam menyalurkan kredit kepada masyarakat yang membutuhkan modal usaha.\nBerdasarkan kondisi tersebut, dampak utama terhadap proses intermediasi keuangan adalah…', 'Intermediasi meningkat pesat', 'Tidak terjadi perubahan', 'Intermediasi keuangan menurun', 'Sistem keuangan semakin stabil', 'Penyaluran dana semakin cepat', 'C'),
(22, 'Sebelum menyalurkan dana dalam bentuk kredit, bank melakukan berbagai tahapan analisis, seperti menilai kemampuan pembayaran, kondisi usaha, serta risiko yang mungkin terjadi di masa depan. Proses ini sering kali membuat pencairan dana membutuhkan waktu yang cukup lama, tetapi tetap dilakukan secara konsisten.\nJika dilihat dari sudut pandang manajemen keuangan, tujuan utama dari proses tersebut adalah…', 'Memperlambat pelayanan kepada nasabah', 'Mengurangi keuntungan bank', 'Meminimalkan risiko kerugian', 'Membatasi jumlah nasabah', 'Mengurangi jumlah dana yang disalurkan', 'C'),
(23, 'Dalam sistem intermediasi keuangan, terdapat pihak-pihak yang terlibat secara tidak langsung dalam proses penyaluran dana. Misalnya, seseorang yang menyimpan uang di bank sebenarnya ikut berperan dalam menyediakan dana bagi pihak lain yang membutuhkan, meskipun tidak berinteraksi secara langsung.\nDalam konteks tersebut, pihak yang menyimpan dana di bank disebut sebagai…', 'Debitur', 'Kreditur', 'Investor', 'Konsumen', 'Produsen', 'B'),
(24, 'Ketika proses intermediasi keuangan berjalan dengan baik, dana yang sebelumnya mengendap dapat disalurkan kepada sektor produktif, seperti usaha kecil, industri, maupun investasi. Hal ini mendorong peningkatan produksi, pembukaan lapangan kerja, dan pertumbuhan ekonomi secara keseluruhan.\nBerdasarkan ilustrasi tersebut, dampak utama dari intermediasi keuangan yang efektif adalah…', 'Aktivitas ekonomi meningkat', 'Pengangguran meningkat', 'Produksi menurun', 'Konsumsi menurun', 'Kredit macet meningkat', 'A'),
(25, 'Dalam sistem keuangan, selain bank terdapat juga lembaga keuangan lain seperti perusahaan pembiayaan dan lembaga investasi. Lembaga-lembaga ini tidak menghimpun dana dalam bentuk tabungan secara langsung dari masyarakat, tetapi tetap berperan dalam menyalurkan dana ke sektor ekonomi.\nPerbedaan utama antara lembaga keuangan non-depositori dan bank adalah…', 'Tidak menyalurkan dana', 'Tidak menghimpun simpanan langsung dari masyarakat', 'Tidak memiliki peran ekonomi', 'Tidak beroperasi dalam sistem keuangan', 'Tidak memberikan layanan keuangan', 'B'),
(26, 'Dalam suatu kondisi ekonomi yang tidak stabil, muncul kekhawatiran di kalangan masyarakat mengenai keamanan dana yang disimpan di bank. Akibatnya, banyak nasabah secara bersamaan menarik uang mereka dalam jumlah besar dalam waktu singkat. Kondisi ini dapat mengganggu operasional bank dan memicu masalah yang lebih luas dalam sistem keuangan.\nFenomena tersebut dikenal dengan istilah…', 'Inflasi', 'Likuiditas', 'Bank run', 'Deflasi', 'Investasi', 'C'),
(27, 'Sistem perbankan sangat bergantung pada kepercayaan masyarakat. Tanpa adanya rasa percaya, masyarakat akan enggan menyimpan uang di bank dan lebih memilih menyimpan uang secara mandiri. Hal ini dapat mengganggu fungsi utama bank dalam menghimpun dan menyalurkan dana.\nBerdasarkan kondisi tersebut, stabilitas perbankan sangat penting karena menjadi dasar dari…', 'Produksi barang', 'Kepercayaan masyarakat', 'Konsumsi masyarakat', 'Pajak negara', 'Ekspor nasional', 'B'),
(28, 'Ketika satu bank mengalami masalah serius, seperti tidak mampu memenuhi kewajiban kepada nasabah, kondisi tersebut dapat memicu kepanikan yang menyebar ke bank lain. Masyarakat menjadi ragu terhadap sistem perbankan secara keseluruhan dan mulai menarik dananya secara besar-besaran.\nDampak paling luas dari kondisi tersebut adalah…', 'Harga barang menurun', 'Sistem keuangan terganggu', 'Pendapatan meningkat', 'Konsumsi meningkat', 'Investasi meningkat', 'B'),
(29, 'Sebuah bank mampu menyediakan dana tunai yang cukup untuk memenuhi kebutuhan penarikan nasabah kapan saja, serta tetap dapat menjalankan operasionalnya dengan lancar tanpa gangguan. Hal ini menunjukkan bahwa bank memiliki kondisi keuangan yang sehat.\nKondisi tersebut mencerminkan bahwa bank memiliki…', 'Risiko tinggi', 'Stabilitas yang baik', 'Kerugian besar', 'Kredit macet tinggi', 'Likuiditas rendah', 'B'),
(30, 'Dalam menjaga stabilitas sistem perbankan, pemerintah dan lembaga pengawas melakukan berbagai tindakan, seperti menetapkan aturan, mengawasi kegiatan bank, serta memberikan kebijakan ketika terjadi gangguan ekonomi. Tujuannya adalah agar bank tetap beroperasi dengan aman dan sesuai ketentuan.\nPeran utama pemerintah dalam konteks tersebut adalah…', 'Mengelola bank secara langsung', 'Mengawasi dan menetapkan kebijakan', 'Memberikan pinjaman kepada masyarakat', 'Menghapus sistem perbankan', 'Mengurangi jumlah transaksi', 'B'),
(31, 'Seiring perkembangan teknologi, bank dituntut untuk menyediakan layanan digital seperti mobile banking dan transaksi non-tunai. Bank yang mampu beradaptasi dengan perubahan ini tetap dapat memberikan layanan yang cepat, aman, dan efisien kepada nasabah.\nKemampuan tersebut menunjukkan bahwa bank memiliki…', 'Risiko yang tinggi', 'Stabilitas yang lemah', 'Stabilitas yang baik', 'Sistem yang tidak efisien', 'Layanan yang terbatas', 'C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi_teks` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `bab_id` int(11) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `judul`, `isi_teks`, `gambar`, `bab_id`, `video_url`) VALUES
(1, 'Perbankan (Bank Umum & BPR)', 'Apakah Anda pernah menabung di bank atau melihat penggunaan ATM dan mobile banking dalam kehidupan sehari-hari? Aktivitas tersebut menunjukkan bahwa bank memiliki peran penting dalam kehidupan masyarakat. Namun, tidak semua bank memiliki fungsi dan layanan yang sama.\n\nBank merupakan lembaga keuangan yang menghimpun dana dari masyarakat dalam bentuk simpanan, kemudian menyalurkannya kembali kepada masyarakat dalam bentuk kredit atau pembiayaan. Selain itu, bank juga menyediakan berbagai layanan jasa seperti transfer, pembayaran tagihan, penukaran uang, hingga layanan berbasis digital (mobile banking).\n\nBank juga memiliki fungsi strategis sebagai lembaga yang menjaga stabilitas sistem keuangan suatu negara. Kepercayaan masyarakat menjadi fondasi utama dalam sistem perbankan. Tanpa adanya bank, transaksi harus dilakukan secara tunai yang berisiko tinggi dan tidak efisien.', 'bank_service.png', 1, NULL),
(2, 'Bank Umum', 'Bank umum merupakan bank yang melaksanakan kegiatan usaha secara luas dan menyediakan berbagai layanan jasa dalam lalu lintas pembayaran. Bank ini melayani berbagai kebutuhan masyarakat, baik individu maupun badan usaha.\n\nBank umum memanfaatkan teknologi modern seperti ATM, mobile banking, internet banking, dan QR payment untuk mempermudah transaksi nasabah. Selain itu, bank umum juga memiliki jaringan yang luas, baik di dalam negeri maupun internasional.\n\nContoh nyata adalah Bank Rakyat Indonesia (BRI) melalui program Kredit Usaha Rakyat (KUR). Seorang pedagang kecil memanfaatkan KUR untuk menambah modal usaha sehingga dapat meningkatkan jumlah barang dagangan dan memperluas usahanya.', NULL, 2, NULL),
(3, 'Bank Perkreditan Rakyat (BPR)', 'Berbeda dengan bank umum, BPR menjalankan kegiatan usaha yang lebih terbatas, terutama karena tidak menyediakan jasa lalu lintas pembayaran seperti transfer antarbank. Fokus BPR adalah melayani masyarakat kecil dan pelaku usaha mikro di daerah pedesaan.\n\nBPR menghimpun dana dari masyarakat melalui tabungan dan deposito, kemudian menyalurkannya kembali dalam bentuk kredit berskala kecil. Proses pengajuan kredit di BPR cenderung lebih sederhana dan fleksibel.\n\nContoh: Seorang pedagang pasar tradisional memperoleh pinjaman dari BPR untuk menambah stok barang dagangan. Pendekatan personal BPR menciptakan hubungan yang erat antara bank dan nasabah.', NULL, 3, NULL),
(4, 'Kredit dan Risiko Kredit', 'Kredit merupakan pemberian dana oleh bank kepada nasabah yang wajib dikembalikan dalam jangka waktu tertentu disertai imbalan berupa bunga. Kredit bisa bersifat konsumtif (beli rumah/kendaraan) atau produktif (modal usaha).\n\nProses pemberian kredit meliputi:\n1. Permohonan (identitas & dokumen)\n2. Analisis kelayakan (5C: Character, Capacity, Capital, Collateral, Condition)\n3. Keputusan & Penandatanganan kontrak\n4. Penyaluran & Pemantauan.\n\nRisiko kredit adalah potensi kerugian jika nasabah tidak mampu membayar cicilan. Faktornya bisa internal (pengelolaan buruk) atau eksternal (kondisi ekonomi memburuk). Jika kredit macet tinggi, bank akan kesulitan menyalurkan dana ke masyarakat lain.', 'kpr.png', 4, NULL),
(5, 'Literasi Keuangan', 'Literasi keuangan adalah kemampuan seseorang dalam memahami, mengelola, serta mengambil keputusan yang tepat terkait keuangan. Ini mencakup pengaturan pemasukan, pengendalian pengeluaran, menyusun anggaran, dan merencanakan masa depan.\n\nPentingnya literasi keuangan:\n- Membantu menyusun perencanaan keuangan.\n- Membedakan antara kebutuhan dan keinginan.\n- Disiplin menabung dan berinvestasi.\n- Melindungi diri dari penipuan atau utang berlebihan.\n\nContoh buruk: Penggunaan paylater secara impulsif tanpa perencanaan yang matang dapat menimbulkan beban utang besar.', 'paylater.png', 5, NULL),
(6, 'Intermediasi & Stabilitas', 'Intermediasi keuangan adalah kegiatan menyalurkan dana dari pihak yang memiliki kelebihan dana (penabung) kepada pihak yang membutuhkan dana (peminjam) melalui bank.\n\nStabilitas perbankan adalah keadaan di mana sistem perbankan sehat dan mampu menjalankan fungsinya tanpa gangguan serius. Jika sistem tidak stabil, masyarakat akan kehilangan kepercayaan dan melakukan penarikan dana massal (rush).\n\nUpaya menjaga stabilitas:\n- Menerapkan prinsip kehati-hatian.\n- Menjaga likuiditas dana.\n- Pengawasan ketat oleh otoritas keuangan (OJK/BI).\n- Digitalisasi layanan yang aman.', NULL, 6, NULL),
(7, 'Apa itu Flutter?', 'Flutter adalah framework open-source dari Google untuk membangun aplikasi natively compiled dari satu codebase. Flutter menggunakan bahasa Dart dan dapat menargetkan mobile, web, dan desktop.', NULL, 1, NULL),
(8, 'Instalasi Flutter SDK', 'Untuk memulai, unduh Flutter SDK dari flutter.dev, ekstrak ke direktori pilihan Anda, tambahkan ke PATH, lalu jalankan flutter doctor untuk memverifikasi instalasi.', NULL, 1, NULL),
(9, 'Widget Stateless vs Stateful', 'StatelessWidget adalah widget tanpa state internal yang dapat berubah. StatefulWidget memiliki State yang dapat diperbarui dengan memanggil setState(), sehingga UI akan di-rebuild.', NULL, 2, NULL),
(10, 'Provider & setState', 'setState adalah cara paling sederhana untuk mengelola state lokal. Provider adalah solusi yang lebih scalable untuk state yang dibagi antar banyak widget.', NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `pdf_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `nama_lengkap`, `foto`, `telepon`, `alamat`) VALUES
(1, 'testuser', 'ardata245@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-21 14:33:26', 'Ardata User', 'profile_1_1776844531.jpeg', '+62 812 3456 7890', 'Mataram'),
(2, 'kiki', 'kiki@gmail.com', '$2y$10$X/s2a.texO6dlR3rYzB/6u6rwz/onIDsOXY03D9nGdavk3silkZCy', '2026-04-22 12:41:09', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_badge`
--

CREATE TABLE `user_badge` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `unlocked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `url_video` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `topik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `video`
--

INSERT INTO `video` (`id`, `judul`, `url_video`, `deskripsi`, `topik_id`) VALUES
(1, 'Literasi Keuangan', 'assets/videos/literasi_keuangan.mp4', 'Video ini membahas mengenai pentingnya literasi keuangan dalam kehidupan sehari-hari. Melalui contoh sederhana, video ini membantu kamu memahami cara mengelola keuangan dengan baik, seperti mengatur pengeluaran, menabung, dan membuat keputusan finansial yang bijak.', 1),
(2, 'Konsep Dasar Perbankan', 'assets/videos/konsep_dasar_perbankan.mp4', 'Video ini membahas mengenai konsep dasar perbankan, mulai dari pengertian bank, fungsi bank, hingga jenis-jenis bank yang ada. Melalui animasi yang menarik dan contoh dalam kehidupan sehari-hari, kamu dapat melihat bagaimana bank berperan dalam membantu masyarakat, seperti dalam kegiatan menabung, menyimpan uang, dan melakukan berbagai transaksi keuangan.', 1),
(3, 'Bank Perkreditan Rakyat', 'assets/videos/bank_perkreditan_rakyat.mp4', 'Video ini membahas mengenai pengenalan lembaga perbankan, khususnya Bank Perkreditan Rakyat (BPR) dan bank secara umum. Dalam video ditampilkan ilustrasi kehidupan sehari-hari masyarakat yang berhubungan dengan aktivitas perbankan, seperti menabung dan melakukan transaksi keuangan.', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `user_badge`
--
ALTER TABLE `user_badge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Indeks untuk tabel `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bab`
--
ALTER TABLE `bab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `badge`
--
ALTER TABLE `badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_badge`
--
ALTER TABLE `user_badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user_badge`
--
ALTER TABLE `user_badge`
  ADD CONSTRAINT `user_badge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_badge_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
