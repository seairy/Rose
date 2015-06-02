$('img').bind('contextmenu', function(e) {
  return false;
});

$('img').on('dragstart', function(event) {
  event.preventDefault();
});