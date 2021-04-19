/* Source and licensing information for the line(s) below can be found at https://www.delmonte.com/themes/delmonte/dist/js/scripts.min.js. */
!function(a){function b(b){event.preventDefault(),a("html, body").animate({scrollTop:a(b).offset().top-100},1e3)}function c(a){var b=window.open("","my div","height=600,width=600");b.document.write("<html><head><title>Print</title>"),b.document.write('<link rel="stylesheet" href="/themes/delmonte/src/sass/print.css" type="text/css" />'),b.document.write("</head><body >"),b.document.body.innerHTML=document.getElementById(a).innerHTML,b.document.write("</body></html>")}function d(a,b,c){if(c){var d=new Date;d.setTime(d.getTime()+24*c*60*60*1e3);var e="; expires="+d.toGMTString()}else var e="";var f=document.domain;document.cookie=a+"="+b+e+"; path=/; domain="+f+";"}function e(a){for(var b=a+"=",c=document.cookie.split(";"),d=0;d<c.length;d++){for(var e=c[d];" "==e.charAt(0);)e=e.substring(1,e.length);if(0===e.indexOf(b))return e.substring(b.length,e.length)}return null}a(document).ready(function(){e("newsletter")||a(function(){setTimeout(function(){a("body").css({position:"fixed"}),a(".popup.newsletter-area.timed").addClass("opened"),a(".popup.newsletter-area.timed .each-popup-content").css({display:"block"})},3e4)}),a(".popup.newsletter-area.timed").click(function(){d("newsletter",!0,1),a(".each-popup-content").css({display:"none"}),a(".popup").removeClass("opened"),a("body").css({position:"initial"})}),a(".with-slick .slick-content").slick({fade:!0,cssEase:"linear",dots:!0,arrows:!1,infinite:!0,autoplay:!0}),a(".slick-small-2").slick({mobileFirst:!0,cssEase:"linear",dots:!0,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:992,settings:"unslick"},{breakpoint:768,settings:{slidesToShow:2,slidesToScroll:2}},{breakpoint:320,settings:{slidesToShow:1,slidesToScroll:1}}]});for(var f=1;f<=3;f++)a(".with-cans:nth-child("+f+") ul > div.slick").slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:992,settings:{slidesToShow:6,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:4,slidesToScroll:1}}]});a(".with-cans:nth-child(4) ul > div.slick").slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:992,settings:{slidesToShow:4,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:3,slidesToScroll:1}}]}),a('.productslider:not(".alternate-layout"):not(".with-view") > div').slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',asNavFor:".load-slick",responsive:[{breakpoint:992,settings:{slidesToShow:6,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:4,slidesToScroll:1}}]}),a('.productslider.with-view:not(".snacks"):not(".lp-sub-slick") .views-element-container').slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',asNavFor:".load-slick.top-cat-slide .views-element-container",autoplay:!0,autoplaySpeed:5e3,responsive:[{breakpoint:992,settings:{slidesToShow:6,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:4,slidesToScroll:1}}]}),a(".productslider.with-view.lp-sub-slick .views-element-container").slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',asNavFor:".load-slick.top-cat-slide .views-element-container",autoplay:!0,autoplaySpeed:5e3,responsive:[{breakpoint:992,settings:{slidesToShow:3,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:2,slidesToScroll:1}}]}),a(".productslider.with-view.snacks .views-element-container").slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',asNavFor:".load-slick.top-cat-slide .views-element-container",responsive:[{breakpoint:768,settings:{slidesToShow:4,slidesToScroll:1}}]}),a(".productslider.with-view .views-element-container article").on("click",function(){var b=a(this).attr("data-slick-index");a(".productslider.with-view .views-element-container").slick("slickGoTo",b)}),a(".productslider.alternate-layout > .slide-area").slick({mobileFirst:!0,cssEase:"linear",dots:!1,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:992,settings:{slidesToShow:6,slidesToScroll:1}},{breakpoint:768,settings:{slidesToShow:4,slidesToScroll:1}}]}),a(".load-slick:not(.top-cat-slide)").slick({slidesToScroll:1,slidesToShow:1,dots:!1,mobileFirst:!0,asNavFor:".productslider > div",responsive:[{breakpoint:767,settings:{fade:!0,arrows:!1}},{breakpoint:320,settings:{prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',fade:!1,arrows:!0}}]}),a(".load-slick.top-cat-slide .views-element-container").slick({slidesToScroll:1,slidesToShow:1,dots:!1,mobileFirst:!0,asNavFor:".productslider.with-view .views-element-container",responsive:[{breakpoint:767,settings:{fade:!0,arrows:!1}},{breakpoint:320,settings:{prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',fade:!1,arrows:!0}}]}),a(".full-view").on("click",function(){a(".list-view").removeClass("choice"),a(this).addClass("choice"),a(".load-slick.top-cat-slide .views-element-container").slick({slidesToScroll:1,slidesToShow:1,dots:!1,mobileFirst:!0,asNavFor:".productslider.with-view .views-element-container",responsive:[{breakpoint:767,settings:{fade:!0,arrows:!1}},{breakpoint:320,settings:{prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',fade:!1,arrows:!0}}]})}),a(".slick-try").slick({cssEase:"linear",prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',infinite:!0,mobileFirst:!0,responsive:[{breakpoint:767,settings:{slidesToScroll:1,slidesToShow:3,arrows:!0}},{breakpoint:320,settings:{slidesToScroll:1,slidesToShow:1,arrows:!1,dots:!0}}]}),a(".list-view").on("click",function(){a(".full-view").removeClass("choice"),a(this).addClass("choice"),a(".load-slick.top-cat-slide .views-element-container").slick("unslick")}),a(".search .close-search").on("click",function(){a(".search").toggleClass("toggled"),a(".search").hasClass("toggled")&&a('.search input[type="search"]').focus()}),a(".newsletter").on("click",function(){a("body").css({position:"fixed"}),a(".popup.newsletter-area:not(.timed)").addClass("opened"),a(".popup.newsletter-area .each-popup-content").css({display:"block"})}),a(".hamburger").on("click",function(){a("header.main").hasClass("activate")?(a("header.main").removeClass("activate"),setTimeout(function(){a("header.main nav").css({display:"none"})},100)):(a("header.main nav").css({display:"block"}),setTimeout(function(){a("header.main").addClass("activate")},100))}),a('.category h3:not(".inside")').on("click",function(){a(".toggle-area-filter").addClass("toggled")}),a(".category .close-filter-area").on("click",function(b){b.preventDefault(),a(".toggle-area-filter").removeClass("toggled")}),a(".timeline a").on("click",function(c){b(a(this).attr("href"))}),a(".faq-cat").on("click",function(){a(this).toggleClass("toggled"),a(this).next().slideToggle(300)}),a(".partners .toggle").on("click",function(){var b=a(this).attr("data-target");console.log(b),a('.each-popup-content[data-attr="'+b+'"]').css({display:"block"}),a('.each-popup-content[data-attr="'+b+'"]').parent().parent().addClass("opened")}),a(".close-popup").on("click",function(){a(".each-popup-content").css({display:"none"}),a(".popup").removeClass("opened"),a("body").css({position:"initial"})}),a(".toggle-trigger").on("click",function(){a(this).toggleClass("toggled"),a(this).next().slideToggle(300)}),a(".map-results").length>0&&a(".toggle-all").on("click",function(){var b=a(this).attr("data-target"),c=a(this).attr("data-attr");console.log(b),console.log(c),a(".toggle-all").removeClass("hidden-first"),a(this).addClass("hidden-first"),a("#"+b).slideToggle(),a("#"+c).slideToggle()}),a(".slick-full:not(.specialize)").slick({mobileFirst:!0,cssEase:"linear",dots:!0,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:768,settings:"unslick"},{breakpoint:320,settings:{slidesToShow:1,slidesToScroll:1}}]}),a(".slick-full.specialize").slick({mobileFirst:!0,cssEase:"linear",dots:!0,arrows:!0,infinite:!0,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:768,settings:{slidesToShow:2,slidesToScroll:2}},{breakpoint:320,settings:{slidesToShow:1,slidesToScroll:1}}]});var g=a(".recipe-slider article").length;1==g?a(".recipe-slider").addClass("only1"):2==g?a(".recipe-slider").slick({mobileFirst:!0,cssEase:"linear",slidesToScroll:1,slidesToShow:1,dots:!0,arrows:!0,autoplay:!0,autoplaySpeed:5e3,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:767,settings:{centerMode:!1}},{breakpoint:320,settings:{centerMode:!1}}]}):a(".recipe-slider").slick({mobileFirst:!0,cssEase:"linear",slidesToScroll:1,slidesToShow:1,dots:!0,arrows:!0,autoplay:!0,autoplaySpeed:5e3,prevArrow:'<div class="custom-prev"></div>',nextArrow:'<div class="custom-next"></div>',responsive:[{breakpoint:767,settings:{centerMode:!0}},{breakpoint:320,settings:{centerMode:!1}}]}),a(".print").on("click",function(){c("printarea")}),a(".with-slick .video").length,a(".js-form-item input").on("focus",function(){a(this).parent().find("label").addClass("move-me")}),a(".js-form-item textarea").on("focus",function(){a(this).parent().parent().find("label").addClass("move-me")}),"#newsletter"==window.location.hash&&a(".btn.newsletter").trigger("click")}),a(".all-collections").on("click",function(b){b.preventDefault(),a(this).toggleClass("toggled"),a(".hidden-colllections").slideToggle(300),console.log("clicked")}),a(window).resize(function(){a(".slick-full.flex-it").length>0&&a(".slick-full.flex-it").slick("resize"),a(".slick-small-2").length>0&&a(".slick-small-2").slick("resize"),a(".partners").length>0&&a(".partners").slick("resize")}),a(window).scroll(function(){var b=a(document).scrollTop();a(window).width()>=992&&(b>=1?a("body").addClass("scrolled"):a("body").removeClass("scrolled"))}),a("#coupon3").parent().parent().parent().parent().addClass("coupon_block"),a("#coupon3").parent().parent().parent().parent().parent().find("article:first").css("position","relative"),a("#coupon3").parent().parent().parent().parent().parent().find("article:first").addClass("coupon_block"),a("#coupon3").parent().parent().parent().parent().parent().find("article:first").append('<div style="position: absolute;top: 0px;left: 0px;height: 100%;width: 100%;z-index: 0;background: rgba(0,0,0,0.25);"></div>'),setTimeout(function(){a(".banner.large article:not(:first):not(.slick-slide)").addClass("padding_block")},300)}(jQuery);
//# sourceMappingURL=scripts.min.js.map
/* Source and licensing information for the above line(s) can be found at https://www.delmonte.com/themes/delmonte/dist/js/scripts.min.js. */