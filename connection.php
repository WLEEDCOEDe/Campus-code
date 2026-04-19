<?php
// هذا الملف يربط موقعنا بقاعدة البيانات
$conn = mysqli_connect(
    getenv('MYSQLHOST'),
    getenv('MYSQLUSER'),
    getenv('MYSQLPASSWORD'),
    getenv('MYSQLDATABASE'),
    getenv('MYSQLPORT')
);
if (!$conn) {
    die("يوجد مشكلة في الاتصال بقاعدة البيانات: " . mysqli_connect_error());
}
?>
