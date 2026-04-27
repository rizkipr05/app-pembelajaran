<?php
require_once 'db.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if ($action === 'update') {
        $id       = isset($data['id']) ? (int)$data['id'] : 0;
        $nama     = isset($data['name']) ? trim($data['name']) : '';
        $telepon  = isset($data['phone']) ? trim($data['phone']) : '';
        $alamat   = isset($data['address']) ? trim($data['address']) : '';

        if ($id === 0) {
            echo json_encode(["status" => "error", "message" => "User ID tidak valid"]);
            exit;
        }

        $query = "UPDATE users SET nama_lengkap = :nama, telepon = :telepon, alamat = :alamat WHERE id = :id";
        $stmt  = $conn->prepare($query);
        $stmt->bindParam(':nama', $nama);
        $stmt->bindParam(':telepon', $telepon);
        $stmt->bindParam(':alamat', $alamat);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Profil berhasil diperbarui"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Gagal memperbarui profil"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Action tidak dikenal"]);
    }

} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if ($action === 'get') {
        $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

        if ($id === 0) {
            echo json_encode(["status" => "error", "message" => "User ID tidak valid"]);
            exit;
        }

        $query = "SELECT id, nama_lengkap, email, username, telepon, alamat, foto FROM users WHERE id = :id LIMIT 1";
        $stmt  = $conn->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Add name alias for Flutter compatibility
            $user['name']    = $user['nama_lengkap'];
            $user['phone']   = $user['telepon'];
            $user['address'] = $user['alamat'];
            echo json_encode(["status" => "success", "user" => $user]);
        } else {
            echo json_encode(["status" => "error", "message" => "User tidak ditemukan"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Action tidak dikenal"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Method tidak diizinkan"]);
}
?>
