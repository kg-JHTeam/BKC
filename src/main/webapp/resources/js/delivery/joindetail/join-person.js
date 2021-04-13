
jQuery(function ($) {

    var nm_patten = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\s]/g;
    var $idCheckMsg1 = $('#idCheckMsg1'),
        $idCheckMsg2 = $('#idCheckMsg2'),
        $password1_warning_txt = $('#password1_warning_txt')
    ;

    var emailKeyAction = {
        '13' : function (elt) {
            var email = elt.value;
            $('.email_list').hide();
            if(!isPregEmail(email)) {
                $('p[name="msg_email1"]').text('이메일 주소를 다시 확인해주세요.').show();
            }
        },
        '40' : function (elt) {
            $(elt).closest('.email_column').find('.auto_list > a').filter(':visible').eq(0).focus();
        }
    };

    $('#frm')
        // 엔터 키 처리.
        .on('keydown', 'input[type="text"], input[type="password"], input[type="number"]', function (e) {
            if (e.keyCode === 13) {
                e.stopPropagation();
                return false;
            }
        })
        // 아이디 문자열 치완
        .on('keyup', '#id', function () {
            var inputVal = this.value;
            if (/[^a-z0-9\_]/gi.test(inputVal)) {
                $idCheckMsg1.text('4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능').show();
                this.value = inputVal.replace(/[^a-z0-9\_]/gi, '');
            }
        })
        .on('focus', '#id', function() {
            $idCheckMsg1.html('<span class="less_important">4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능</span>').show();
            $idCheckMsg2.hide();
        })
        .on('focusout', '#id', function() {
            this.value = this.value.replace(/[^a-z0-9\_]/gi, '');
            $idCheckMsg1.hide();
            $idCheckMsg2.hide();
        })
        .on('blur', '#id', function() {
            idExsistCheck(this.value);
        })
        .on('focus', '#password1', function() {
            if (this.value === '') {
                $password1_warning_txt.show();
            }
        })
        .on('focusout', '#password1', function() {
            $password1_warning_txt.hide();
        })
        .on('keyup', '#password1', function(e) {
            verifyPasswdStrength(e.currentTarget);
        })
        .on('blur', '#password1', function(e) {
            verifyPasswdStrength(e.currentTarget);
        })
        .on('keyup', 'input[name="tmp_cellnum"]', function() {
            if (/[^0-9]/g.test(this.value)) {
                chkPhoneNum(this);
            }
        })
        .on('change', 'input[name="tmp_cellnum"]', function() {
            chkPhoneNum(this);
        })
        .on('blur', '#sms_cellnum, #mail_cellnum', function() {
            chkPhoneNum(this);
            already_phone_join_check();
        })
        .on('keyup', 'input[name="tmp_user_nm"]' , function(evt) {
            var elt = evt.currentTarget;
            var user_nm = $.trim(elt.value);
            var $msg_area = $('#' + $('#channel').val() + '_user_nm_msg');

            $msg_area.hide();
            if (nm_patten.test(user_nm)) {
                $msg_area.html('이름에는 특수문자, 숫자는 사용하실 수 없습니다.').show();
                elt.value = user_nm.replace(nm_patten, '');
            }
        })
        .on('blur', 'input[name="tmp_user_nm"]' , function() {
            var user_nm = $.trim(this.value);
            var $msg_area = $('#' + $('#channel').val() + '_user_nm_msg');
            $msg_area.hide();

            if (user_nm === '') {
                $msg_area.html('필수정보 입니다.').show();
                return;
            }
            if (nm_patten.test(user_nm)) {
                $msg_area.html('이름에는 특수문자, 숫자는 사용하실 수 없습니다.').show();
            }
            this.value = user_nm.replace(nm_patten, '');
            $('#user_nm').val(this.value);
        })
        .on('keyup', 'input[name="tmp_birth_date"]', function() {
            keyEventBirthDate(this);
        })
        .on('change', 'input[name="tmp_birth_date"]', function() {
            keyEventBirthDate(this);
        })
        .on('keyup', 'input[name="tmp_email_id"]', function(e) {
            var $msg_area = $('#' + $('#channel').val() + '_msg_email1');
            var email_patten = /[ㄱ-ㅎㅏ-ㅣ가-힣]/gi;
            $msg_area.hide();
            if (email_patten.test(this.value)) {
                this.value = this.value.replace(email_patten, '');
                $msg_area.show();
            }

            if (this.value === '') {
                $('.email_list').hide();
                return;
            }

            autoEmail(this.value);
            if (!!emailKeyAction[e.keyCode]) {
                emailKeyAction[e.keyCode](e.currentTarget);
            }
        })
        .on('blur', 'input[name="tmp_email_id"]', function() {

            $('body').off('click').on('click', function (e) {
                if (!$(e.target).hasClass("email_domain")) {
                    $('.email_list').hide();
                }
            });

            if ($(this).closest('ul').find('.auto_list > a').filter(':visible').length === 0) {
                chkEmail(this);
            }
        })
        .on('blur', 'input[name="tmp_email_id"]', function() {
            chkEmail(this);
            already_phone_join_check();
        })
        .on('click', '.auto_list', function () {
            autoEmailSelect(this);
        })
        .on('keydown', '.auto_list', function (e) {
            if (e.keyCode === 13) {
                autoEmailSelect(this);
            }
            return false;
        })
        .on('keyup', '.auto_list', function(e) {
            var elt = e.currentTarget;
            var $ul = $(elt).closest('ul');
            var $li = $ul.find('.auto_list > a').filter(':visible');
            var index = $li.index( $(elt).children() );

            if ((index+1) >= $li.length) {
                index = -1;
            }
            if (e.keyCode === 38) {
                $li.eq(--index).focus();
            }
            if (e.keyCode === 40) {
                $li.eq(++index).focus();
            }

            scrollLockup();
        })

        .on('blur', '#sms_birth_date, #mail_birth_date', function() {
            checkBirth();
        })
        .on('change', '#agree_rule1, #agree_take1', function () {
            if (this.id === 'agree_rule1') {
                toggleChkBox('tc_1', this)
            }
            if (this.id === 'agree_take1') {
                toggleChkBox('tc_2', this)
            }
        })
        .on('click', '#btn_submit', function () {
            personFrmCheck();
        })
    ;

      function agreeValueChange(val) {
        $('#tc_1_fl').val(val);
        $('#tc_2_fl').val(val);
        $('#agree_rule1').val(val);
        $('#agree_take1').val(val);
        $('#termsAgree').val(val);
        $('#sms_receive_fl').val(val);
    }


    function isPregEmail(email_str) {
        return /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i.test(email_str);
    }

    function keyEventBirthDate(elt) {
        var $msg = $('#' + $('#channel').val() + '_cyr_msg');
        var birth_date = elt.value;
        $msg.hide();
        if (/[^0-9]/gi.test(birth_date)) {
            $msg.html('생년월일은 숫자만 입력 가능합니다.').show();
            elt.value = birth_date.replace(/[^0-9]/gi, '');
        }
    }


    /* 성별 체크 */
    $('.man').on('click', function (e) {
        $('#sex').val('male');

        $(this).parent('p').addClass('check_man').removeClass('check_woman');
        e.preventDefault();
        if ($('#agreeSelectiveGender').is(':checked') == false) {
            $('#agreeSelectiveGender_label').click();
        }
        $('#collectionBasisContentsSex').css('display', 'none');
    });
    $('.woman').on('click', function (e) {
        $('#sex').val('female');

        $(this).parent('p').addClass('check_woman').removeClass('check_man');
        e.preventDefault();
        if ($('#agreeSelectiveGender').is(':checked') == false) {
            $('#agreeSelectiveGender_label').click();
        }
        $('#collectionBasisContentsSex').css('display', 'none');
    });

    /* 약관보기 */
    $('.folding_off').on('click', function (e) {
        $(this).parent().parent('li').addClass('on');
        e.preventDefault();
    });
    $('.folding_on').on('click', function (e) {
        $(this).parent().parent('li').removeClass('on');
        e.preventDefault();
    });

    /* 메일 체크 */
    $('.mail_custom').toggle(
        function () {
            $(this).addClass('check_on').removeClass('check_off').children('input').attr('checked', 'checked');
            $('.mail_detail li').removeClass('balloon');
            $('.set_mail_input').each(function () {
                $(this).attr('checked', 'checked');
            });
        },
        function () {
            $('.set_mail_input').each(function () {
            });
        }
    );

    /* 마케팅 정보 수신 동의 - 이메일 */
    //bkm 2015.09.08
    $('.check_mail').toggle(
        function () {
            $('#reject_event').val('on');
            $('#reject_survey').val('on');
        },
        function () {
            $('#reject_event').val('');
            $('#reject_survey').val('');
        }
    );

    /* 마케팅 정보 수신 동의 - 이메일 (기업) */
    //bkm 2015.09.08
    $('.check_mail_company').toggle(
        function () {
            $('#c_frm').find('#reject_event').val('on');
            $('#reject_letter').val('on');
        },
        function () {
            $('#c_frm').find('#reject_event').val('');
            $('#reject_letter').val('');
        }
    );

    /* 전체 동의 */
    //bkm 2015.09.08
    $('.check_all').on('click',
        function () {
            var $frm = $('#frm');
            if ($('#channel').val() === 'social') {
                $frm = $('#social_frm');
            }
            var $hiddenChkAll = $frm.find('#hidden_check_all');

            if ($hiddenChkAll.val() == '0') {
                //일단 다 끈다.
                if ($frm.find('#agree_rule1').is(':checked')) $frm.find('#agree_rule1').trigger('click');
                if ($frm.find('#agree_take1').is(':checked')) $frm.find('#agree_take1').trigger('click');
                if ($frm.find('#termsAgree').is(':checked')) $frm.find('#termsAgree').trigger('click');
                if ($frm.find('#sms_receive_fl').is(':checked')) $frm.find('#sms_receive_fl').trigger('click');

                //다 킨다.
                $frm.find('#agree_rule1').trigger('click');
                $frm.find('#agree_take1').trigger('click');
                $frm.find('#termsAgree').trigger('click');
                $frm.find('#sms_receive_fl').trigger('click');

                $hiddenChkAll.val('1');
            } else {
                //일단 다 킨다.
                if (!$frm.find('#agree_rule1').is(':checked')) $frm.find('#agree_rule1').trigger('click');
                if (!$frm.find('#agree_take1').is(':checked')) $frm.find('#agree_take1').trigger('click');
                if (!$frm.find('#termsAgree').is(':checked')) $frm.find('#termsAgree').trigger('click');
                if (!$frm.find('#sms_receive_fl').is(':checked')) $frm.find('#sms_receive_fl').trigger('click');

                //다 끈다.
                $frm.find('#agree_rule1').trigger('click');
                $frm.find('#agree_take1').trigger('click');
                $frm.find('#termsAgree').trigger('click');
                $frm.find('#sms_receive_fl').trigger('click');

                $hiddenChkAll.val('0');
            }
        }
    );

    /* 메일 세팅 열기 */
    $('.open_btn').on('click', function (e) {
        $(this).hide().siblings('.mail_custom').show().parent().find('.mail_detail').show();
        e.preventDefault();
    });
    $('.set_mail_input').on('click', function (e) {
        var allchk = false,
            chkcnt = 0;

        $('.mail_detail li').removeClass('balloon');
        if ($(this).attr('checked') != 'checked') {
            $(this).parent('li').addClass('balloon');
        }
        $('.set_mail_input').each(function () {
            if ($(this).attr('checked') === 'checked') {
                ++chkcnt;
            }
        });
        if ($('.set_mail_input').length == chkcnt) {
            $('.mail_custom').addClass('check_on').removeClass('check_off');
        }
        else {
            $('.mail_custom').addClass('check_off').removeClass('check_on');
        }
    });

    /* 메일 직접 입력 */
    $('.self_write').on('click', function (e) {
        $(this).parent().parent().parent('.select_align_row').find('.self_area').addClass('on');
        $(this).parent().parent().parent('.select_align_row').addClass('auto_height');
    });
    $('.mail_slt').on('click', function (e) {
        $(this).parent().parent().parent('.select_align_row').find('.self_area').removeClass('on');
        $(this).parent().parent().parent('.select_align_row').removeClass('auto_height');
    });

    /* 인풋 플레이스홀더 대체 */
    $(".cont_division").find("input, textarea").each(function () {
        $(this).on('focus', function () {
            $(this).parents('.item').find('label').addClass('on');
        }).on('blur', function () {
            if ($.trim($(this).val()) == "") $(this).parents('.item').find('label').removeClass('on');
        });
    });

    $('#cellnum').on('keypress', function (ev) {
        ev.stopPropagation();
        var evt = ev || window.event;

        if (!evt.keyCode || evt.keyCode == 0) {
            var code = evt.charCode;
        } else {
            var code = evt.keyCode;
        }

        if (( 48 <= code && code <= 57 )
            || code == 8
            || code == 190
            || code == 9
            || code == 45
        ) {
        } else {
            evt.preventDefault();
        }
    }).on('keyup', function (ev) {
        ev.stopPropagation();
        $(this).removeCharacterWithoutHyphen();
    }).on('blur', function (ev) {
        ev.stopPropagation();
        $(this).removeCharacterWithoutHyphen();
    });

    // 숫자만 입력 체크
    $('#birth_year, #birth_month, #birth_day').on('keypress', function (ev) {
        ev.stopPropagation();
        var evt = ev || window.event;

        if (!evt.keyCode || evt.keyCode == 0) {
            var code = evt.charCode;
        } else {
            var code = evt.keyCode;
        }

        if (( 48 <= code && code <= 57 )
            || code == 8
            || code == 190
            || code == 9
        ) {
        } else {
            evt.preventDefault();
        }
    }).on('keyup', function (ev) {
        ev.stopPropagation();

        $(this).removeCharacter();

        var id = $(this).attr('id'),
            val = $(this).val();

        if (id === 'birth_year' && val.length === 4) {
            $('#birth_month').focus();
        } else if (id === 'birth_month' && val.length === 2) {
            $('#birth_day').focus();
        }
    }).on('blur', function (ev) {
        ev.stopPropagation();

        $(this).removeCharacter();

        var id = $(this).attr('id'),
            val = $(this).val();

        if (id == 'birth_year') {
            //if (val.length != 4 || val < 1900) {
            //    $(this).val('');
            //    if (val.length == 4) {
            //        $(this).focus();
            //    }
            //}

        } else if (id == 'birth_month') {
            //if (val < 1 || val > 12) {
            //    $(this).val('');
            //    if (val.length == 2) {
            //        $(this).focus();
            //    }
            //}
            if (val.length == 1 && val > 0 && val < 10) {
                $(this).val(new String('0' + val));
            }
        } else if (id == 'birth_day') {
            //if (val < 1 || val > 31) {
            //    $(this).val('');
            //}
            if (val.length == 1 && val > 0 && val < 10) {
                $(this).val(new String('0' + val));
            }
        }

        if (id == 'birth_month' || id == 'birth_day') {
            if (val.length == 1 && val > 0 && val < 10) {
                $(this).val(new String('0' + val));
            }
        }

        chkBirthDate();
    });

    // 이메일
    $('#email_dm').on('keydown', function (ev) {
        if ($(this).val().length > 0) {
            $(this).parent().next().find(".tval").text('직접입력');
            $(this).parent().next().find("input").val('직접입력');
        }
    }).on('blur', function (ev) {
        var emailDmArr = ['naver.com', 'hanmail.net', 'gmail.com', 'nate.com', 'daum.net', 'hotmail.com'],
            val = $(this).val();
        if (val.length > 0 && $.inArray(val, emailDmArr) != -1) {
            $(this).parent().next().find(".tval").text(val);
            $(this).parent().next().find("input").val(val);
        }
    });

    // 회원가입 말풍선 레이어 닫기버튼
    $("#content").find(".layer_speech_burble").each(function () {
        var btnCloseLayer = $(this).find(".btn_close_layer").eq(0),
            layer = $(this);

        btnCloseLayer.on("click", function () {
            layer.hide();
        });
    });

    // 약관 상세보기 링크를 새창(윈도우)으로 열기
    $("#content").find("a.popup_clause_open").on("click", function (ev) {
        var URL = $(this).attr("href"),
            windowName = $(this).attr("id"),
            spec = "width=816,height=520,top=0,left=0,menubar=0,toolbar=0,location=0,personalbar=0,directories=0,status=0,scrollbars=1,resizable=0";

        window.open(URL, windowName, spec);
        ev.preventDefault();
    });

    // function 확장
    $.fn.extend({
        // 한글/영문 제거
        removeCharacter: function () {
            var $el = $(this);

            if (/[^\d\.]/g.test($el.val())) {
                $el.val($el.val().replace(/[^\d\.]/g, ''));
            }
        },

        // 한글/영문 제거, 하이픈 제외
        removeCharacterWithoutHyphen: function () {
            var $el = $(this);

            if (/[^\d\.\-]/g.test($el.val())) {
                $el.val($el.val().replace(/[^\d\.\-]/g, ''));
            }
        },

        // 한글 제거
        removeKorean: function () {
            var $el = $(this);

            if (/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g.test($el.val())) {
                $el.val($el.val().replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
            }
        }
    });
});

