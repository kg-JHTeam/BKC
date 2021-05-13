//고객센터 탭메뉴
var $setRows = $('#setRows');

$setRows.submit(function (e) {
    e.preventDefault();
    var rowPerPage = $('[name="rowPerPage"]').val() * 1; // 1 을  곱하여 문자열을 숫자형로 변환

    //		console.log(typeof rowPerPage);

    var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
    if (!rowPerPage) {
        alert(zeroWarning);
        return;
    }
    $('#nav').remove();
    var $products = $('#products');

    $products.after('<div id="nav">');

    var $tr = $($products).find('tbody tr');
    var rowTotals = $tr.length;
    //	console.log(rowTotals);

    var pageTotal = Math.ceil(rowTotals / rowPerPage);
    var i = 0;

    for (; i < pageTotal; i++) {
        $('<a href="#"></a>')
            .attr('rel', i)
            .html(i + 1)
            .appendTo('#nav');
    }

    $tr
        .addClass('off-screen')
        .slice(0, rowPerPage)
        .removeClass('off-screen');

    var $pagingLink = $('#nav a');
    $pagingLink.on('click', function (evt) {
        evt.preventDefault();
        var $this = $(this);
        if ($this.hasClass('active')) {
            return;
        }
        $pagingLink.removeClass('active');
        $this.addClass('active');

        // 번호 * 페이지당 행수 끝 행 = 시작 행 + 페이지당 행수

        var currPage = $this.attr('rel');
        var startItem = currPage * rowPerPage;
        var endItem = startItem + rowPerPage;

        $tr
            .css('opacity', '0.0')
            .addClass('off-screen')
            .slice(startItem, endItem)
            .removeClass('off-screen')
            .animate({
                opacity: 1
            }, 300);
    });
    $pagingLink
        .filter(':first')
        .addClass('active');
});
$setRows.submit()


//앱 이용안내 유의사항 슬라이트
$(document).ready(function () {
    $(".btn_caution").click(function () {
        var d = $(this)
            .next("div")
            .css("display");

        if (d == "none") {
            $(".subtxt")
                .stop()
                .slideUp();
            $(this)
                .next("div")
                .stop()
                .slideDown();
            $(".btn_caution").addClass("rotate");
        } else {
            $(this)
                .next("div")
                .stop()
                .slideUp();
            $(".btn_caution").removeClass("rotate");
        }
    });
});

//앱이용안내 슬릭
$(document).ready(function () {
    $('.slick-delivery').slick(
        {slidesToShow: 1, dots: true, arrows: true, speed: 300}
    );

    $('.slick-store').slick(
        {slidesToShow: 1, dots: true, arrows: true, speed: 300}
    );

    $('.slick-coupon').slick(
        {slidesToShow: 1, dots: true, arrows: true, speed: 300}
    );
});

//앱이용안내 팝업창 띄우기
$(document).ready(function () {

    $(".delivery").click(function () { //팝업 버튼 클릭 시
        $(".popup-wrap").css("display", "block"); //팝업 배경 display block
        $(".popup-wrap").css("overflow", "hidden")
        $(".popup-app").css("display", "block"); //팝업창 display block
        $(".popup-app").css("overflow-y", "scroll");
    });

    $(".store_search").click(function () { //팝업 버튼 클릭 시
        $(".popup-wrap").css("display", "block"); //팝업 배경 display block
        $(".popup-wrap").css("overflow", "hidden")
        $(".popup-app").css("display", "block"); //팝업창 display block
        $(".popup-app").css("overflow-y", "scroll");
    });

    $(".coupon").click(function () { //팝업 버튼 클릭 시
        $(".popup-wrap").css("display", "block"); //팝업 배경 display block
        $(".popup-wrap").css("overflow", "hidden")
        $(".popup-app").css("display", "block"); //팝업창 display block
        $(".popup-app").css("overflow-y", "scroll");
    });

    $(".btn_close").click(function () {
        $(".popup-wrap").css("display", "none"); //팝업창 뒷배경 display none
        $(".popup-app").css("display", "none"); //팝업창 display none
    });

});

