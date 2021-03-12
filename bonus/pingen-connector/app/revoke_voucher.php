<?php
/**
 * PHP API usage example
 *
 * contributed by: Art of WiFi
 * description: example basic PHP script to create a set of vouchers, returns an array containing the newly created vouchers
 */

/**
 * using the composer autoloader
 */
require_once('vendor/autoload.php');

/**
 * include the config file (place your credentials etc. there if not already present)
 * see the config.template.php file for an example
 */
//require_once('config.php');

/**
 * minutes the voucher is valid after activation (expiration time)
 */
//$voucher_expiration = 1440;

/**
 * the number of vouchers to create
 */
$controlleruser = $_REQUEST['controlleruser'];
$controllerpassword = $_REQUEST['controllerpassword']; 
$controllerurl = $_REQUEST['controllerurl']; 
$site_id = $_REQUEST['site_id']; 
$controllerversion = $_REQUEST['controllerversion'];
$voucher_id = $_REQUEST['id']; 

if ($_REQUEST['debug'] == 'true')  $debug = true;
if ($_REQUEST['debug'] == 'false') $debug = false;
/**
 * initialize the UniFi API connection class and log in to the controller
 */
$unifi_connection = new UniFi_API\Client($controlleruser, $controllerpassword, $controllerurl, $site_id, $controllerversion);
$set_debug_mode   = $unifi_connection->set_debug($debug);
$loginresults     = $unifi_connection->login();

/**
 * then we create the required number of vouchers with the requested expiration value
 */
$voucher_result = $unifi_connection->revoke_voucher($voucher_id);

 
/**
 * provide feedback (the newly created vouchers) in json format
 */
//echo json_encode($vouchers, JSON_PRETTY_PRINT);
echo json_encode($voucher_result, JSON_PRETTY_PRINT);
