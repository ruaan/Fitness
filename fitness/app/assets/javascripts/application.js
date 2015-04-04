// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap.min
//= require bootstrap-notify
//= require jPushMenu
//= require jquery.purr
//= require best_in_place
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require jquery-ui-scrollable.min

//= require_tree .

$(document).ready(function ($) {

    $('.toggle-menu').jPushMenu();

    $('#tabs,#tabs2').tabs().addClass('ui-tabs-vertical ui-helper-clearfix');

    function removeSubMenuState() {
        $('.topspace a[id^="ui-id-"]').removeClass('sidemenu-menu-active-state');
    }

    $("label:contains('Subsection')").html("Add product to quote without sections");


    // change the visual state of the side menu items
    $('.topspace a[id^="ui-id-"]').click(function(){
        removeSubMenuState();
        $(this).addClass('sidemenu-menu-active-state');
    });
    // Search form.
    $('#products_search').submit(function () {
      $.get(this.action, $(this).serialize(), null, 'script');
        //$('#all').load(document.URL +  ' #all');
        $('#products').load(document.URL +  ' #products');
     return false;

    });
});

