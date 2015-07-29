<?php

class Application_Model_ListMapper
{
    protected $_dbTable;

    public function setDbTable($dbTable)
    {
        if (is_string($dbTable)) {
            $dbTable = new $dbTable();
        }
        if (!$dbTable instanceof Zend_Db_Table_Abstract) {
            throw new Exception('Invalid table data gateway provided');
        }
        $this->_dbTable = $dbTable;
        return $this;
    }

    public function getDbTable()
    {
        if ($this->_dbTable === null) {
            $this->setDbTable('Application_Model_DbTable_List');
        }
        return $this->_dbTable;
    }

    public function getByAllCodes($codes)
    {
        $entries = array();

        if ($codes == '')
            return  $entries;
        $arrCodes = explode(";", $codes);
        if (count($arrCodes) > 0) {
            unset($arrCodes[count($arrCodes)-1]);
        }

        $select = $this->getDbTable()->select();
        $select->order('name');
        $resultSet = $this->getDbTable()->fetchAll($select);

        foreach ($resultSet as $row) {
            $entry = new Application_Model_List();

            $entry->setCode($row->code)
                ->setName($row->name)
                ->setDate($row->date)
                ->setValue($row->value);
            if ($row->date != date('Y-m-d'))
                return array();
            else
                $entries[] = $entry->toArray();
        }
        return $entries;
    }

    public function saveList($result)
    {
        for ($i=0; $i < count($result); $i++) {
            $code = $result[$i]["code"];
            $data = array(
                'code'   => $result[$i]['code'],
                'value' => $result[$i]['value'],
                'name' => $result[$i]['name'],
                'date' => date('Y-m-d')
            );

            $row = $this->getDbTable()->find($code);
            if (count($row) == 0) {
                $this->getDbTable()->insert($data);
            } else {
                $this->getDbTable()->update($data, array('code = ?' => $code));
            }
        }
    }
 }

