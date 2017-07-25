jQuery(document).ready(function($) {
    $(".fancybox").fancybox();
    $('.fancybox-media').fancybox({
        openEffect  : 'none',
        closeEffect : 'none',
        helpers : {
            media : {}
        }
    });
    $('.fancybox-url').fancybox({
        openEffect  : 'none',
        closeEffect : 'none',
        type: 'iframe',
        autoSize : false,
	minWidth: 970,
	minHeight: 600,
	maxWidth: 970,
	maxHeight: 600,
        beforeLoad : function() {
            this.width = parseInt($(window).width() - 200);
            this.height = parseInt($(window).height() - 80);
        }
    });
    //console.log('FancyBox is Loaded');
});