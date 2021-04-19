<?php

include("PublisherApi.php");

function writeLog($api)
{
  $params = array(
        'date' => date("Y-m-d H:i:s"),
        'target_hash' => $api->getTargetHash(),
        'country_code' => $api->getCountryCode(),
        'name' => $api->getName(),
        'phone' => $api->getPhone(),
        'phone2' => $api->getPhone2(),
        'price' => 1830,
        'ip' => $api->getIp(),
        'user_agent' => empty($_SERVER['HTTP_USER_AGENT']) ? '' : $_SERVER['HTTP_USER_AGENT'],
        'data1' => $api->getData1(),
        'data2' => $api->getData2(),
        'data3' => $api->getData3(),
        'data4' => $api->getData4(),
        'clickid' => $api->getClickid(),
        'address' => $api->getAddress(),
        'success' => (int)in_array($api->getCurlInfo()['http_code'], array(200, 202, 422)),
        'custom' => is_array($_REQUEST['custom']) ? $_REQUEST['custom'] : array(),
    );

    @file_put_contents("", sprintf("%s\n", json_encode($params)), FILE_APPEND);
}

$api = new \Aff1\PublisherApi();

$api->setApiKey('SOg9ReWOvUq9p5gN');
$api->setTargetHash('P1PJpJQj');
$api->setCountryCode($_POST['country_code']);
$api->setPrice(1890);
if (isset($_GET["oleg-a154"])) {
    $api->setData1($_GET["oleg-a154"]);
}

$response = $api->makeOrderByRawRequest();

if (false) {
    writeLog($api);
}

$response = json_decode($response, true);

if ($response['status'] !== 'success') {
    die(var_dump($response));
}

header(
    'Location: success.html?'
    . http_build_query(array_merge($_GET, array('name'=> $_POST['client'], 'phone'=> $_POST['phone'])))
);
exit;
