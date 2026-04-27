<?php
require_once 'db.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if ($action === 'register') {
        $nama     = isset($data['name']) ? trim($data['name']) : '';
        $email    = isset($data['email']) ? trim($data['email']) : '';
        $username = isset($data['username']) ? trim($data['username']) : explode('@', $email)[0];
        $password = isset($data['password']) ? password_hash($data['password'], PASSWORD_DEFAULT) : '';

        if (empty($nama) || empty($email) || empty($password)) {
            echo json_encode(["status" => "error", "message" => "Semua field wajib diisi"]);
            exit;
        }

        $query = "INSERT INTO users (nama_lengkap, email, username, password) VALUES (:nama, :email, :username, :password)";
        $stmt  = $conn->prepare($query);
        $stmt->bindParam(':nama', $nama);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);

        try {
            if ($stmt->execute()) {
                echo json_encode(["status" => "success", "message" => "Akun berhasil dibuat"]);
            } else {
                echo json_encode(["status" => "error", "message" => "Gagal membuat akun"]);
            }
        } catch (PDOException $e) {
            echo json_encode(["status" => "error", "message" => "Email atau username sudah terdaftar"]);
        }

    } elseif ($action === 'login') {
        $identifier = isset($data['email']) ? trim($data['email']) : '';
        $password   = isset($data['password']) ? $data['password'] : '';

        if (empty($identifier) || empty($password)) {
            echo json_encode(["status" => "error", "message" => "Email/username dan password wajib diisi"]);
            exit;
        }

        // Cari berdasarkan email ATAU username
        $query = "SELECT id, nama_lengkap, email, username, telepon, alamat, foto, password 
                  FROM users 
                  WHERE email = :identifier OR username = :identifier2 LIMIT 1";
        $stmt  = $conn->prepare($query);
        $stmt->bindParam(':identifier', $identifier);
        $stmt->bindParam(':identifier2', $identifier);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            unset($user['password']);
            // Alias nama_lengkap → name agar Flutter bisa baca
            $user['name'] = $user['nama_lengkap'];
            echo json_encode(["status" => "success", "message" => "Login berhasil", "user" => $user]);
        } else {
            echo json_encode(["status" => "error", "message" => "Email/username atau password salah"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Action tidak dikenal"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Method tidak diizinkan"]);
}
?>
