function pageLoad() {
}
(function ($) {
    $(window).load(function () {
    });
    $(function () {
        myfunload();
        mypageload();
        toggleChevron(e);
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobile"));
    $("#menuMobile input").remove();
    $("#menuMobile > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    //$("#menuMobile li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu li:last-child").addClass("last");
    $("#menu li:first-child").addClass("fisrt");
    $("#menu > li > a").append('<span class="arrow-down"></span>');
    jQuery('#menu').superfish({
        animation: { height: 'show' },
        delay: 200
    });

    $(".aside-desktop").clone().appendTo($(".asidemobi"));
    $(".menu-level").menulevel({
        csscurrent: "active",
        cssicon: true,
        cssdown: "fa fa-caret-down",
        cssup: "fa fa-caret-up"
    });
    $(".menu-level li:last-child").addClass("last");
    $(".menu-level .active").find("ul:first").show();
    $('#sliderBanner').slick({
        autoplay: true,
        autoplaySpeed: 5000,
        pauseOnHover: false,
        dots: true,
        infinite: true,
        speed: 1000,
        fade: true,
        cssEase: 'linear'
    });
    $('#sliderAds').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: false,
        dots: false,
        arrows: false,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
    });
    if ($('#silderProduct').size() == 1) {
        var silderProduct = $('#silderProduct').imagesLoaded(function () {
            silderProduct.slick({
                autoplay: true,
                autoplaySpeed: 3000,
                //cssEase: 'linear',
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 4,
                slidesToScroll: 1,
                prevArrow: $(".control-slider .prev"),
                nextArrow: $(".control-slider .next"),
                responsive: [
                  {
                      breakpoint: 1200,
                      settings: {
                          slidesToShow: 4
                      }
                  },
                  {
                      breakpoint: 1199,
                      settings: {
                          slidesToShow: 3
                      }
                  },
                  {
                      breakpoint: 639,
                      settings: {
                          slidesToShow: 2
                      }
                  }
                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                ]
            });
            sliderParent.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
        });
    }
   
    if ($("#sliderDetails").size() == 1) {
        var bigimg = $(".small-img:first").attr("href");
        var smallimg = $(".small-img:first").attr("data-img");
        $(".cloud-zoom").attr("href", bigimg).find("img:first").attr("src", smallimg);
        jQuery('.cloud-zoom').CloudZoom();

        $('#sliderDetails .slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            infinite: false,
            fade: true,
            asNavFor: '#sliderDetails .slider-nav'
        });
        $('#sliderDetails .slider-nav').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            asNavFor: '#sliderDetails .slider-for',
            dots: false,
            infinite: false,
            //centerMode: true,
            focusOnSelect: true
        });
        $('#sliderDetails .slider-nav').on('beforeChange', function (event, slick, currentSlide, nextSlide) {
            var bigimg = $("#sliderDetails .slider-nav .slick-slide:eq(" + nextSlide + ") .small-img").attr("href");
            var smallimg = $("#sliderDetails .slider-nav .slick-slide:eq(" + nextSlide + ") .small-img").attr("data-img");
            $(".cloud-zoom").attr("href", bigimg).find("img:first").attr("src", smallimg);
            jQuery('.cloud-zoom').CloudZoom();
        });
    }
    if ($('.rownone').size() > 0) {
        var producttbnone = $('.rownone').imagesLoaded(function () {
            producttbnone.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
        });
    }
    if ($('#silderProduct').size() == 1)
        var silderProduct = $('#silderProduct').imagesLoaded(function () {
            silderProduct.slick({
                autoplay: true,
                autoplaySpeed: 3000,
                //cssEase: 'linear',
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 6,
                slidesToScroll: 1,
                //prevArrow: $(".control-slider .prev"),
                //nextArrow: $(".control-slider .next"),
                arrow: true,
                responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                            slidesToShow:5
                        }
                    },
                  {
                      breakpoint: 1000,
                      settings: {
                          slidesToShow: 4
                      }
                  },
                  {
                      breakpoint: 650,
                      settings: {
                          slidesToShow: 3
                      }
                  },

                  {
                      breakpoint: 510,
                      settings: {
                          slidesToShow: 2
                      }
                  },
                  {
                      breakpoint: 370,
                      settings: {
                          slidesToShow: 1
                      }
                  }

                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                ]
            });
        });

    if ($('.list-pro').size() > 0) {
        var newstb = $('.list-pro').imagesLoaded(function () {
            newstb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(myclear);
            myclear = setTimeout(function () {
                newstb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }

    $('.panel-heading a[data-toggle="collapse"]').click(function () {
        $('.panel-heading').removeClass('actives');
        $(this).toggleClass("current").parents('.panel-heading').addClass('actives');
        $('.panel-heading').each(function () {
            if (!$(this).hasClass("actives")) {
                $(this).find('a[data-toggle="collapse"]').removeClass("current");
            }
        });
    });
}
/*=========================================================================*/
function mypageload() {
    $(".select").uniform();
    $(".fullbox-img").bgsizebox({
        fimg: true,
        imgcss: "hideo",
        attrname: "data-src"
    });
    myListTb();
}
/*==========================*/
function toggleChevron(e) {
    $(e.target)
        .prev('.panel-heading')
        .find("i.indicator")
        .toggleClass('hinh1 hinh2');
}
$('#accordion').on('hidden.bs.collapse', toggleChevron);
$('#accordion').on('shown.bs.collapse', toggleChevron);
/*========================================================================*/
function myListTb() {
    if ($('.isotopelist').size() > 0) {
        var isolist = $('.isotopelist').imagesLoaded(function () {
            isolist.isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        });
    }
    if ($('.product-tb').size() > 0) {
        var tbpro;
        var producttb = $('.product-tb').imagesLoaded(function () {
            producttb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbpro);
            tbpro = setTimeout(function () {
                producttb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
}
/*===============================*/

//==================
