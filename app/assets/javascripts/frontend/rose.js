// $('img').bind('contextmenu', function(e) {
//   return false;
// });

// $('img').on('dragstart', function(event) {
//   event.preventDefault();
// });

$(document).ready(function() {
  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "positionClass": "toast-top-right",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "500",
    "timeOut": "2500",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
});