/* select box */
(function ($) {

    $.fn.selectBox = function () {
        var $selectElt = $(this);
        $selectElt.find(".seltxt").click(function (e) {

            var $seltxt = $(this),
                $selectbox = $seltxt.closest('.selectbox'),
                $depthLayer = $selectbox.find('.depth')
            ;

            if ($seltxt.hasClass('companyCdFix')) return;

            if ($depthLayer.is(':visible')) {
                $seltxt.removeClass("selectIndex");
                $selectbox.find('.depth').hide();
            } else {
                $selectbox.addClass("selectIndex");
                $depthLayer.slideDown("fast", function () {
                    $selectbox.find(".depth").focus();
                });
            }

            e.preventDefault();
        });

        $selectElt.parent().find(".depth .value").click(function () {
            $(this).parent(".depth").slideUp("fast", function () {
                $(this).parent().removeClass("selectIndex");
            });

            var catename = $(this).text();
            $(this).parent().parent().find(".tval").text(catename);
            $(this).parent().parent().find("input").val(catename);

            if (this.name === 'choice_company_cd') {
                var company_cd = $(this).data('value');
                var $exception_corp = $('#exception_corp');

                $exception_corp.hide();
                $('#msg_company_cd').hide();
                $('#company_cd').val(company_cd);
                if (company_cd === 10) {
                    $exception_corp.show();
                }
            }

            if ($(this).parent().attr('id') == 'email_addr') {
                // 개인회원 이메일
                if ($(this).text() != '직접입력') {
                    $(this).parents('form').find('#email_dm').val($(this).text());
                } else {
                    $(this).parents('form').find('#email_dm').val('').attr('placeholder', '이메일을 입력해주세요.');
                }

                chkEmail(this);
            }

            return false;
        });

        $selectElt.mouseleave(function () {
            $(this).removeClass("selectIndex");
            $(this).find(".depth").slideUp("fast", function () {
                $(this).removeClass("zindex");
            });
        });

    };

    // 체크박스 클릭. ?
    $('.clickable').on('click', function () {
        $(this).prev('label').trigger('click');
    });


    $(".selectbox").selectBox();
    // $(".popup_selectbox").selectBox();

    /* 동의 체크 */
    $('.check_custom').toggle(
        function () {
            $(this).addClass('check_on').removeClass('check_off').children('input').attr('checked', 'checked').trigger('change');
        },
        function () {
            $(this).addClass('check_off').removeClass('check_on').children('input').removeAttr('checked').trigger('change');
        }
    ).click(
        function () {
            var $frm = $('#frm');
            if ($('#channel').val() === 'social') {
                $frm = $('#social_frm');
            }
            if ($frm.find('#agree_rule1').is(':checked')
                && $frm.find('#agree_take1').is(':checked')
                && $frm.find('#termsAgree').is(':checked')
                && $frm.find('#sms_receive_fl').is(':checked')) {
                $frm.find('#agreeAllPersonal').parents().addClass('check_on').removeClass('check_off').children('input').attr('checked', 'checked');
                $frm.find('#hidden_check_all').val('1');
            } else {
                $frm.find('#agreeAllPersonal').parents().addClass('check_off').removeClass('check_on').children('input').removeAttr('checked');
                $frm.find('#hidden_check_all').val('0');
            }
        }
    );

    $('.dormancy_term')
        .on('click', '.txt_check, .sri_check', function () {
            var $elt = $(this);
            var $label = $elt.hasClass('sri_check') ? $elt : $elt.closest('label');
            var $checkbox = $label.find('.inp_check');

            if (!$label.hasClass('check_on')) {
                $('.sri_check').not(this).removeClass('check_on');
                if ($label.hasClass('check_on')) {
                    $label.removeClass('check_on');
                    $checkbox.prop('checked', false);
                } else {
                    $label.addClass('check_on');
                    $checkbox.prop('checked', true);
                }
            }
        })
    ;

    $('#layer_pop_byemail, #layer_pop_byphone')
        .on('keyup', 'input[type="text"]', function () {
            if (this.value.length > 6) {
                this.value = this.value.substr(0, 6);
            }
        })
    ;

    /* 레이어 팝업 닫기 */
    $('#p_member_nudge').on('click', '.close_btn', function () {
        $('#p_member_nudge').hide();
        // $('#password1').prop({type:"password"});
    });

    $(function () {
        if ($('#c_frm').length > 0) {
            setLogScript('company', '', 'com-tab', 'click_tab');
        } else {
            try{n_trackEvent('join', 'applicant', '');}catch(e){}
        }

    })
})(jQuery);


