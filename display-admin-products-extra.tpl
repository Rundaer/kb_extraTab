

<div class="m-b-1 m-t-1">

  <h2>{l s='Extra values' mod='kb_extratabs'}</h2>
  <fieldset class="form-group">

    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='Ingredients' mod='kb_extratabs'}</label>
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

    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='Nutritional values' mod='kb_extratabs'}</label>
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

  <fieldset class="form-group">

    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='Storage and preparation' mod='kb_extratabs'}</label>
      <div class="translations tabbable">
        <div class="translationsFields tab-content bordered">
          {foreach from=$languages item=language }
          <div class="tab-pane translation-label-{$language.iso_code} {if $default_language == $language.id_lang}active{/if}">
            <textarea 
                name="field_storage_preparation_{$language.id_lang}" 
                class="autoload_rte"
                rows="10" cols="45"
            >
                {if isset({$field_storage_preparation[$language.id_lang]}) && {$field_storage_preparation[$language.id_lang]} != ''}
                    {$field_storage_preparation[$language.id_lang]}
                {/if}
            </textarea>
          </div>
          {/foreach}
        </div>
      </div>
    </div>

  </fieldset>

  <fieldset class="form-group">

    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='Package' mod='kb_extratabs'}</label>
      <div class="translations tabbable">
        <div class="translationsFields tab-content bordered">
          {foreach from=$languages item=language }
          <div class="tab-pane translation-label-{$language.iso_code} {if $default_language == $language.id_lang}active{/if}">
            <textarea 
                name="field_package_{$language.id_lang}" 
                class="autoload_rte"
                rows="10" cols="45"
            >
                {if isset({$field_package[$language.id_lang]}) && {$field_package[$language.id_lang]} != ''}
                    {$field_package[$language.id_lang]}
                {/if}
            </textarea>
          </div>
          {/foreach}
        </div>
      </div>
    </div>

  </fieldset>

  <fieldset class="form-group">

    <div class="col-lg-12 col-xl-12">
      <label class="form-control-label">{l s='Other' mod='kb_extratabs'}</label>
      <div class="translations tabbable">
        <div class="translationsFields tab-content bordered">
          {foreach from=$languages item=language }
          <div class="tab-pane translation-label-{$language.iso_code} {if $default_language == $language.id_lang}active{/if}">
            <textarea 
                name="field_other_{$language.id_lang}" 
                class="autoload_rte"
                rows="10" cols="45"
            >
                {if isset({$field_other[$language.id_lang]}) && {$field_other[$language.id_lang]} != ''}
                    {$field_other[$language.id_lang]}
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