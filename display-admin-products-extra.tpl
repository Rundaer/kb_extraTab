

<div class="m-b-1 m-t-1">
  <h2>{l s='Custom Attribute from module' mod='hhproduct'}</h2>

  <fieldset class="form-group">

    {* Champ wysiwyg avec TinyMce *}
    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='my custom lang field wysiwyg' mod='hhproduct'}</label>
      <div class="translations tabbable">
        <div class="translationsFields tab-content bordered">
          {foreach from=$languages item=language }
          <div class="tab-pane translation-label-{$language.iso_code} {if $default_language == $language.id_lang}active{/if}">
            <textarea 
                name="field_ingredients_{$language.id_lang}" 
                class="autoload_rte"
                rows="10" cols="45"
            >
                {if isset({$field_ingredients[$language.id_lang]}) && {$field_ingredients[$language.id_lang]} != ''}
                    {$field_ingredients[$language.id_lang]}
                {/if}
            </textarea>
          </div>
          {/foreach}
        </div>
      </div>
    </div>

  </fieldset>

   <fieldset class="form-group">

    {* Champ wysiwyg avec TinyMce *}
    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='my custom lang field wysiwyg' mod='hhproduct'}</label>
      <div class="translations tabbable">
        <div class="translationsFields tab-content bordered">
          {foreach from=$languages item=language }
          <div class="tab-pane translation-label-{$language.iso_code} {if $default_language == $language.id_lang}active{/if}">
            <textarea 
                name="field_nutri_{$language.id_lang}" 
                class="autoload_rte"
                rows="10" cols="45"
            >
                {if isset({$field_nutri[$language.id_lang]}) && {$field_nutri[$language.id_lang]} != ''}
                    {$field_nutri[$language.id_lang]}
                {/if}
            </textarea>
          </div>
          {/foreach}
        </div>
      </div>
    </div>

  </fieldset>

  <div class="clearfix"></div>
</div>
{$field_ingredients}