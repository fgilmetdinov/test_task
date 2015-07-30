<?php

class ApiController extends Zend_Controller_Action
{
    public function init()
    {
        header('Content-type: application/json; charset=utf-8');
        $this->_helper->viewRenderer->setNoRender(true);
    }

    //Action GetList
    public function getlistAction()
    {
        $request = clone $this->getRequest();
        $codes = $request->getParam('codes');

        $status = 0;
        $error = "";
        $result = array();

        try {
            //search from db
            $list = new Application_Model_ListMapper();
            $result = $list->getByAllCodes($codes);

            if (count($result) == 0) {
                //get data from service
                $rates = new Application_Model_ExchangeRatesCbr();
                $result = $rates->getExchangeRates();
                //save results to db
                $list->saveList($result);
            }
        }
        catch (Exception $e) {
            $status = 1;
            $error = $e->getMessage();
        }

        $data = array('status' => $status, 'error' => $error, 'data' => $result);

        echo Zend_Json::encode($data);
    }
}