// 아이디 사용여부 체크
var idLogChk = false;
var idExsistCheck = function (id_val) {

    var $id = $('#id');
    var $formObj = $id.closest('form').eq(0);
    var $idCheckMsg1 = $('#idCheckMsg1');
    var $idCheckMsg2 = $('#idCheckMsg2');
    id_val = id_val.replace(/[^a-z0-9\_]/gi, '');

    if ($id.closest('form').length < 1) {
        return false;
    }

    if (id_val === '' || $id.get(0).getAttribute('placeholder') === id_val) {
        $idCheckMsg1.html('<span class="less_important">4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능</span>').show();
        return false;
    }

    $id.val(id_val);
    $('#id_chk_ok').val('0');
    $idCheckMsg1.hide();
    $idCheckMsg2.hide();

    if (id_val.length < 4) {
        $idCheckMsg1.html('4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능').show();
        return false;
    }

    $.ajax({
        data: {
            'id': id_val,
            'type': 'json'
        },
        dataType: 'json',
        type: 'get',
        url: '/zf_user/member/registration/id-check',
        success: function (response, status, request) {

            if (response.code === 'duplicate') {
                $idCheckMsg1.text('이미 사용중인 아이디입니다.').show();
                return false;
            } else {
                if (id_val.replace(" ", "") !== id_val || id_val.length < 4 || !engornum(id_val)) {
                    $idCheckMsg1.text('다른 아이디를 입력해주세요.').show();
                    return false;
                } else {
                    $idCheckMsg2.text('사용가능한 아이디입니다.').show();
                    if ($formObj.get(0).name === 'c_frm' && idLogChk === false) {
                        setLogScript('account-info', 'identification', 'Id_input', 'Id_check');
                        idLogChk = true;
                    }
                }

                $formObj.find('#id_chk_ok').val('1');
                return true;
            }
        }
    });

    function engornum(strdata) {
        for (a = 0; a < strdata.length; a++) {
            var sid = strdata.substring(a, a + 1);
            if ((sid < "0" || sid > "9") && (sid < "a" || sid > "z") && (sid < "A" || sid > "Z") && sid != "_") {
                return false;
            }
        }
        return true;
    }
};

//이메일 체크
var emailLogChk = false;
var chkEmail = function (obj) {
    // if (!window.setBlurFlag) {
    //     return false;
    // }

    var channel = $('#channel').val(),
        $email_id = $('#' + channel + '_email_id'),
        $msg_email1 = $('#' + channel + '_msg_email1'),
        $msg_email2 = $('#' + channel + '_msg_email2'),
        valEmailId = $.trim($email_id.val())
    ;

    $msg_email1.hide();
    $msg_email2.hide();
    $('#msg_email2').hide();
    if (valEmailId === '') {
        $msg_email1.show();
        return false;
    }

    var email = $email_id.val();

    var reg_email = /^[0-9a-z_+-]+([\.]*[0-9a-z_+-])*@([0-9a-z_-]+\.)+[a-z]{2,10}$/i;
    if (email !== '' && email.search(reg_email) == -1) {
        $msg_email1.text('이메일 주소를 다시 확인해주세요.').show();
        return false;
    }

    $('#email').val(email);
    $('#email_id').val(email);
    if (isCompany(obj) && emailLogChk === false) {
        setLogScript('manager-info', 'e-mail', 'Email_input', 'Email_check');
        emailLogChk = true;
    }
    return true;

};

