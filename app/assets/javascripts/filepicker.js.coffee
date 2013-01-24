$ ->
    $('.filepicker-btn').click ->
        filepicker.pick (file)->
            $('#filepicker_url_field').val(file.url)
            $('.user-img').attr('src', file.url+'/convert?w=115&h=115&fit=crop')
            $('.trip-img').attr('src', file.url+'/convert?w=215&h=180&fit=crop')