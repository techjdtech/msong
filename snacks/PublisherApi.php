<?php

/**
 * This file is part of Aff1 package.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Aff1;

class PublisherApi
{
    /**
     * @var string
     */
    private $api_key = '{SOg9ReWOvUq9p5gN}';
    /**
     * @var string
     */
    private $target_hash = '{P1PJpJQj}';
    /**
     * @var string
     */
    private $country_code = '{PH}';
    /**
     * @var string|null
     */
    private $data1 = 'Oleg 11794';
    /**
     * @var string|null
     */
    private $data2 = 'Oleg';
    /**
     * @var string|null
     */
    private $data3;
    /**
     * @var string|null
     */
    private $data4;
    /**
     * @var string|null
     */
    private $clickid;
    /**
     * @var string
     */
    private $name;
    /**
     * @var string
     */
    private $phone;
    /**
     * @var string
     */
    private $phone2;
    /**
     * @var string
     */
    private $address;
    /**
     * @var float|null
     */
    private $price;
    /**
     * @var string
     */
    private $log_file_path = '';
    /**
     * @var bool
     */
    private $enable_write_log = false;
    /**
     * @var array
     */
    private $curl_info = array();

    /**
     * Make new API lead.
     *
     * @param string $name
     * @param string $phone
     * @param string $phone2
     * @return mixed
     * @throws \Exception
     */
    public function makeOrder($name, $phone, $phone2 = '')
    {
        $this->setName($name);
        $this->setPhone($phone);
        $this->setPhone2($phone2);

        $ch = $this->getCh();

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($this->getRequestParams()));

        $response = curl_exec($ch);
        $this->curl_info = curl_getinfo($ch);
        curl_close($ch);

        if ($this->enable_write_log) {
            $this->writeLog();
        }

        return $response;
    }

    public function makeOrderByRawRequest()
    {
        if (isset($_REQUEST['address'])) {
            $this->setAddress($_REQUEST['address']);
        }

        $phone2 = isset($_REQUEST['phone2']) ? $_REQUEST['phone2'] : '';

        return $this->makeOrder($_REQUEST['client'], $_REQUEST['phone'], $phone2);
    }

    private function getCh()
    {
        if (!extension_loaded('curl')) {
            throw new \Exception('cURL extension not found');
        }

        return curl_init('https://api.aff1.com/v2/lead.create');
    }

    private function getRequestParams()
    {
        $this->validateRequiredParameters();

        return array(
            'api_key' => $this->getApiKey(),
            'target_hash' => $this->getTargetHash(),
            'country_code' => $this->getCountryCode(),
            'name' => $this->getName(),
            'phone' => $this->getPhone(),
            'phone2' => $this->getPhone2(),
            'ip' => $this->getIp(),
            'user_agent' => empty($_SERVER['HTTP_USER_AGENT']) ? '' : $_SERVER['HTTP_USER_AGENT'],
            'referer' => empty($_SERVER['HTTP_REFERER']) ? '' : $_SERVER['HTTP_REFERER'],
            'accept_language' => empty($_SERVER['HTTP_ACCEPT_LANGUAGE']) ? '' : $_SERVER['HTTP_ACCEPT_LANGUAGE'],
            'data1' => $this->getData1(),
            'data2' => $this->getData2(),
            'data3' => $this->getData3(),
            'data4' => $this->getData4(),
            'clickid' => $this->getClickid(),
            'address' => $this->getAddress(),
            'price' => $this->getPrice(),
            'custom' => isset($_REQUEST['custom']) && is_array($_REQUEST['custom']) ? $_REQUEST['custom'] : array(),
        );
    }

    private function validateRequiredParameters()
    {
        if ($this->getApiKey() === '{YOUR_API_KEY}') {
            die('Parameter API_KEY is not set.');
        }

        if ($this->getTargetHash() === '{TARGET_HASH}') {
            die('Parameter TARGET_HASH is not set.');
        }

        if ($this->getCountryCode() === '{COUNTRY_CODE}') {
            die('Parameter COUNTRY_CODE is not set.');
        }
    }

    public function getData1()
    {
        return is_null($this->data1) ? '' : $this->data1;
    }

    public function setData1($data1)
    {
        $this->data1 = $data1;
    }

    public function getData2()
    {
        return is_null($this->data2) ? '' : $this->data2;
    }

    public function setData2($data2)
    {
        $this->data2 = $data2;
    }

    public function getData3()
    {
        return is_null($this->data3) ? '' : $this->data3;
    }

    public function setData3($data3)
    {
        $this->data3 = $data3;
    }

    public function getData4()
    {
        return is_null($this->data4) ? '' : $this->data4;
    }

    public function setData4($data4)
    {
        $this->data4 = $data4;
    }

    public function getClickid()
    {
        return is_null($this->clickid) ? '' : $this->clickid;
    }

    public function setClickid($clickid)
    {
        $this->clickid = $clickid;
    }

    public function getIp()
    {
        if ($this->issetXForwarderForIp() && $this->isValidXForwarderForIp()) {
            return $this->getXForwarderForIp();
        }

        if (isset($_SERVER['HTTP_CLIENTIP']) && !empty($_SERVER['HTTP_CLIENTIP'])) {
            return $_SERVER['HTTP_CLIENTIP'];
        }

        if (isset($_SERVER['REMOTE_ADDR']) && !empty($_SERVER['REMOTE_ADDR'])) {
            return $_SERVER['REMOTE_ADDR'];
        }

        return '';
    }

    public function issetXForwarderForIp()
    {
        return isset($_SERVER['HTTP_X_FORWARDED_FOR']) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']);
    }

    public function isValidXForwarderForIp()
    {
        return ip2long($this->parseXForwardedForIp()) !== false;
    }

    public function getXForwarderForIp()
    {
        if ($this->xForwardedForHasSeveralIps()) {
            return $this->parseXForwardedForIp();
        }

        return $_SERVER['HTTP_X_FORWARDED_FOR'];
    }

    private function xForwardedForHasSeveralIps()
    {
        return count($this->getXForwarderForIps()) > 0;
    }

    private function parseXForwardedForIp()
    {
        $ips = $this->getXForwarderForIps();
        $user_ip = reset($ips);

        return $user_ip;
    }

    private function getXForwarderForIps()
    {
        return explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
    }

    public function getTargetHash()
    {
        return $this->target_hash;
    }

    public function setTargetHash($target_hash)
    {
        $this->target_hash = $target_hash;
    }

    public function getApiKey()
    {
        return $this->api_key;
    }

    public function setApiKey($api_key)
    {
        $this->api_key = $api_key;
    }

    public function getCountryCode()
    {
        return $this->country_code;
    }

    public function setCountryCode($country_code)
    {
        $this->country_code = $country_code;
    }

    public function getPhone()
    {
        return $this->phone;
    }

    public function setPhone($phone)
    {
        $this->phone = $phone;
    }

    public function getPhone2()
    {
        return is_null($this->phone2) ? '' : $this->phone2;
    }

    public function setPhone2($phone2)
    {
        $this->phone2 = $phone2;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function enableWriteLog($enable = false, $log_file_path = '')
    {
        $this->enable_write_log = $enable;
        $this->log_file_path = $log_file_path;

        return $this;
    }

    /**
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * @param string $address
     */
    public function setAddress($address)
    {
        $this->address = $address;
    }

    /**
     * @return float|null
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param float $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    private function writeLog()
    {
        @file_put_contents(
            $this->log_file_path,
            sprintf("[%s] %s\n", date("Y-m-d H:i:s"), http_build_query($this->getRequestParams())),
            FILE_APPEND
        );
    }

    public function getCurlInfo()
    {
        return $this->curl_info;
    }
}
