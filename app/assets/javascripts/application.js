// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

console.log ("JS is loaded & running!!");
Turbolinks.enableProgressBar();


// $("#cardsDiv").sortable({
//     cancel: ".fixed"
// });
// $("#cardsDiv").disableSelection();

// Add methods for drag & drop
// $( ".cardsDiv" ).sortable({
//     connectWith: ".cardsDiv",
//     handle: ".panel-heading",
//     cancel: ".panel-toggle",
//     start: function (event, ui) {
//         ui.item.addClass('tilt');
//         tilt_direction(ui.item);
//     },
//     stop: function (event, ui) {
//         ui.item.removeClass("tilt");
//         $("html").unbind('mousemove', ui.item.data("move_handler"));
//         ui.item.removeData("move_handler");
//     }
// });
//
// function tilt_direction(item) {
//     var left_pos = item.position().left,
//         move_handler = function (e) {
//             if (e.pageX >= left_pos) {
//                 item.addClass("right");
//                 item.removeClass("left");
//             } else {
//                 item.addClass("left");
//                 item.removeClass("right");
//             }
//             left_pos = e.pageX;
//         };
//     $("html").bind("mousemove", move_handler);
//     item.data("move_handler", move_handler);
// }
//
// $( ".panel" )
//     .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
//     .find( ".panel-heading" )
//     .addClass( "ui-widget-header ui-corner-all" )
//     .prepend( "<span class='ui-icon ui-icon-minusthick panel-toggle'></span>");
//
// $( ".panel-toggle" ).click(function() {
//     var icon = $( this );
//     icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
//     icon.closest( ".panel" ).find( ".portlet-title" ).toggle();
// });
// End methods for drag & drop

// Card Flip
$('.cardsDiv').click(function(){
       $(this).find('.panel-heading').addClass('flipped').mouseleave(function(){
           $(this).removeClass('flipped');
       });
       return false;
   });
// End Card Flip