var checkBirth = function () {
    // if (!window.setBlurFlag) {
    //     return false;
    // }
    var channel = $('#channel').val();
    var $channel_birth = $('#' + channel + '_birth_date');
    var $msg = $('#' + channel + '_cyr_msg');
    var birth_date = $channel_birth.val().replace(/[^0-9]/gi, '');
    var $birth_date = $('#birth_date');
    var $birth_year = $('#birth_year'),
        $birth_month = $('#birth_month'),
        $birth_day = $('#birth_day')
    ;

    $birth_date.val('');

    if (birth_date.length !== 8) {
        $msg.html("YYYYMMDD<BR>생년월일 입력형식을 확인해주세요.").show();
        $birth_year.val('');
        $birth_month.val('');
        $birth_day.val('');
        return;
    }

    var birth_year_num = Number(birth_date.substr(0, 4));
    var birth_month_num = Number(birth_date.substr(4, 2));
    var birth_day_num = Number(birth_date.substr(6, 2));

    //년
    if (birth_year_num < 1900 || birth_year_num > $('#current_year').val()) {
        $msg.html('생년월일 입력형식을 확인해주세요.').show();
        return;
    }
    //월
    else if (birth_month_num < 1 || birth_month_num > 12) {
        $msg.html('생년월일 입력형식을 확인해주세요.').show();
        return;
    }
    //일
    else if (birth_day_num < 1 || birth_day_num > 31) {
        $msg.html('생년월일 입력형식을 확인해주세요.').show();
        return;
    }
    //성공
    else {
        $msg.hide();
    }

    $birth_date.val(birth_date.replace(/[^0-9]/gi, ''));
    $birth_year.val(birth_year_num);
    $birth_month.val(birth_month_num);
    $birth_day.val(birth_day_num);

    return true;
};

//휴대폰 번호 체크 (호출되는 곳 없음)
var phoneLogChk = false;
var chkPhoneNum = function (elt) {
    // if (!window.setBlurFlag)
    //     return false;
    // }
    var $msg_phone = $('#' + $('#channel').val() + '_phone_msg');
    var $cellnum = $('#cellnum');
    var cellNum = elt.value;
    var overseas_fl = $('#overseas_fl').val();
    var cellLen = cellNum.length,
        cell1 = $('#cell1'),
        cell2 = $('#cell2'),
        cell3 = $('#cell3')
    ;

    cell1.val('');
    cell2.val('');
    cell3.val('');
    $msg_phone.hide();

    if (cellNum === '' && overseas_fl !== "1") {
        $msg_phone.text('필수정보 입니다.').show();
        $cellnum.val('');
        return;
    }

    replacePhoneNum(elt);
    cellNum = elt.value;

    if ((!$.isNumeric(cellNum) || cellNum.length < 10 || cellNum.length > 11) && overseas_fl !== "1") {
        $msg_phone.text('휴대폰번호가 올바르지 않습니다.').show();
        return;
    }

    $cellnum.val(cellNum);
    if (cellLen === 10) {
        cell1.val(cellNum.substr(0, 3));
        cell2.val(cellNum.substr(3, 3));
        cell3.val(cellNum.substr(6));
    } else if (cellLen === 11) {
        cell1.val(cellNum.substr(0, 3));
        cell2.val(cellNum.substr(3, 4));
        cell3.val(cellNum.substr(7));
    }

    if (isCompany(elt) && phoneLogChk === false) {
        setLogScript('manager-info', 'cellphone-number');
        phoneLogChk = true;
    }
};

var replacePhoneNum = function (elt) {
    var maxLen = $('#overseas_fl').val() === "1" ? 30 : 11;
    elt.value = elt.value.replace(/[^0-9]/g, '');
    elt.value = elt.value.substr(0, maxLen);

};

var chkManagerName = function (obj) {
    var name_pattern = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\s]/gi;
    var inputVal = $.trim($(obj).val());
    var repInputVal = inputVal.replace(name_pattern, '');
    var $msg_corp_charge = $(obj).next('p');

    if (inputVal === '') {
        $(obj).next('p').text('필수정보 입니다.').show();
        return;
    }


    $(obj).val(repInputVal);
    $('#manager_nm').val(repInputVal);
};

