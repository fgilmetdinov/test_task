<?php
class Application_Model_ExchangeRatesCbr extends Application_Model_ExchangeRatesAbstract
{
    protected function getExchangeRatesData()
    {
        $result = array();
        $date = date('d/m/Y');
        $main = simplexml_load_file("http://www.cbr.ru/scripts/XML_daily.asp?date_req=$date");
        foreach ($main as $key => $v) {
            $value = str_replace(',', '.', (string)$v->Value);
            $result[] = array('code' => (string)$v->CharCode, 'name' => (string)$v->Name, 'value' => $value);
        }

        return $result;
    }
}