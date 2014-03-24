# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

url = "/search/tags_autocomplete/"
$("#tags-input").tagsinput confirmKeys: [13, 32, 44]
$("#tags-input").tagsinput("input").typeahead( name: "tags",
prefetch: { url: url, ttl: 120}
#,remote: url + "?search=%QUERY"
)
.bind "typeahead:selected", $.proxy((obj, datum) ->
  @tagsinput "add", datum.value
, $("#tags-input"))