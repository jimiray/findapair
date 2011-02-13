$(document).ready(function () {
  $('#city').one("focus", function() {
    $(this).val("");
  });
  $('#search').submit(function() {
    window.location = ('/' + $('#city').val().toLowerCase());
    return false;
  });
});
