ready = ->
    $('input#song_title').on "keyup", ->
        $('input#song_url_alias').val( $.transliterate($(this).val()).toLowerCase() )

$(document).ready(ready)
$(document).on('page:load', ready)