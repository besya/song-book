ready = ->
    $('input#artist_title').on "keyup", ->
        $('input#artist_url_alias').val( $.transliterate($(this).val()).toLowerCase() )

$(document).ready(ready)
$(document).on('page:load', ready)