$ ->
  $('[data-behavior=add-player]').on
    'ajax:success': (xhr, data, status) ->
      target = $(@).data('target')
      $("[data-behavior=#{target}]").append(data)
      $(@).find('#player_name').val('')
