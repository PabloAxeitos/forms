<?php


include ("../vendor/acl/Core/src/Core/Controller/Helper/parseUrl.php");



define ("APPLICATION_PATH", "../modules/Application");
define ("VENDOR_PATH", "../vendor");

$request = parseUrl($_SERVER['REQUEST_URI']);

// echo "<pre>request: ";
// print_r($request);
// echo "</pre>";

// die("Fuck yeah!");

switch($request['controller'])
{
	case 'users':
		include ("../modules/Application/src/Application/Controller/users.php");
	break;

	case 'projects':
	break;

	case 'fuel':
	break;

	default:
		case 'index':
		include ("../modules/Application/src/Application/Controller/home.php");
	break;

	case 'home':
		include ("../modules/Application/src/Application/Controller/home.php");
	break;
}

