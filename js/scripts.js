(function($) {
  'use strict';
  jQuery(document).ready(function() {

    //Collapse navigation on click (Bootstrap 3 is missing it)
    $('.nav a').on('click', function() {
      $('#my-nav').removeClass('in').addClass('collapse');
    });

    // Minify the Nav Bar
    $(document).scroll(function() {
      var position = $(document).scrollTop();
      var headerHeight = $('#header').outerHeight();
      if (position >= headerHeight - 100) {
        $('.navbar').addClass('minified');
      } else {
        $('.navbar').removeClass('minified');
      }


      // Parallax effect on #Header
      $(".banner .container").css({
        'opacity': (1 - position / 500)
      });


      // Show "Back to Top" button
      if (position >= headerHeight - 100) {
        $('.scrolltotop').addClass('show-to-top');
      } else {
        $('.scrolltotop').removeClass('show-to-top');
      }

    });


    // Nice scroll to DIVs
    $('.navbar-nav li a').click(function(evt) {
      var place = $(this).attr('href');
      $('html, body').animate({
        scrollTop: $(place).offset().top
      }, 1200, 'easeInOutCubic');
      pde(evt);
    });


    // Scroll down from Header
    $('#header p a').click(function(evt) {
      var place = $(this).attr('href');
      $('html, body').animate({
        scrollTop: $(place).offset().top
      }, 1200, 'easeInOutCubic');
      pde(evt);
    });


    // Scroll on Top
    $('.scrolltotop, .navbar-brand').click(function(evt) {
      $('html, body').animate({
        scrollTop: '0'
      }, 1200, 'easeInOutCubic');
      pde(evt);
    });



    //mesonary service block
    var container = document.querySelector('#our-service-container');
    var msnry = new Masonry(container, {
      // options
      itemSelector: '.our-service'
    });


    //time line scrollbar
    $('#default').perfectScrollbar({
      wheelPropagation: true
    });

    //Count numbers
    (function(g) {
      g.fn.countUp = function(k) {
        var m = parseInt(g(this).text(), 10),
          l, o = g(this);

        function n() {
          m++;
          o.text(m.toString());
          l = setTimeout(n, k)
        }
        l = setTimeout(n, k)
      };
      g(document).ready(function() {
        g("#hours").countUp(3000);
        g("#twitter-follo").countUp(1500);
        g("#psd").countUp(2000);
      });
    })(jQuery);

    // Portfolio filterable grid
    jQuery('#portfolio-grid').mixitup({
      targetSelector: '.portfolio-mix',
    });

    //client slider
    $("#clients-slider").flexisel({
      visibleItems: 5,
      enableResponsiveBreakpoints: true, //responsive layout
      autoPlay: true, //auto play
      clone: true,
      responsiveBreakpoints: {
        portrait: {
          changePoint: 480, //resolution change point
          visibleItems: 1 //visible item
        },
        landscape: {
          changePoint: 640, //resolution change point
          visibleItems: 3 //visible item
        },
        tablet: {
          changePoint: 768, //resolution change point
          visibleItems: 3 //visible item
        }
      }
    });


    // Testimonial slider
    jQuery(function() {
      jQuery('#da-slider').cslider({
        bgincrement: 0
      });
    });

    //show hide portfolio category
    $('#showhidetarget').hide();
    $('a#showhidetrigger').click(function() {
      $('#showhidetarget').toggle(400);
    });

    //Twitter feed
    jQuery(function() {
      jQuery('#tweets').tweetable({
        username: 'envato', //twitter username
        time: true,
        rotate: true,
        speed: 7000,
        limit: 5,
        replies: true,
        position: 'append',
        failed: "Sorry, twitter is currently unavailable for this user.",
        loading: "Loading tweets...",
        html5: true,
        onComplete: function($ul) {
          $('time').timeago();
        }
      });
    });

    //Function to prevent Default Events
    function pde(e) {
      if (e.preventDefault)
        e.preventDefault();
      else
        e.returnValue = false;
    }

  });

  //Window load function
  $(window).load(function() {
    //preloader
    $("#status").fadeOut();
    $("#preloader").delay(350).fadeOut("slow");

    // Animate the header components
    $(window).load(function() {
      jQuery('#header-photo').delay(100).animate({
        opacity: '1',
        'margin-top': '0'
      }, 1000, 'easeInOutCubic', function() {
        jQuery('#header h1').delay(-200).animate({
          opacity: '1',
          'padding-top': '0'
        }, 600, 'easeInOutCubic', function() {
          jQuery('#header p').animate({
            opacity: '1'
          }, 400, 'easeInOutCubic');
        });
      });
    });

    //process slider
    $("#process-slider").flexslider({
      controlsContainer: "#process-steps",
      directionNav: !1,
      manualControls: "#process-steps .icon",
      pauseOnAction: !0,
      slideshow: !1,
      useCSS: !1
    })
  });


  //banner list ticker
  $(document).ready(function() {
    $("ul#aboutme").list_ticker({
      speed: 5000,
      effect: "fade"
    })
  });
  (function($) {
    $.fn.list_ticker = function(options) {
      var defaults = {
        speed: 5000,
        effect: "fade"
      };
      var options = $.extend(defaults, options);
      return this.each(function() {
        var obj = $(this);
        var list = obj.children();
        list.not(":first").hide();
        setInterval(function() {
          list = obj.children();
          list.not(":first").hide();
          var first_li = list.eq(0);
          var second_li = list.eq(1);
          if (options.effect == "fade") first_li.fadeOut(function() {
            second_li.fadeIn();
            first_li.remove().appendTo(obj)
          })
        }, options.speed)
      })
    }
  })(jQuery);
  //end

  //header Parallax image
  (function($) {
    var Picture = (function() {
      var parent = {};
      var _window, _picture;
      parent.init = function() {
        _window = $(window);
        _picture = $(".picture");
        parent.delegate();
      }
      parent.delegate = function() {
        _window.on("scroll", parent.scrollPos);
        _window.on("resize", parent.scrollPos);
      }
      parent.scrollPos = function() {
        if ($(window).width() > 754) {
          var scroll = Math.max(0, _window.scrollTop() - 200);
          scroll = Math.min(1, scroll / ($(window).height() - 200));
          scroll = 1 - scroll;
          _picture.css({
            backgroundPosition: "50% " + (scroll * 100) + "%"
          });
        } else {
          _picture.css("background-position", "");
        }
      }
      return parent;
    })();
    $(document).ready(Picture.init);
  })(jQuery)
  //end	.

  //post slider initialization
  jQuery(document).ready(function($) {
    $('#post-slider').carousel({
      slider: '.slider',
      slide: '.slide',
      addPagination: false,
      addNav: false,
      speed: 800,
      nextSlide: '.post-next',
      prevSlide: '.post-prev'
    });
  });
  (jQuery);

  //portfolio project slider initialization
  jQuery(document).ready(function($) {
    $('.project-slider').carousel({
      slider: '.slider',
      slide: '.slide',
      addPagination: false,
      addNav: false,
      speed: 800,
      nextSlide: '.project-next',
      prevSlide: '.project-prev'
    });
  });
  (jQuery);

  //team slider initialization
  jQuery(document).ready(function($) {
    $('#team-slider').carousel({
      slider: '.slider',
      slide: '.slide',
      addPagination: false,
      addNav: false,
      speed: 800,
      nextSlide: '.team-next',
      prevSlide: '.team-prev'
    });
  });
  (jQuery);

  //portfolio detail
  (function($) {
    "use strict";
    /*Magnific-popup*/
    $('.folio').each(function() {
      $(this).magnificPopup({
        items: [{
          src: '#href' + $(this).attr("href"),
          type: 'inline'
        }],
        gallery: {
          enabled: true
        },
        mainClass: 'mfp-fade',
        removalDelay: 300,
        type: 'image',
        fixedContentPos: false
      });
    });
    $('.closePopup').click(function() {
      $.magnificPopup.instance.close();
    });
    $.fn.getMaginificPopup = function(itemNum, direction) {
      var max = 8;
      var min = 1;
      switch (direction) {
        case 'next':
          if (itemNum != max) {
            itemNum++;
          } else {
            itemNum = min;
          }
          break;
        case 'previous':
          if (itemNum != min) {
            itemNum--;
          } else {
            itemNum = max;
          }
          break;

        default:
          break;
      }
      $.magnificPopup.instance.close();
      setTimeout(function() {
        $('[href=' + itemNum + ']').click();
      }, 400);
    };
  })(jQuery);

  //placeholder support
  $(function() {
    // Invoke the plugin
    $('input, textarea').placeholder();
  });

}(jQuery));
