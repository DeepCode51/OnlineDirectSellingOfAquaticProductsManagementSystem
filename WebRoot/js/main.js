$(document).ready(function() {
    // SelectBox
    $('select').selectBox();
       
    // Cart
    $(function() {
	$('#cart_nav').hover(
            function(){
                var self = this;
                this.hoverAnimationTimeout = setTimeout(function () {
                    $(self).find('.cart_li').transition({ background: '#eb6445', color: '#fff', paddingRight: '10px'});
                    $(self).find('.cart_cont').fadeIn();
                    $(self).find('.view_cart').transition({ left: '0' });
                    $(self).find('.checkout').transition({ left: '0', delay: 200 });
                }, 200);
	    }, function(){
                clearTimeout(this.hoverAnimationTimeout);
                $(this).find('.cart_li').transition({ background: 'none', color: '#444', paddingRight: '0' });
                $(this).find('.cart_cont').fadeOut();
                $(this).find('.view_cart').transition({ left: '315px', delay: 400 });
                $(this).find('.checkout').transition({ left: '147px', delay: 400 });
	});
    });
    
    // Menu
    $('.parent').hover(function(){
        var self = this;
        this.hoverAnimationTimeout = setTimeout(function() {
            $(self).find('.sub').slideDown();
        }, 200);
     }, function(){
            clearTimeout(this.hoverAnimationTimeout);
            $(this).find('.sub').slideUp();
    });

    // Social
    $('.soc a').hover(function(){
        var self = this;
        this.hoverAnimationTimeout = setTimeout(function() {
            $(self).transition({ rotate: '360', x: 0 });
        }, 200);
     }, function(){
            clearTimeout(this.hoverAnimationTimeout);
            $(this).transition({ rotate: '0' });
    });

    // Carousel
    $(function() {
        $('#listing').carouFredSel({
            prev: '#prev_c1',
            next: '#next_c1',
            scroll: 1,
            auto: false
        });
        $('#list_banners').carouFredSel({
            prev: '#ban_next',
            next: '#ban_prev',
            pagination  : "#ban_pagination",
            scroll: 1,
            auto: false
        });
        $('#thumblist').carouFredSel({
	    prev: '#img_prev',
	    next: '#img_next',
            pagination  : '#pagination',
	    auto: false
	});
        $(window).resize();
    });
    
    // Zoomer
    $('.jqzoom').jqzoom({
	zoomType: 'standard',
	lens:true,
	preloadImages: true,
	alwaysOn:false
    });
    
    // Tabs
    $('#wrapper_tab a').click(function() {
	if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
	    $('#wrapper_tab').attr('class',$(this).attr('class'));
	}
        return false;
    });
    
    // Animations product
    $(function() {
	$(".article").hover(
            function(){
                var self = this;
                this.hoverAnimationTimeout = setTimeout(function () {
                    $(self).find(".price").transition({ left: 0, textAlign:'left'});
                    $(self).find(".bay").transition({ rotate: 360, opacity: 1, delay: 200 });
                    $(self).find(".obn").transition({ left: '110px', delay: 400 });
                    $(self).find(".like").transition({ left: '144px', delay: 500 });
                }, 280);
	    }, function(){
                clearTimeout(this.hoverAnimationTimeout);
                $(this).find(".like").transition({ left: '244px' });
                $(this).find(".obn").transition({ left: '220px' });
                $(this).find(".bay").transition({ rotate: 0, opacity: 0 });
                $(this).find(".price").transition({ left: '60px', textAlign:'center' });
	});
    });
    
    //Slider Home
    $(function(){
	$('#slider').anythingSlider({
	    enableArrows        : true,
	    buildStartStop      : false,
	    autoPlay            : true,
	    delay               : 4000,
	    pauseOnHover        : false,
            startPanel          : 1,
	})
	.anythingSliderFx({
    		'.slid_content h2' : [ 'caption-Left', '100' ],
		'.slid_content p' : [ 'caption-Left', '610px', '600' ],
		'.slid_content .buy_now' : [ 'caption-Left', '1220px', '1000' ]
	})
	
    });
   
});
