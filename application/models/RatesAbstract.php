<?php

abstract class Application_Model_RatesAbstract
{
    abstract protected function getRatesData();

    public function getRates()
    {
        $rawRates =  $this->getRatesData();

        //normalization data can be here

        return $rawRates;
    }
}