//앱이용안내 탭메뉴
$(document).ready(function () {
    $(".popup-tabcont >div").show(); //첫 탭화면 보이기, 나머지 숨기기
    $(".popup-tabcont >div ")
        .eq(1)
        .hide();
    $(".popup-tabcont >div ")
        .eq(2)
        .hide();
    $(".popup-tabcont >div ")
        .eq(3)
        .hide();

    $(".popup-tabmenu li").click(function () {
        var idx = $(this).index(); //탭메뉴 클릭 시 on 클래스 없애고 클릭한 탭메뉴에 붙이기
        $(".popup-tabmenu li").removeClass("on");
        $(".popup-tabmenu li")
            .eq(idx)
            .addClass("on");
        $(".popup-tabcont >div").hide();
        $(".popup-tabcont >div")
            .eq(idx)
            .show()
    })
});

//FAQ 카테고리별 탭메뉴
$(function () {
    $(".faq-wrap >div").show();
    $(".faq-wrap >div ")
        .eq(1)
        .hide();
    $(".faq-wrap >div ")
        .eq(2)
        .hide();
    $(".faq-wrap >div ")
        .eq(3)
        .hide();
    $(".faq-wrap >div ")
        .eq(4)
        .hide();
    $(".faq-wrap >div ")
        .eq(5)
        .hide();

    $(".faq_category label").click(function () {
        var idx = $(this).index();
        $(".faq_category label").removeClass("on");
        $(".faq_category label")
            .eq(idx)
            .addClass("on");
        $(".faq-wrap >div").hide();
        $(".faq-wrap >div")
            .eq(idx)
            .show()
    })
});

//FAQ 내용 슬라이드
$('.acc_tit_tr').click(function(){
    $(this).stop().next("tr").toggleClass("open");
});

$(document).ready(function () {
    $(".acc_tit").click(function () {
        var d = $(this)
            .next(".text_area")
            .css("display");

        if (d == "none") {
            $(".text_area")
                .stop()
                .slideUp();
            $(this)
                .next("div")
                .stop()
                .slideDown();
            $(".btn_acc").addClass("rotate");
        } else {
            $(this)
                .next("div")
                .stop()
                .slideUp();
            $(".btn_acc").removeClass("rotate");
        }
    })
});

//팝업창 띄우기
$(document).ready(function () {

    $(".btn_regform").click(function () { //팝업 버튼 클릭 시
        $(".popup-wrap").css("display", "block"); //팝업 배경 display block
        $(".popup-wrap").css("overflow", "hidden")
        $(".popup").css("display", "block"); //팝업창 display block
        $(".popup").css("overflow-y", "scroll");
    });

    $(".btn_close").click(function () {
        $(".popup-wrap").css("display", "none"); //팝업창 뒷배경 display none
        $(".popup").css("display", "none"); //팝업창 display none
    });

});

