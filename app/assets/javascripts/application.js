
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .

console.log ("JS is loaded & running!!");
Turbolinks.enableProgressBar();

$(document).ready(function(){

  $('.modal-btn').click(function(e){
    console.log("modal btn pushed");
    $('.main').attr('aria-hidden','true');
    var modalTarget = $(this).attr('data-target');
    $(e.target).closest('.app').siblings(modalTarget).attr('aria-hidden','false');
    $(e.target).closest('.modal-header').focus();
  });

  $('.modal-close').click(function(e){
    $('.main').attr('aria-hidden','false');

  });



});
