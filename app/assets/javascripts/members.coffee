$(() ->

  yesBadge = $('#affiliated-logo > span')
  notBadge = $('#not-affiliated-logo > span')
  searchFields = [ {
      displayName: 'Name',
      fieldName: 'name'
    }, {
      displayName: 'Belt',
      fieldName: 'belt'
    },
    # {
      # displayName: 'Affiliated',
      # fieldName: 'affiliated'
    # } 
  ]

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
    row = $(xhr.target.closest('.member_row'))
    enableRow(row, xhr)
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

  $('#search-input').on('keyup', (evt) ->
    input = evt.target
    searchValue = input.value.toUpperCase()

    searchField = $('#current-search').attr('data-search-field')

    table = $('table')
    tableRows = table.find('tr.member_row')

    for row in tableRows
      row = $(row)
      do ->
        searchSelector = 'td[data-search-field="' + searchField + '"]'
        td = $(row.find(searchSelector))
        if td
          if td.text().toUpperCase().indexOf(searchValue) > -1
            row.removeClass('hidden')
          else
            row.addClass('hidden')
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

  switchSearchFilter = (evt) ->
    newSearchType = $(evt.target).attr('data-search-field')
    currentSearch = $('#current-search')

    for searchField in searchFields
      if searchField.fieldName == newSearchType
        currentSearch.attr('data-search-field', newSearchType)
        currentSearch.html(searchField.displayName)

    constructSearchFilter()
    searchInput = $('#search-input')
    searchInput.val('')
    searchInput.keyup()



  constructSearchFilter = () ->
    currentSearch = $('#current-search').attr('data-search-field')

    otherFieldsList = $('#other-fields')
    otherFieldsList.empty();

    for searchField in searchFields
      if searchField.fieldName == currentSearch
        continue
      searchFieldElement = $('
        <li>
          <a href="#"
            data-search-field="' + searchField.fieldName + '">
              ' + searchField.displayName + '
          </a>
        </li>
      ')
      otherFieldsList.append(searchFieldElement)

    $('#other-fields a').on('click', (evt) ->
      switchSearchFilter(evt)
    )
  constructSearchFilter()
)
