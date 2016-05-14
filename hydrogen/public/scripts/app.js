console.log ("JS is loaded & running!!");


$( ".item" ).sortable({
    connectWith: ".item",
    handle: ".animate-box-header",
    cancel: ".animate-box-toggle",
    start: function (event, ui) {
        ui.item.addClass('tilt');
        tilt_direction(ui.item);
    },
    stop: function (event, ui) {
        ui.item.removeClass("tilt");
        $("html").unbind('mousemove', ui.item.data("move_handler"));
        ui.item.removeData("move_handler");
    }
});

function tilt_direction(item) {
    var left_pos = item.position().left,
        move_handler = function (e) {
            if (e.pageX >= left_pos) {
                item.addClass("right");
                item.removeClass("left");
            } else {
                item.addClass("left");
                item.removeClass("right");
            }
            left_pos = e.pageX;
        };
    $("html").bind("mousemove", move_handler);
    item.data("move_handler", move_handler);
}

$( ".animate-box" )
    .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
    .find( ".animate-box-header" )
    .addClass( "ui-widget-header ui-corner-all" )
    .prepend( "<span class='ui-icon ui-icon-minusthick animate-box-toggle'></span>");

$( ".animate-box-toggle" ).click(function() {
    var icon = $( this );
    icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
    icon.closest( ".animate-box" ).find( ".animate-box-content" ).toggle();
});