function chkManagerNm(obj) {

    var inputVal = $.trim($(obj).val());
    var name_pattern = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\s]/gi;
    var $msg_corp_charge = $(obj).next('p');
    var $manager_nm = $('#manager_nm');
    var repInputVal = inputVal.replace(name_pattern, '');

    $msg_corp_charge.hide();

    if (inputVal === '') {
        $(obj).next('p').text('필수정보 입니다.').show();
        $manager_nm.val('');
        return;
    }

    if (name_pattern.test(inputVal)) {
        $msg_corp_charge.text('담당자명에는 특수문자, 숫자는 사용하실 수 없습니다').show();
    }
    $(obj).val(repInputVal);
    $manager_nm.val(repInputVal);

}



function chkEssentialFieldIsEmpty(elem, msgId) {
    var $msg_obj = jQuery('#' + msgId);
    $msg_obj.hide();
    if (jQuery(elem).val() === '') {
        $msg_obj.text('필수정보 입니다.').show();
        return false;
    }
    return true;
}

// 비밀번호 체크
var password1LogChk = false;
var verifyPasswdStrength = function (elmt) {
    var password = elmt.value;
    var formObj = $(elmt).parents('form');
    var $password1_warning_txt = formObj.find('#password1_warning_txt');
    var $password1_good_txt = formObj.find('#password1_good_txt');
    var id_val = formObj.find('#id').val();

    $password1_warning_txt.hide();
    $password1_good_txt.hide();

    if ($.trim(password) === '' || elmt.getAttribute('placeholder') === password) {
        $password1_warning_txt.html('<span class="less_important">8~16자리 영문 대소문자, 숫자, 특수문자 중 3가지 이상 조합</span>').show();
        return false;
    }

    if (password.length > 16) {
        $(elmt).val(password.substr(0, 16));
        $password1_warning_txt.html('<span class="less_important">8~16자리 영문 대소문자, 숫자, 특수문자 중 3가지 이상 조합</span>').show();
    }

    if (PasswordStrength.verify(password, "", id_val)) {
        //var testVal = PasswordStrength.verify(elmt.value, "", "");
        $password1_good_txt.text(PasswordStrength.getStrength()).show();
        if (isCompany(elmt) && password1LogChk === false) {
            setLogScript('account-info', 'password-confirm', 'Pwd_input', 'Pwd_check');
            password1LogChk = true;
        }
        return true;
    }
    $password1_warning_txt.html(PasswordStrength.getStrength() + '<br><span>' + PasswordStrength.getMessage() + '</span>').show();
    return false;
};

// var authMobile = {
//     replacePhoneNum : function(elt) {
//         var maxLen = $('#overseas_fl').val() === "1" ? 30 : 11;
//         elt.value = elt.value.replace(/[^0-9]/g, '');
//         elt.value = elt.value.substr(0, maxLen);
//     },
//     chkPhone : function(elt) {
//         if (!window.setBlurFlag) {
//             return false;
//         }
//
//         var $msg_phone = $('p[name="msg_phone"]');
//         var cellNum = elt.value;
//         $msg_phone.hide();
//
//         if (cellNum === '') {
//             $msg_phone.text('필수정보 입니다.').show();
//             return;
//         } else if (!$.isNumeric(cellNum) || cellNum.length < 10  || cellNum.length > 11) {
//             $msg_phone.text('휴대폰번호가 올바르지 않습니다.').show();
//             return;
//         }
//
//         $('#cellnum').val(cellNum);
//     }
// };

// 체크박스 컨트롤
var toggleChkBox = function (id, obj) {
    var formObj = $(obj).parents('form');

    var obj_chk = formObj.find('#' + id + '_fl');
    if ($(obj_chk).val() === 'n') {
        $(obj_chk).val('y');
        //obj_chk.value = 'y';
    } else {
        $(obj_chk).val('n');
        //obj_chk.value = 'n';
    }
};

function regCominfoView() {
    var csn = $('#corp_code').val();
    var reg = /-/gi;
    csn = csn.replace(reg, '');
    window.open('/zf_user/company-info/view?csn=' + csn);
};

