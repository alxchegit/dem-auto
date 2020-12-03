<?php 
	require $_SERVER['DOCUMENT_ROOT']."/php/db.php";
	require $_SERVER['DOCUMENT_ROOT']."/php/functions.php";

	require $_SERVER['DOCUMENT_ROOT']."/php/config.php";
	require $_SERVER['DOCUMENT_ROOT']."/php/config-local.php";

	$host 		= $config['db']['hostname'];
	$username 	= $config['db']['username'];
	$database 	= $config['db']['name'];
	$password 	= $config['db']['password'];

	$mydb = new Mydb();
	$mydb->connect($host, $username, $password, $database);

	$do = new Doing($mydb);