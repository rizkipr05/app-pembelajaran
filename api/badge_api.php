<?php
require_once 'db.php';

$action = isset($_GET['action']) ? $_GET['action'] : 'get';
$user_id = isset($_GET['user_id']) ? (int)$_GET['user_id'] : 0;

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $action === 'get') {
    try {
        // Get all badges and mark which ones the user has unlocked
        $query = "SELECT b.id, b.nama, b.deskripsi, b.icon, b.warna,
                    CASE WHEN ub.badge_id IS NOT NULL THEN 1 ELSE 0 END AS unlocked
                  FROM badge b
                  LEFT JOIN user_badge ub ON b.id = ub.badge_id AND ub.user_id = :user_id
                  ORDER BY b.id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode(["status" => "success", "data" => $data]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
}
?>
