/*!
 * jPushMenu.js
 * 1.1.1
 * @author: takien
 * http://takien.com
 * Original version (pure JS) is created by Mary Lou http://tympanus.net/
 */

(function($) {
    $.fn.jPushMenu = function(customOptions) {

        var o = $.extend({}, $.fn.jPushMenu.defaultOptions, customOptions);

        $('body').addClass(o.pushBodyClass);
        var target     = '',
            push_direction = '';
        if ($(this).is('.' + o.showBottomClass)) {
            target = '.cbp-spmenu-bottom';

        }
        $(this).addClass(o.activeClass);
        $(target).addClass(o.menuOpenClass);
        // Add class to toggler
        $(this).addClass('jPushMenuBtn');

        $(this).click(function(e) {
            e.stopPropagation();

            var target     = '',
            push_direction = '';

            // Determine menu and push direction
            if ($(this).is('.' + o.showLeftClass)) {
                target         = '.cbp-spmenu-left';
                push_direction = 'toright';

            }
            else if ($(this).is('.' + o.showRightClass)) {
                target         = '.cbp-spmenu-right';
                push_direction = 'toleft';
            }
            else if ($(this).is('.' + o.showTopClass)) {
                target = '.cbp-spmenu-top';
            }
            else if ($(this).is('.' + o.showBottomClass)) {
                target = '.cbp-spmenu-bottom';

            }

            if (target == '') {
                return;
            }

            $(this).addClass(o.activeClass);
            $(target).addClass(o.menuOpenClass);
            $(target + " .menu-close").removeClass('hidden');

            if ($(this).is('.' + o.pushBodyClass) && push_direction != '') {
                $('body').addClass(o.pushBodyClass + '-' + push_direction);
            }

            // Disable all other buttons
            $('.jPushMenuBtn').not($(this)).toggleClass('disabled');



            return;
        });

        var jPushMenu = {
            closeLeft: function (o) {
                $('.jPushMenuBtn,body,.cbp-spmenu-left').removeClass('disabled ' + o.activeClass + ' ' + o.menuOpenClass + ' ' + o.pushBodyClass + '-toleft ' + o.pushBodyClass + '-toright');
            },
            closeRight: function (o) {
                $('.jPushMenuBtn,body,.cbp-spmenu-right').removeClass('disabled ' + o.activeClass + ' ' + o.menuOpenClass + ' ' + o.pushBodyClass + '-toleft ' + o.pushBodyClass + '-toright');
            }
        }

        // Close menu on clicking outside menu
        if (o.closeOnClickOutside) {
            $('.cbp-spmenu-left .menu-close').click(function () {
                jPushMenu.closeLeft(o);
                $('.topspace a[id^="ui-id-"]').removeClass('sidemenu-menu-active-state');
                $(this).addClass('hidden');
            });
            $('.cbp-spmenu-right .menu-close').click(function () {
                jPushMenu.closeRight(o);
                $('.topspace a[id^="ui-id-"]').removeClass('sidemenu-menu-active-state');
                $(this).addClass('hidden');
            });
        }

        // Close menu on clicking menu link
        if (o.closeOnClickLink) {
            $('.icons').on('click',function() {
               jPushMenu.close(o);
            });
        }
    };

   /*
    * In case you want to customize class name,
    * do not directly edit here, use function parameter when call jPushMenu.
    */
    $.fn.jPushMenu.defaultOptions = {
        pushBodyClass      : 'push-body',
        showLeftClass      : 'menu-left',
        showRightClass     : 'menu-right',
        showTopClass       : 'menu-top',
        showBottomClass    : 'menu-bottom',
        activeClass        : 'menu-active',
        menuOpenClass      : 'menu-open',
        closeOnClickOutside: true,
        closeOnClickLink   : true
    };
})(jQuery);
