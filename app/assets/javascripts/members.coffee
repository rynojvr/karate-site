$(() ->

  yesBadge = $('#affiliated-logo > span')
  notBadge = $('#not-affiliated-logo > span')

  $('.mark-aff-link').on('mouseup', () ->
    $(this).blur()
  )

  $('.mark-aff-link').on('click', (evt) ->
    row = $(evt.target.closest('.member_row'))
    disableRow(row, evt)
  )

  $('.mark-aff-link').on('ajax:complete', (xhr) ->
    origXhr = xhr.originalEvent.detail[0]
    status = xhr.originalEvent.detail[1]
    # setTimeout(() ->
    row = $(xhr.target.closest('.member_row'))
    enableRow(row, xhr)
    # , submission_disable_timeout)
  )

  $('.mark-aff-link').on('ajax:success', (evt) ->
    data = evt.originalEvent.detail[0]
    status = evt.originalEvent.detail[1]
    xhr = evt.originalEvent.detail[2]

    row_badge = $(evt.target.closest('.member_row')).find('.affiliation_badge')

    if data.is_affiliated
      row_badge.html(yesBadge.clone())
    else
      row_badge.html(notBadge.clone())

  )

  disableRow = (memberRow, evt) ->
    memberRow.addClass('submitting')
    memberRow.find('.item-action').addClass('disabled')

  enableRow = (memberRow, evt) ->
    $(memberRow).addClass('submitting-completed')
    memberRow.find('.item-action').removeClass('disabled')
    setTimeout(() ->
      memberRow.removeClass('submitting')
      memberRow.removeClass('submitting-completed')
    , 200)
)
