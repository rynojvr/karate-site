# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(() ->

  $('select#club_province').on('change', (xhr) ->
    # selectedIndex = xhr.target.selectedIndex
    # selectedProvince = xhr.target.children[selectedIndex].value
    # setDistrictDropdown(selectedProvince)
    setDistrictDropdown()
  )
  setDistrictDropdown = () ->
    # selectedIndex = xhr.target.selectedIndex
    # selectedProvince = xhr.target.children[selectedIndex].value
    selectedProvince = $('#club_province').val()

    $('select[data-select-type="district"]').addClass('hidden')
    $('select[data-select-type="district"]').attr('name', '')
    $('select#districts-' + selectedProvince).removeClass('hidden')
    $('select#districts-' + selectedProvince).attr('name', 'club[district_id]')
  setDistrictDropdown()

)
