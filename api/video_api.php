<?php
require_once 'db.php';

$action = isset($_GET['action']) ? $_GET['action'] : 'get';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $action === 'get') {
    try {
        $query = "SELECT id, judul, url_video, deskripsi FROM video ORDER BY id";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode(["status" => "success", "data" => $data]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
}
?>
