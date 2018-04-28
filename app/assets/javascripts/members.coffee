$( ->

  $('.mark-aff-link').on('click', (evt) ->
    memberRow = evt.target.closest('.member_row')
    $(memberRow).addClass('submitting')
  )

  $('.mark-aff-link').on('ajax:complete', (xhr, status) ->
    console.log 'Complete'
    console.log status
    console.log xhr

    memberRow = xhr.target.closest('.member_row')
    console.log memberRow

    $(memberRow).removeClass('submitting')
  )

)
