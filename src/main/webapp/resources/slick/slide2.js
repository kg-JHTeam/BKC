$(function() {

    $(".responsive").slick({
        dots: true,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [{
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true,
                },
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                },
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                },
            },
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ],
    });

    var pager = $(".slick-dots li").length;
    var i = 0;
    var j = 1;
    $(".slick-dots li button").css("background-color", "#D0BABA");
    $(".slick-dots li")
        .filter(":first-child")
        .children("button")
        .css("background-color", "#fff");

    $(".slick-dots li").click(function() {
        var h = $(this).index();
        i = h;
        j = h + 1;
        $(".slick-dots li button").css("background-color", "#D0BABA");
        $(this).children("button").css("background-color", "#fff");
    });

    $(".slick-next").click(function() {
        i++;
        j++;
        $(".slick-dots li")
            .filter(":nth-child(" + i + ")")
            .children("button")
            .css("background-color", "#D0BABA");
        $(".slick-dots li")
            .filter(":nth-child(" + j + ")")
            .children("button")
            .css("background-color", "#fff");
        if (j > pager) {
            j = pager;
            i = pager - 1;
            $(".slick-dots li")
                .filter(":nth-child(" + j + ")")
                .children("button")
                .css("background-color", "#fff");
        }
    });

    $(".slick-prev").click(function() {
        i--;
        j--;
        if (i < 0) {
            i = 0;
        }

        if (j < 1) {
            j = 1;
        }

        if (i == 0) {
            $(".slick-dots li button").css("background-color", "#D0BABA");
            $(".slick-dots li")
                .filter(":nth-child(" + 1 + ")")
                .children("button")
                .css("background-color", "#fff");
        }

        if (i >= 1) {
            $(".slick-dots li button").css("background-color", "#D0BABA");
            $(".slick-dots li")
                .filter(":nth-child(" + j + ")")
                .children("button")
                .css("background-color", "#fff");
        }

        // $(".slick-dots li").filter(":nth-child(" + j + ")").children("button").css("background-color", "red");
        // $(".slick-dots li").filter(":nth-child(" + i + ")").children("button").css("background-color", "black");
    });
});