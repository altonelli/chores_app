
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
    $('.main').attr('aria-hidden','true');

  });

  $('.modal-close').click(function(e){
    $('.main').attr('aria-hidden','false');

  });



});
