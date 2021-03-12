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
require_once('config.php');

/**
 * The site where you want to create the voucher(s)
 */
$time_create = $_REQUEST['time_create'];
$note = $_REQUEST['note'];
$site_id = 'default';

/**
 * initialize the UniFi API connection class and log in to the controller
 */
$unifi_connection = new UniFi_API\Client($controlleruser, $controllerpassword, $controllerurl, $site_id, $controllerversion);
$set_debug_mode   = $unifi_connection->set_debug($debug);
$loginresults     = $unifi_connection->login();

/**
 * we then fetch the newly created vouchers by the create_time returned
 */
$vouchers = $unifi_connection->stat_voucher($time_create);


/**
 * provide feedback (the newly created vouchers) in json format
 */
echo json_encode($vouchers, JSON_PRETTY_PRINT);
