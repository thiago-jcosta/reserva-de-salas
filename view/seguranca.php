<?php

session_start();

if(!isset($_SESSION['user_id'])){
	header("Location: login.php");
	exit;
}else{
	
	require_once("config.php");
}

?>