//가맹 신청서 지역 선택
$('document').ready(function () {
    var area0 = [
        "시/도 선택",
        "서울특별시",
        "인천광역시",
        "대전광역시",
        "광주광역시",
        "대구광역시",
        "울산광역시",
        "부산광역시",
        "경기도",
        "강원도",
        "충청북도",
        "충청남도",
        "전라북도",
        "전라남도",
        "경상북도",
        "경상남도",
        "제주도"
    ];
    var area1 = [
        "강남구",
        "강동구",
        "강북구",
        "강서구",
        "관악구",
        "광진구",
        "구로구",
        "금천구",
        "노원구",
        "도봉구",
        "동대문구",
        "동작구",
        "마포구",
        "서대문구",
        "서초구",
        "성동구",
        "성북구",
        "송파구",
        "양천구",
        "영등포구",
        "용산구",
        "은평구",
        "종로구",
        "중구",
        "중랑구"
    ];
    var area2 = [
        "계양구",
        "남구",
        "남동구",
        "동구",
        "부평구",
        "서구",
        "연수구",
        "중구",
        "강화군",
        "옹진군"
    ];
    var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
    var area4 = ["광산구", "남구", "동구", "북구", "서구"];
    var area5 = [
        "남구",
        "달서구",
        "동구",
        "북구",
        "서구",
        "수성구",
        "중구",
        "달성군"
    ];
    var area6 = ["남구", "동구", "북구", "중구", "울주군"];
    var area7 = [
        "강서구",
        "금정구",
        "남구",
        "동구",
        "동래구",
        "부산진구",
        "북구",
        "사상구",
        "사하구",
        "서구",
        "수영구",
        "연제구",
        "영도구",
        "중구",
        "해운대구",
        "기장군"
    ];
    var area8 = [
        "고양시",
        "과천시",
        "광명시",
        "광주시",
        "구리시",
        "군포시",
        "김포시",
        "남양주시",
        "동두천시",
        "부천시",
        "성남시",
        "수원시",
        "시흥시",
        "안산시",
        "안성시",
        "안양시",
        "양주시",
        "오산시",
        "용인시",
        "의왕시",
        "의정부시",
        "이천시",
        "파주시",
        "평택시",
        "포천시",
        "하남시",
        "화성시",
        "가평군",
        "양평군",
        "여주군",
        "연천군"
    ];
    var area9 = [
        "강릉시",
        "동해시",
        "삼척시",
        "속초시",
        "원주시",
        "춘천시",
        "태백시",
        "고성군",
        "양구군",
        "양양군",
        "영월군",
        "인제군",
        "정선군",
        "철원군",
        "평창군",
        "홍천군",
        "화천군",
        "횡성군"
    ];
    var area10 = [
        "제천시",
        "청주시",
        "충주시",
        "괴산군",
        "단양군",
        "보은군",
        "영동군",
        "옥천군",
        "음성군",
        "증평군",
        "진천군",
        "청원군"
    ];
    var area11 = [
        "계룡시",
        "공주시",
        "논산시",
        "보령시",
        "서산시",
        "아산시",
        "천안시",
        "금산군",
        "당진군",
        "부여군",
        "서천군",
        "연기군",
        "예산군",
        "청양군",
        "태안군",
        "홍성군"
    ];
    var area12 = [
        "군산시",
        "김제시",
        "남원시",
        "익산시",
        "전주시",
        "정읍시",
        "고창군",
        "무주군",
        "부안군",
        "순창군",
        "완주군",
        "임실군",
        "장수군",
        "진안군"
    ];
    var area13 = [
        "광양시",
        "나주시",
        "목포시",
        "순천시",
        "여수시",
        "강진군",
        "고흥군",
        "곡성군",
        "구례군",
        "담양군",
        "무안군",
        "보성군",
        "신안군",
        "영광군",
        "영암군",
        "완도군",
        "장성군",
        "장흥군",
        "진도군",
        "함평군",
        "해남군",
        "화순군"
    ];
    var area14 = [
        "경산시",
        "경주시",
        "구미시",
        "김천시",
        "문경시",
        "상주시",
        "안동시",
        "영주시",
        "영천시",
        "포항시",
        "고령군",
        "군위군",
        "봉화군",
        "성주군",
        "영덕군",
        "영양군",
        "예천군",
        "울릉군",
        "울진군",
        "의성군",
        "청도군",
        "청송군",
        "칠곡군"
    ];
    var area15 = [
        "거제시",
        "김해시",
        "마산시",
        "밀양시",
        "사천시",
        "양산시",
        "진주시",
        "진해시",
        "창원시",
        "통영시",
        "거창군",
        "고성군",
        "남해군",
        "산청군",
        "의령군",
        "창녕군",
        "하동군",
        "함안군",
        "함양군",
        "합천군"
    ];
    var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];

    //시도 설정
    $("select[name^=sido]").each(function () {
        $selsido = $(this);
        $.each(eval(area0), function () {
            $selsido.append("<option value='" + this + "'>" + this + "</option>");
        });
        $selsido
            .next()
            .append("<option value=''>구/군 선택</option>");
    });

    $("select[name^=sido]").change(function () {
        var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
        var $gugun = $(this).next(); // 선택영역 군구 객체
        $("option", $gugun).remove(); // 구군 초기화

        if (area == "area0") 
            $gugun.append("<option value=''>구/군 선택</option>");
        else {
            $.each(eval(area), function () {
                $gugun.append("<option value='" + this + "'>" + this + "</option>");
            });
        }
    });

});

//가맹신청서 약관 동의 자세히 보기
$(document).ready(function () {
    $(".btn_acc").click(function () {
        var d = $(this)
            .next("div")
            .css("display");

        if (d == "none") {
            $(".subtxt")
                .stop()
                .slideUp();
            $(this)
                .next("div")
                .stop()
                .slideDown();
            $(".btn_acc").addClass("rotate");
        } else {
            $(this)
                .next("div")
                .stop()
                .slideUp();
            $(".btn_acc").removeClass("rotate");
        }
    });
});

//상단으로 올리기 버튼
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 500) {
            $('.btn_top').fadeIn();
        } else {
            $('.btn_top').fadeOut();
        }
    });
    $(".btn_top").click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 400);
        return false;
    });
});
