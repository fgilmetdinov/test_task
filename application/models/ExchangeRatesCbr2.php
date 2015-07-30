<?php
class Application_Model_ExchangeRatesCbr2 extends Application_Model_ExchangeRatesAbstract
{
    protected function getExchangeRatesData()
    {
        $result = array();
        $main = simplexml_load_file("http://www.cbr.ru/scripts/XML_daily.asp?date_req=" . date("d/m/Y"));
        foreach ($main as $key => $v) {
            $value = str_replace(',', '.', (string)$v->Value);
            $result[] = array("code" => (string)$v->NumCode, "name" => (string)$v->Name, "value" => $value);
        }

        return $result;
    }
}