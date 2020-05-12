<?php
/**
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2020 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class Kb_extratabs extends Module
{

    public function __construct()
    {
        $this->name = 'kb_extratabs';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Konrad Babiarz';
        $this->need_instance = 0;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Extra Tabs');
        $this->description = $this->l('Extra tabs for product');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    protected function installDB()
    {
        $sql = array();

        $sql[] = "ALTER TABLE " . _DB_PREFIX_ . "product_lang "
                . "ADD field_ingredients text,"
                . "ADD field_nutri text,"
                . "ADD field_storage_preparation text,"
                . "ADD field_package text,"
                . "ADD field_other text";
        
        foreach ($sql as $query) {
            if (Db::getInstance()->execute($query) == false) {
                return false;
            }
        }
    }

    protected function uninstallDB()
    {
        $sql = array();

        $sql[] = "ALTER TABLE " . _DB_PREFIX_ . "product_lang "
                . "DROP field_ingredients,"
                . "DROP field_nutri,"
                . "DROP field_storage_preparation,"
                . "DROP field_package,"
                . "DROP field_other";
        
        foreach ($sql as $query) {
            if (Db::getInstance()->execute($query) == false) {
                return false;
            }
        }
    }
    
    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {

        $this->installDB();
        return parent::install() &&
            $this->registerHook('displayProductExtraContent') &&
            $this->registerHook('displayAdminProductsExtra');
    }

    public function uninstall()
    {
        $this->uninstallDB();
        return parent::uninstall();
    }


    public function hookDisplayAdminProductsExtra($params)
    {
        $product = new Product($params['id_product']);
        $languages = Language::getLanguages($active);
        $this->context->smarty->assign(array(
            'field_ingredients'         => $product->field_ingredients,
            'field_nutri'               => $product->field_nutri,
            'field_storage_preparation' => $product->field_storage_preparation,
            'field_package'             => $product->field_package,
            'field_other'               => $product->field_other,
            'languages'                 => $languages,
            'default_language'          => $this->context->employee->id_lang,
            )
        );

        return $this->display(__FILE__, 'display-admin-products-extra.tpl');
    }

    public function hookDisplayProductExtraContent($params)
    {

        $content = $params['product'];
        
        if($content->field_ingredients){
            $array[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setTitle($this->l('Ingredients'))
                ->setContent($content->field_ingredients);
        }
        
        if($content->field_nutri){
            $array[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setTitle($this->l('Nutritional values'))
                ->setContent($content->field_nutri);
        }

        if($content->field_storage_preparation){
            $array[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setTitle($this->l('Storage and preparation'))
                ->setContent($content->field_storage_preparation);

        }

        if($content->field_package){
            $array[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setTitle($this->l('Package'))
                ->setContent($content->field_package);

        }

        if($content->field_other){
            $array[] = (new PrestaShop\PrestaShop\Core\Product\ProductExtraContent())
                ->setTitle($this->l('Other'))
                ->setContent($content->field_other);

        }

        return $array;
    }
}
