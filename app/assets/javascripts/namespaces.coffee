#= require includes/set_typehead
#= require includes/open_close_icon

$(document).ready ->
  $('#edit_namespace').on 'click', (event) ->
    set_typeahead('/teams/typeahead/%QUERY')

  $('#add_namespace_btn').unbind('click').on 'click', (event) ->
    # clear only when creating a new namespace
    if $('#new-namespace-form').length
      $('#namespace_team.typeahead').val('')
      $('#namespace_description').val('')
      $('#namespace_namespace').val('')

    $('#add_namespace_form').toggle 400, "swing", ->
      if $('#add_namespace_form').is(':visible')
        $('#add_namespace_btn i').addClass("fa-minus-circle")
        $('#add_namespace_btn i').removeClass("fa-plus-circle")
        $('#namespace_namespace').focus()
        layout_resizer()
      else
        $('#add_namespace_btn i').removeClass("fa-minus-circle")
        $('#add_namespace_btn i').addClass("fa-plus-circle")
        layout_resizer()
    set_typeahead('/namespaces/typeahead/%QUERY')

  $('body').on('click', '.btn-edit-role', (event) ->
    el = $(this).find('i.fa')
    if $(this).hasClass('button_namespace_description')
      open_close_icon(el)
      $('.description').toggle()
      $('#change_description_namespace_' + event.currentTarget.value).toggle()
  )
