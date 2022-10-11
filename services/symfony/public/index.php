<?php

// Installation test
$setupTest = 2;

// Check PHP version
if ($setupTest == 1) {
    phpinfo();
    die;
}

// Test database connection
if ($setupTest == 2) {    
    $db_host        = '172.17.0.1';
    $db_user        = 'exagon_user';
    $db_pass        = 'An0thrS3crt';
    $db_database    = 'exagon_database'; 
    $db_port        = '4407';
    $mysqli = new \mysqli($db_host,$db_user,$db_pass,$db_database,$db_port);
    if ($mysqli -> connect_errno) {
        echo 'Failed to connect to MySQL: '.$mysqli -> connect_error;
        exit();
    }
    echo 'conection success!!';
    die;
}

use App\Kernel;

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};

