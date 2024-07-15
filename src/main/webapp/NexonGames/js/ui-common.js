$(function () {
  // header fixed
  const header = $('#header')

  $(window).on('scroll', function() {
    let st = $(window).scrollTop();

    if (st > 0) {
      header.addClass('fixed');
    } else {
      header.removeClass('fixed');
    }
  });

  $("#header .gnb>li").on("mouseenter", function () {
    $("#header").addClass("on");
  });
  $('#header .gnb_wrap').on('mouseleave', function() {
    $('#header').removeClass('on');
  });


  // 사이드 메뉴 작동
  $("#header .open_btn").on("click", function () {
    $("#header .m_gnb_wrap").addClass("on");
    // 사이드 메뉴 열 때 body.on으로 만들어 body scroll 가림
    $("body").addClass("on");
  });
  $("#header .close_btn").on("click", function () {
    $("#header .m_gnb_wrap").removeClass("on");
    $("body").removeClass("on");
  });

  $("#header .m_gnb>li>a").on("click", function (e) {
    e.preventDefault();
    // 사이드 메뉴 list 클릭시 depth2 토글
    $(this).parent().toggleClass("on").siblings().removeClass("on");
  });

  // video slider
  let mainVideoSlider = new Swiper(".main_video .swiper", {
    loop: true,
    watchSlidesProgress: true,
    autoplay: {
      delay: 15000,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      type: "progressbar",
    },
    navigation: {
      nextEl: ".swiper-button-next",
    },
    scrollbar: {
      el: ".swiper-scrollbar",
    },
    on: {
      slideChange: function () {
        // video pagination progress num
        let totalSlide = $(".main_video .swiper-slide").length;
        $(".main_video .page_num .total").text(
          totalSlide < 10 ? "0" + totalSlide : totalSlide
        );

        let idx = mainVideoSlider.realIndex + 1;
        $(".main_video .page_num .current").text(idx < 10 ? "0" + idx : idx);

        // video slide 넘어갈 때 재생 초기화
        const videos = $(".main_video video");

        for (let i = 0; i < videos.length; i++) {
          videos[i].currentTime = 0;
          videos[i].play();
        }
      },
    },
  });
  // slide가 바뀔 때 각 video의 재생 상태 초기화
  // 주석 이유: 더 간단한게 작성 가능
  // mainVideoSlider.on('slideChange', function () {
  //   const videos = $('.main_video video');

  //   for (let i = 0; i < videos.length; i++) {
  //     videos[i].currentTime = 0;
  //     videos[i].play();
  //     // videos는 배열, videos[i]는 일반 DOM return
  //     // console.log(videos[i], videos);
  //   };
  // });

  // 한개를 제어할 땐 get() 메서드 사용(js 메서드로 바꿔줌)
  // $('.main_video video').get(0).play();

  // 한 개의 Swiper 안에 2개의 pagination을 만들 수 없어 새로운 Swiper 생성
  // let paginationProgress = new Swiper('.main_video .swiper',  {
  //   loop: true,
  //   pagination: {
  //     el: '.pagination_progress',
  //     type: 'progressbar',
  //   },
  // });
  // mainVideoSlider.controller.control = paginationProgress;

  // main_worker 슬라이더
  let mainWokrerSlider = new Swiper(".main_worker .swiper", {
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  // top button
  $("#footer .top_btn").on("click", function (e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: 0 });
  });

  // 게시판 카테고리 .board_category
  $('.sub_top .board_category>li>a')
    .on('click', function() {
      $(this).parent().addClass('active').siblings().removeClass('active')
    })
});
