//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

/* rest of file omitted */

$(document).ready(function () {
  $('#city').one("focus", function() {
    $(this).val("");
  });
  $('#search').submit(function() {
    window.location = ('/' + $('#city').val().toLowerCase());
    return false;
  });
});
