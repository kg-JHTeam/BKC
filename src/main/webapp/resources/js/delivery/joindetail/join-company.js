
jQuery(function ($) {

    //var patten = /[#\&\-%@=\/\\\:;,'\"\^`~\_|\!\?\*$\[\]\{\}0-9]/;
    var id_patten = /[^a-z0-9\_]/gi,
        num_only_patten = /[^0-9]/g,
        $idCheckMsg1 = $('#idCheckMsg1'),
        $idCheckMsg2 = $('#idCheckMsg2'),
        $password1_warning_txt = $('#password1_warning_txt')
        // key
    ;
    var timeConfirm = null;

    $('.email_list').hide();

    $('#c_frm')
        .on('keydown', 'input[type="text"], input[type="password"], input[type="number"]', function (e) {
            if (e.keyCode === 13) {
                e.stopPropagation();
                return false;
            }
        })
        .on('keyup', '#corp_code', function(e) {
            var corp_code = this.value;
            if (e.keyCode !== 8 && corp_code !== '') {
                if (/[^0-9\-]/.test(corp_code)) {
                    $('#msg_corp_code_1').text('사업자번호는 숫자만 입력해주세요.').show();
                }
                this.value = autoHyphen(corp_code);
            }

            if (!!timeConfirm) {
                clearTimeout(timeConfirm);
            }
            timeConfirm = setTimeout(function() {
                if (corp_code.length === 12 && enterprise.chkCorpCode(e.currentTarget)) {
                    enterprise.membercompanyConfirm();
                    //$('#msg_corp_code_1').hide();
                }
            }, 200)
        })
        .on('blur', '#corp_code', function() {
            if (!!this.value) {
                this.value = autoHyphen(this.value);
            }

            if ($('#confirmFlag').val() === 'n' && enterprise.chkCorpCode(this)) {
                enterprise.membercompanyConfirm();
            }
        })
        .on('blur', '#company_nm', function() {
            enterprise.chkCompanyName(this);
        })
        .on('keyup', '#ceo_nm', function() {
            var ceo_nm = this.value;
            var $msg_area = $('#msg_ceo_nm');
            if (/[^ㄱ-ㅎ가-힣a-zA-Z\/.,]/.test(ceo_nm)) {
                $msg_area.html('대표자명에 특수문자, 숫자는 사용하실 수 없습니다.').show();
                this.value = ceo_nm.replace(/[^ㄱ-ㅎ가-힣a-zA-Z\/.,]/g, '');
            } else if (this.value !== '') {
                $msg_area.hide();
            }
        })
        .on('blur', '#ceo_nm', function() {
            enterprise.chkCeoName(this);
        })
        .on('keyup', '#employ_agent_number', function() {
            this.value = this.value.replace(num_only_patten, '');
        })
        .on('blur', '#employ_agent_number', function() {
            this.value = this.value.replace(num_only_patten, '');
        })
        .on('keyup', 'input[name="tmp_email_id"]', function(e) {
            if (this.value === '' || $('#btn_mail_identify').hasClass('on')) {
                $('.email_list').hide();
                return;
            }

            if (e.keyCode === 40) {
                $(e.currentTarget).closest('.email_column').find('.auto_list > a').filter(':visible').eq(0).focus();
            }
            autoEmail(this.value);
        })
        // 기업회원 이메일 유효성 체크
        .on('blur', 'input[name="tmp_email_id"]', function () {

            $('body').off('click').on('click', function (e) {
                if (!$(e.target).hasClass("email_domain")) {
                    $('.email_list').hide();
                }
            });

            if ($(this).closest('ul').find('.auto_list > a').filter(':visible').length === 0) {
                chkEmail(this);
            }

        })
        .on('change', 'input[name="tmp_email_id"]', function (e) {
            chkEmail(this);
        })
        .on('keydown', '.auto_list', function (e) {
            if (e.keyCode === 13) {
                autoEmailSelect(this);
            }
            return false;
        })
        .on('click', '.auto_list', function () {
            autoEmailSelect(this);
        })
        .on('keyup', '.auto_list', function(e) {
            var $ul = $(e.currentTarget).closest('ul');
            var $li = $ul.find('.auto_list > a').filter(':visible');
            var index = $li.index($(e.currentTarget).children());

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
        .on('keyup', 'input[name="tmp_cellnum"]', function() {
            if (/[^0-9]/g.test(this.value)) {
                chkPhoneNum(this);
            }
        })
        .on('change blur', 'input[name="tmp_cellnum"]', function() {
            chkPhoneNum(this);
        })
        .on('keyup', 'input[name="tmp_manager_nm"]', function() {
            var name_pattern = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\s]/gi;
            if (name_pattern.test(this.value)) {
                chkManagerNm(this);
            }
        })
        .on('change blur', 'input[name="tmp_manager_nm"]', function(e) {
            chkManagerNm(this);
        })
        .on('click', 'button[name="btn_desire_industry"]', function() {
            $('div[data-layer_id="desire_industry"]').show();
        })
        .on('keyup', '#id', function () {
            var inputVal = this.value;
            if (id_patten.test(inputVal)) {
                $idCheckMsg1.text('4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능').show();
                this.value = inputVal.replace(id_patten, '');
            }
        })
        .on('focusout', '#id', function () {
            $idCheckMsg1.show();
            $idCheckMsg2.hide();
        })
        .on('blur', '#id', function() {
            idExsistCheck(this.value);
        })
        .on('focus', '#id', function () {
            $idCheckMsg1.html('<span class="less_important">4 ~ 20자의 영문, 숫자와 특수문자(_)만 사용 가능</span>').show();
            $idCheckMsg2.hide();
        })
        .on('keyup', '#password1', function(e) {
            verifyPasswdStrength(e.currentTarget);
        })
        .on('blur', '#password1', function(e) {
            verifyPasswdStrength(e.currentTarget);
        })
        .on('focus', '#password1', function () {
            if (this.value === '') {
                $password1_warning_txt.html('<span class="less_important">8~16자리 영문 대소문자, 숫자, 특수문자 중 3가지 이상 조합</span>').show();
                $('#password1_good_txt').hide();
            }
        })
        .on('click', '#btn_submit', function () {
            enterprise.companySubmitChk();
        })
    ;

    /* 동의 체크 (기업) */
    $('.check_custom_company').toggle(
        function () {
            $(this).addClass('check_on').removeClass('check_off').children('input').attr('checked', 'checked');
        },
        function () {
            $(this).addClass('check_off').removeClass('check_on').children('input').removeAttr('checked');
        }
    ).click(
        function () {
            var $frm = $('#c_frm');
            if ($frm.find('#agree_rule2').is(':checked')
                && $frm.find('#agree_take2').is(':checked')
                && $frm.find('#agree_sms2').is(':checked')
                && $frm.find('#corpAgree').is(':checked')
                && $frm.find('#reject_sms_fl').is(':checked')) {
                $frm.find('#agreeAllCompany').parents().addClass('check_on').removeClass('check_off').children('input').attr('checked', 'checked');
                $frm.find('#hidden_check_all').val('1');
                $frm.find('#hidden_check_all_company').val('1')
            } else {
                $frm.find('#agreeAllCompany').parents().addClass('check_off').removeClass('check_on').children('input').removeAttr('checked');
                $frm.find('#hidden_check_all').val('0');
                $frm.find('#hidden_check_all_company').val('0')
            }
        }
    );

    /* 전체 동의 (기업) */
    //bkm 2015.09.08
    $('.check_all_company').on('click',
        function () {
            var $frm = $('#c_frm');
            var $agree_rule2 = $frm.find('#agree_rule2');
            var $agree_take2 = $frm.find('#agree_take2');
            var $agree_sms2 = $frm.find('#agree_sms2');
            var $corpAgree = $frm.find('#corpAgree');
            var $reject_sms_fl = $frm.find('#reject_sms_fl');
            var $hidden_check_all_company = $frm.find('#hidden_check_all_company');

            if ($hidden_check_all_company.val() == '0') {
                //일단 다 끈다.
                if ($agree_rule2.is(':checked')) $agree_rule2.trigger('click');
                if ($agree_take2.is(':checked')) $agree_take2.trigger('click');
                if ($agree_sms2.is(':checked')) $agree_sms2.trigger('click');
                if ($corpAgree.is(':checked')) $corpAgree.trigger('click');
                if ($reject_sms_fl.is(':checked')) $reject_sms_fl.trigger('click');

                $hidden_check_all_company.val('1');
            } else {
                //일단 다 킨다.
                if (!$agree_rule2.is(':checked')) $agree_rule2.trigger('click');
                if (!$agree_take2.is(':checked')) $agree_take2.trigger('click');
                if (!$agree_sms2.is(':checked')) $agree_sms2.trigger('click');
                if (!$corpAgree.is(':checked')) $corpAgree.trigger('click');
                if (!$reject_sms_fl.is(':checked')) $reject_sms_fl.trigger('click');

                $hidden_check_all_company.val('0');
            }

            //다 킨거나 끈다.
            $agree_rule2.trigger('click');
            $agree_take2.trigger('click');
            $agree_sms2.trigger('click');
            $corpAgree.trigger('click');
            $reject_sms_fl.trigger('click');
        }
    );

    function autoHyphen(corpCode)
    {
        var code = corpCode.replace(/[^0-9]/g, '');
        if (code.length < 4) {
            return code;
        }

        var tmp = code.substr(0, 3);
        tmp += '-';
        tmp += code.substr(3, 2);
        tmp += '-';
        tmp += code.substr(5);
        return tmp;
    }

});