function selectOverseaCom() {
    $('#overseas_csn').show();
    $('#temporary_csn_type').val('waiting');
};

function selectWaitingCsn() {
    $('#overseas_csn').hide();
    $('#temporary_csn_type').val('overseas');
};

function noticePopUp(popupName) {
    $('#' + popupName).addClass('opened');
};

function closeNoticePopUp(popupName) {
    $('#' + popupName).removeClass('opened');
};

function hideNoticeTxt() {
    $('#msg_corp_code_1').hide();
    $('#msg_corp_code_2').hide();
    $('#nice_notice_txt').hide();
    $('#saramin_notice_txt').hide();
    $('#first_notice_txt').hide();
};

function existsCompanyinfoSearch() {
    var csn = $('#corp_code').val();

    if (!csn) {
        alert('필수 인자값이 없습니다.');
        return;
    }

    var url = '/zf_user/member/registration/search-csn-ajax';

    try {
        $.ajax({
            type: "POST",
            url: url,
            data: {csn: csn},
            dataType: "json",
            success: function (json) {
                if (json.status == 'success') {
                    hideNoticeTxt();
                    $('#saramin_notice_txt').show();
                } else {
                    hideNoticeTxt();
                    $('#first_notice_txt').show();
                }
            },
            error: function (e) {
                alert('정보 호출에 실패하였습니다.!!!!' + e.responseText);
            }
        });
    } catch (e) {
        return false;
    }
}

// -------------

function isCompany(obj) {
    var form = $(obj).closest('form').attr('name');
    if (form === 'c_frm') {
        return true;
    } else {
        return false;
    }
}

/**
 * 기업회원 가입시 호출하는 와이즈로그, Google Analytics 스크립트
 * @param wl_action
 * @param wl_optlabel
 * @param ga_eventflow
 * @param ga_eventlabel
 */
function setLogScript(wl_action, wl_optlabel, ga_eventflow, ga_eventlabel) {
    if (wl_action != null && wl_optlabel != null) {
        try{n_trackEvent('join', wl_action, wl_optlabel);}catch(e){}
    }

    if (ga_eventflow != null && ga_eventlabel != null) {
        try {
            dataLayer.push({
                'event': 'ga_lead',
                'category': 'company_join',
                'event-flow': ga_eventflow,
                'event-label': ga_eventlabel
            })
        } catch (e) {
        }
    }
}

// -----------

var JOIN = {};

/**
 * 만 나이 계산
 * @param birthDate
 * @returns {number|*}
 */
var getAmericanAge = function (birthDate) {
    var age;
    var year = String(birthDate).substring(0, 4);
    var mmdd = String(birthDate).substring(4, 6) + String(birthDate).substring(6, 8);

    var d = new Date();
    var tmonth = d.getMonth() + 1;
    var tdate = d.getDate();

    var today = String((tmonth < 10) ? '0' + tmonth : tmonth) + String((tdate < 10) ? '0' + tdate : tdate);

    age = d.getFullYear() - parseInt(year, 10) + 1;

    if (today < mmdd) {
        age = age - 2;
    } else {
        age = age - 1;
    }

    return age;
};

var autoEmail = function (email) {
    var $ = jQuery;
    var $email_list = $('.' + autoEmailForm()).find('.email_list');
    var $li = $email_list.find('li');
    var email_split = email.split('@');

    $('.auto_list .txt_input').html(email_split[0]);
    $email_list.show();
    $li.show();
    if (email.indexOf('@') !== -1) {
        $.each($li, function (index, value) {
            var inputEmail = value.innerText.match(/[a-zA-Z]+\.+[a-zA-Z]{2,}/g)[0];
            if (inputEmail.indexOf(email_split[1]) !== 0) {
                $($li[index]).hide();

            }
        });
    }

    if (!$li.is(':visible')) {
        $email_list.hide();
    }
};