function set_agree_selective_address() {
    if (jQuery('#agreeSelectiveAddress').prop('checked')) {
        jQuery('#collectionBasisContentsAddress').hide();
        jQuery('#address_sebu').removeAttr('readonly');
    }
    else {
        jQuery('#collectionBasisContentsAddress').show();
        jQuery('#zipcode, #address, #address_main, #address_sebu, #address_details, #overseas').val('');
        jQuery('#overseaText').html('국가 선택');
        jQuery('#address_sebu').attr('readonly', 'readonly');
    }
}

function set_agree_selective_gender() {
    if (jQuery('#hidden_agree_sex').val() == 'on') {
        jQuery('#hidden_agree_sex').val('off');
        jQuery('#collectionBasisContentsSex').show();
        jQuery('#sex_btn').removeClass('check_man').removeClass('check_woman');
        jQuery('#sex').val('');
    }
    else {
        jQuery('#hidden_agree_sex').val('on');
        jQuery('#collectionBasisContentsSex').hide();
    }
}

/* layer popup */
function Lpopview(id) {
    var lpop = document.getElementById(id);
    if (lpop.style.display == "block") {
        lpop.style.display = "none";
    } else {
        lpop.style.display = "block";
    }
    return false
}

function certificationNoticeCompany() {
    jQuery('.tab02').parent('li').addClass('on').siblings().removeClass('on');
    jQuery('#member_corp').show().siblings().hide();

    certifiCationNoticePopupClose();
}

function certifiCationNoticePopupClose() {
    jQuery('.dimmedbg').hide();
    jQuery('.dimmed').hide();
    jQuery('.layer_stop_service').hide();
}
