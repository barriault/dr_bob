$ = jQuery
$.fn.extend
  dynamicSelectable: ->
    $(@).each (i, el) ->
      new DynamicSelectable($(el))

class DynamicSelectable
  constructor: ($select) ->
    @init($select)

  init: ($select) ->
    @urlTemplate = $select.data('dynamicSelectableUrl')
    # console.log @urlTemplate
    @$targetSelect = $($select.data('dynamicSelectableTarget'))
    # console.log @$targetSelect
    # console.log $select.val()
    $select.on "change", =>
      @clearTarget()
      url = @constructUrl($select.val())
      # console.log url
      if url
        $.getJSON url, (data) =>
          # console.log data
          $.each data, (index, el) =>
            @$targetSelect.append "<option value='#{el.id}'>#{el.name}</option>"
            # reinitialize target select
          @reinitializeTarget()
      else
        @reinitializeTarget()

  reinitializeTarget: ->
    @$targetSelect.trigger("change")

  clearTarget: ->
    @$targetSelect.html('<option></option>')

  constructUrl: (id) ->
    # console.log id
    if id && id != ''
      @urlTemplate.replace(/:.+_id/, id)

jQuery ->
  $('input[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable()
  $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable()