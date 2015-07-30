<?php

abstract class Application_Model_ExchangeRatesAbstract
{
    abstract protected function getExchangeRatesData();

    public function getExchangeRates()
    {
        $rawExchangeRates =  $this->getExchangeRatesData();

        //normalization data can be here

        return $rawExchangeRates;
    }
}