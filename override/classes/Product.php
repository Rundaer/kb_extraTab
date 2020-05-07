<?php 

class Product extends ProductCore {

    public $field_ingredients;
    public $field_nutri;
 
    public function __construct($id_product = null, $full = false, $id_lang = null, $id_shop = null, \Context $context = null) {
        //Définition des nouveaux champs

        self::$definition['fields']['field_ingredients'] = [
            'type' => self::TYPE_HTML,
            'lang' => true,
            'required' => false,
        ];

        self::$definition['fields']['field_nutri'] = [
            'type' => self::TYPE_HTML,
            'lang' => true,
            'required' => false,
        ];

        parent::__construct($id_product, $full, $id_lang, $id_shop, $context);
    }
}