var autoEmailForm = function () {
    var channel = jQuery('#channel').val();
    var div_str = 'identify_phone';
    if (channel === 'mail') {
        div_str = 'identify_mail'
    } else if (channel === 'ipin') {
        div_str = 'identify_pin'
    } else if (channel === 'social') {
        div_str = 'identify_social';
    }
    return div_str;
};

// 스크롤 고정 처리
var scrollLockup = function () {
    var $ = jQuery;
    var scrollTop = $(window).scrollTop();
    var h = function () {
        $(window).scrollTop(scrollTop);
    };
    $(window).scroll(h);
    setTimeout(function () {
        $(window).off("scroll", h);
    }, 500);
};

var personFrmCheck = function () {

    var $ = jQuery;
    var form = $('#frm'),
        $idCheckMsg1 = $('#idCheckMsg1'),
        $idCheckMsg2 = $('#idCheckMsg2'),
        $id = $('#id'),
        $password1_warning_txt = $('#password1_warning_txt'),
        $password1_good_txt = $('#password1_good_txt'),
        $password1 = $('#password1'),
        $user_nm_msg = $('p[name="user_nm_msg"]'),
        channel = $('#channel').val(),
        $user_nm = $('#' + channel + '_user_nm'),
        $cyr_msg = $('#cyr_msg'),
        $birth_date = $('#' + channel + '_birth_date'),
        $cellnum = $('#' + channel + '_cellnum'),
        $email = $('#' + channel + '_email_id'),
        $phone_msg = $('#phone_msg'),
        $overseas_fl = $('#overseas_fl'),
        $confirm_status = $('#confirm_status'),
        $msg_email1 = $('#msg_email1'),
        $address_sebu = $('#address_sebu'),
        $id_chk_ok = $('#id_chk_ok')
    ;

    $idCheckMsg1.hide();
    $idCheckMsg2.hide();
    if ($.trim($id.val()) === '') {
        alert('아이디를 입력해 주세요.');
        $id.focus();
        $idCheckMsg1.text('필수정보 입니다.').show();
        return false;
    } else if ($id_chk_ok.val() == '1') {
        $idCheckMsg2.show();
    } else if ($id_chk_ok.val() != '1') {
        alert('다른 아이디를 입력해 주세요.');
        $id.focus();
        idExsistCheck($.trim($id.val()));
        return false;
    }

    $password1_warning_txt.hide();
    // $password1_good_txt.hide();
    if ($.trim($password1.val()) === '') {
        alert('비밀번호를 입력해주세요.');
        $password1.focus();
        $password1_warning_txt.text('필수정보 입니다.').show();
        return false;
    }

    // PasswordStrength
    var passwd1 = $password1.val();
    if (passwd1 && false === PasswordStrength.verify(passwd1, "", $id.val())) {
        alert('비밀번호를 다시 입력해 주세요.');
        $password1.focus();
        $password1_warning_txt.html(PasswordStrength.getStrength() + '<br><span>' + PasswordStrength.getMessage() + '</span>').show();
        return false;
    }

    // 휴대폰 인증이 안되어 있는 경우 체크
    if ($confirm_status.val() !== 'complete') {
        alert('인증을 완료하세요.');
        location.href = '#pos_cert_num';
        return false;
    }

    $user_nm_msg.hide();
    if ($.trim($user_nm.val()) === '') {
        alert('이름을 입력해주세요.');
        $user_nm.attr('readonly', false);
        $user_nm.focus();
        $user_nm_msg.text('필수정보 입니다.').show();
        return false;
    }

    var name_pattern = /[#\&\-%@=\/\\\:;,'\"\^`~\_|\!\?\*$\[\]\{\}0-9]/;
    if (name_pattern.test($user_nm.val()) === true) {
        alert('이름에 특수문자, 숫자는 사용하실 수 없습니다.');
        $user_nm.attr('readonly', false);
        $user_nm.focus();
        $user_nm_msg.text('이름에 특수문자, 숫자는 사용하실 수 없습니다.').show();
        return false;
    }

    $cyr_msg.hide();
    var birth_year = $('#birth_year').val(),
        birth_month = $('#birth_month').val(),
        birth_day = $('#birth_day').val();

    if (birth_year === '' || birth_year < 1900) {
        alert('생년월일을 입력해주세요..');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }
    if (birth_month === '' || birth_month < 1 || birth_month > 12) {
        alert('생년월일을 입력해주세요.');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }
    if (birth_day === '' || birth_day < 1 || birth_day > 31) {
        alert('생년월일을 입력해주세요.');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }

    if (getAmericanAge(birth_year + birth_month + birth_day) < 15) {
        alert('만 15세 이상만 가입할 수 있습니다.');
        $birth_date.focus();
        return false;
    }

    $phone_msg.hide();
    if ($overseas_fl.val() != '1') {
        var celNum = $cellnum.val();
        var celNumLen = celNum.length;
        if (celNum === '' || celNumLen < 10 || celNumLen > 11) {
            alert('휴대폰 번호를 확인해주세요.');
            $cellnum.focus();
            $phone_msg.text('필수정보 입니다.').show();
            return false;
        }
    }

    $msg_email1.hide();
    if ($email.val() === '') {
        alert('이메일을 입력해 주세요.');
        $email.focus();
        $msg_email1.text('필수정보 입니다.').show();
        $('#msg_email2').hide();
        return false;
    } else if ($email.val() !== '' && $email.val().search(/^[0-9a-z._+-]+@([0-9a-z_-]+\.)+[a-z]{2,10}$/i) == -1) {
        alert('이메일 주소를 다시 확인해주세요.');
        $email.focus();
        $msg_email1.text('이메일 주소를 다시 확인해주세요.').show();
        return false;
    }

    $('#tc_msg').hide();
    if ($('#tc_1_fl').val() === 'n' || $('#tc_2_fl').val() === 'n') {
        alert('약관에 동의해 주세요.');
        location.href = "#person_terms_title"; //bkm 2015.09.10
        return false;
    }

    //정보보유기간
    if ($('input[name="dormancy_term"]:checked').length === 0) {
        alert('정보보유기간을 선택해주세요.');
        return false;
    }

    if ($address_sebu.val() != '상세주소') {
        $('#address_details').val($address_sebu.val());
    }

    //bkm 2015.09.08
    //주소, 성별 동의를 언체크하면 값 넘기지 않기
    if (!$('#agreeSelectiveAddress').is(':checked')) {
        $('#zipcode1').val('');
        $('#zipcode2').val('');
        $('#zipcode').val('');
        $('#address').val('');
        $('#address_details').val('');
        $('#old_address').val('');
        $('#old_zipcode').val('');
        $('#old_address_details').val('');
        $('#new_address').val('');
        $('#new_zipcode').val('');
        $('#new_address_details').val('');
        $('#new_address_extra').val('');
    } else {
        // 해외 주소인 경우 강제로 구주소로 입력해준다.
        if ($('#check_global').is(':checked')) {
            var globalAddress = $('#address').val();
            var globalZipcode = $('#zipcode').val();

            if (!globalZipcode) {
                alert('국가를 선택해 주세요.');
                return false;
            } else {
                $('#old_address').val(globalAddress);
                $('#old_zipcode').val(globalZipcode);
                $('#old_address_details').val('');
                $('#new_address').val('');
                $('#new_zipcode').val('');
                $('#new_address_details').val('');
                $('#new_address_extra').val('');
                $('#address_sido').val('');
                $('#address_sigungu').val('');
                $('#x_coordinate').val('');
                $('#y_coordinate').val('');
                $('#zip_use_type').val('J');
            }
        }
    }

    // 입력한 주소가 없을때 공백처리
    if (!$('#address').val()) {
        if (confirm("기본(상세)주소가 입력되지 않았습니다. 계속 하시겠습니까?")) {
            $('#old_address').val('');
            $('#old_zipcode').val('');
            $('#new_address').val('');
            $('#new_zipcode').val('');
            $('#new_address_details').val('');
            $('#new_address_extra').val('');
            $('#address_sido').val('');
            $('#address_sigungu').val('');
            $('#x_coordinate').val('');
            $('#y_coordinate').val('');
            $('#zip_use_type').val('J');
        } else {
            return false;
        }
    }

    if (!$('#agreeSelectiveGender').is(':checked')) {
        $('#sex').val('');
    }

    form.submit();
};


var personSocialFrmCheck = function () {
    var $ = jQuery;
    var $user_nm_msg = $('p[name="user_nm_msg"]'),
        $user_nm = $('#social_user_nm'),
        $cyr_msg = $('#cyr_msg'),
        $birth_date = $('#social_birth_date'),
        $cellnum = $('#social_cellnum'),
        $email = $('#social_email_id'),
        $phone_msg = $('#phone_msg'),
        $overseas_fl = $('#overseas_fl'),
        $msg_email1 = $('#msg_email1')
    ;

    $msg_email1.hide();
    if ($email.val() === '') {
        alert('이메일을 입력해 주세요.');
        $email.focus();
        $msg_email1.text('필수정보 입니다.').show();
        $('#msg_email2').hide();
        return false;
    } else if ($email.val() !== '' && $email.val().search(/^[0-9a-z._+-]+@([0-9a-z_-]+\.)+[a-z]{2,10}$/i) == -1) {
        alert('이메일 주소를 다시 확인해주세요.');
        $email.focus();
        $msg_email1.text('이메일 주소를 다시 확인해주세요.').show();
        return false;
    }

    $user_nm_msg.hide();
    if ($.trim($user_nm.val()) === '') {
        alert('이름을 입력해주세요.');
        $user_nm.attr('readonly', false);
        $user_nm.focus();
        $user_nm_msg.text('필수정보 입니다.').show();
        return false;
    }

    var name_pattern = /[#\&\-%@=\/\\\:;,'\"\^`~\_|\!\?\*$\[\]\{\}0-9]/;
    if (name_pattern.test($user_nm.val()) === true) {
        alert('이름에 특수문자, 숫자는 사용하실 수 없습니다.');
        $user_nm.attr('readonly', false);
        $user_nm.focus();
        $user_nm_msg.text('이름에 특수문자, 숫자는 사용하실 수 없습니다.').show();
        return false;
    }

    $cyr_msg.hide();
    var birth_year = $('#birth_year').val(),
        birth_month = $('#birth_month').val(),
        birth_day = $('#birth_day').val();

    if (birth_year === '' || birth_year < 1900) {
        alert('생년월일을 입력해주세요..');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }
    if (birth_month === '' || birth_month < 1 || birth_month > 12) {
        alert('생년월일을 입력해주세요.');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }
    if (birth_day === '' || birth_day < 1 || birth_day > 31) {
        alert('생년월일을 입력해주세요.');
        $birth_date.focus();
        $cyr_msg.text('필수정보 입니다.').show();
        return false;
    }

    if (getAmericanAge(birth_year + birth_month + birth_day) < 15) {
        alert('만 15세 이상만 가입할 수 있습니다.');
        $birth_date.focus();
        return false;
    }

    $phone_msg.hide();
    if ($overseas_fl.val() != '1') {
        var celNum = $cellnum.val();
        var celNumLen = celNum.length;
        if (celNum === '' || celNumLen < 10 || celNumLen > 11) {
            alert('휴대폰 번호를 확인해주세요.');
            $cellnum.focus();
            $phone_msg.text('필수정보 입니다.').show();
            return false;
        }
    }

    $('#tc_msg').hide();
    if ($('#tc_1_fl').val() === 'n' || $('#tc_2_fl').val() === 'n') {
        alert('약관에 동의해 주세요.');
        location.href = "#person_terms_title"; //bkm 2015.09.10
        return false;
    }

    if ($('input[name="dormancy_term"]:checked').length === 0) {
        alert('개인정보 유효기간을 선택하여 주십시요.');
        return false;
    }

    $('#social_frm').submit();
};

var autoEmailSelect = function (elt) {
    var mail = $.trim($(elt).text());

    $('#' + $('#channel').val() + '_email_id').val(mail);
    chkEmail(elt);
    $('.email_list').hide();
};

