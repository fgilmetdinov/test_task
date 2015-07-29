<?php

class Application_Model_List
{
    protected $_code;
    protected $_name;
    protected $_value;
    protected $_date;

    public function __construct(array $options = null)
    {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid list property');
        }
        $this->$method($value);
    }

    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid list property');
        }
        return $this->$method();
    }

    public function setOptions(array $options)
    {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }

    public function setCode($code)
    {
        $this->_code = (string) $code;
        return $this;
    }

    public function getCode()
    {
        return $this->_code;
    }

    public function setName($name)
    {
        $this->_name = (string) $name;
        return $this;
    }

    public function getName()
    {
        return $this->_name;
    }

    public function setValue($value)
    {
        $this->_value = (string)$value;
        return $this;
    }

    public function getValue()
    {
        return $this->_value;
    }

    public function setDate($date)
    {
        $this->_date = (string)$date;
        return $this;
    }

    public function getDate()
    {
        return $this->_date;
    }

    public function toArray()
    {
        return array('code' => $this->getCode(), 'name' => $this->getName(), 'value' => $this->getValue(), 'date' => $this->getDate());
    }

    public function getList($codes)
    {
        $listMapper = new Application_Model_ListMapper();
        return $listMapper->getByAllCodes($codes);
    }

}

