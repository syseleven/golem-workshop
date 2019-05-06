<?php

use \Slim\Http\Request;
use \Slim\Http\Response;

require __DIR__ . '/vendor/autoload.php';

$app = new \Slim\App();

$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write('<h1>Hello at ' . $_ENV['COMPANY_NAME'] . '</h1>');
    $response->getBody()->write('<h3>The current passcode is: ' . file_get_contents('/etc/web-application/passcode.txt') . '</h3>');
    return $response;
});
$app->get('/health', function (Request $request, Response $response) {
    return $response->withStatus(200);
});
$app->run();
