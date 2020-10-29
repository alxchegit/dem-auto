<?php include_once $_SERVER['DOCUMENT_ROOT']."/php/db.php"; ?>
<?php include_once $_SERVER['DOCUMENT_ROOT']."/php/functions.php"; ?>
<?php $cat = isset($_GET['cat']) ? $_GET['cat'] : false; ?>  <!-- category url -->
<?php $id = isset($_GET['id']) ? $_GET['id'] : false; ?> <!-- category id -->
<?php $prod_id = isset($_GET['prod']) ? $_GET['prod'] : false; ?> <!-- product id -->
<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><?php echo $do->metaTitle($prod_id, $id);?></title>
	<meta name="description" content="<?php echo $do->metaDescription($prod_id, $id);?>">
	<link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/css/bootstrap.min.css">
	<!-- <link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/css/bootstrap.3.3.7.css"> -->
	<link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/css/style.css">
	<link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/css/admin-style.css">
</head>
<body>
