<?php
require_once 'db.php';

$action = isset($_GET['action']) ? $_GET['action'] : 'get';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $action === 'get') {
    try {
        // Kolom disesuaikan dengan kuis_soal_view.dart:
        // soal, opsi_a, opsi_b, opsi_c, opsi_d, opsi_e, jawaban_benar
        $query = "SELECT id, soal, opsi_a, opsi_b, opsi_c, opsi_d, opsi_e, jawaban_benar 
                  FROM kuis ORDER BY RAND() LIMIT 30";
        $stmt  = $conn->prepare($query);
        $stmt->execute();
        $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(["status" => "success", "data" => $questions]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
}
?>
