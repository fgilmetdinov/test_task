<?php
class Application_Model_Rates extends Application_Model_RatesAbstract
{
    protected function getRatesData() {
        $result = array();

        // current date
        $date = date('d/m/Y');
        $link = 'http://www.cbr.ru/scripts/XML_daily.asp?date_req=$date';
        //load html
        $fd = fopen($link, 'r');
        $text = "";
        if (!$fd) {
            //error
            throw new Exception('Error get rates from www.cbr.ru.');
        }
        else {
            // load to $text
            while (!feof($fd))
                $text .= fgets($fd, 4096);
        }
        // close descriptor
        fclose($fd);

        $pattern = "#<Valute ID=\"([^\"]+)[^>]+>[^>]+>([^<]+)[^>]+>[^>]+>[^>]+>[^>]+>[^>]+>[^>]+>([^<]+)[^>]+>[^>]+>([^<]+)#i";
        preg_match_all($pattern, $text, $out, PREG_SET_ORDER);

        foreach ($out as $cur) {
            $value = str_replace(',', '.', $cur[4]);
            $name = mb_convert_encoding($cur[3], 'utf-8', 'Windows-1251');
            $result[] = array('code' => $cur[2], 'name' => $name, 'value' => $value);
        }

        return $result;
    }
}