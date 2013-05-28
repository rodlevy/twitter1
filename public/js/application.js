$(document).ready(function(event) {
  if ($('div.loading').text() === "Loading....") {
    var username = $('div.loading').data("username")
    $.get('/load_page/'+username, function(response) {
        $('div.loading').html(response);
    });
  };
});
