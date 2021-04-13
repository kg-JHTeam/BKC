/* --- options for jshint --- */
/*global alert:false*/
/*global confirm:false*/
/*global idExsistCheck:false*/
/*global PasswordStrength:false*/
/*global resetCompanyData:false*/
/*global IndustryCategoryLayer:false*/
/*global AutoCompleteClass:false*/
/*global jQuery:false*/
/*global Saramin:false*/
/*jshint -W100*/


var enterprise = (function($) {

    function isValidCsn (csn1, csn2, csn3) {
        var csn_value = new Array(10);

        if (jQuery.isNumeric(csn1, 3) === false) {
            return false;
        }

        if (jQuery.isNumeric(csn2, 2) === false) {
            return false;
        }

        if (jQuery.isNumeric(csn3, 5) === false) {
            return false;
        }

        var fullCsn = csn1 + "-" + csn2 + "-" + csn3;
        var li_temp, li_lastid;

        if (fullCsn === "000-00-00000" || fullCsn.length !== 12) {
            return false;
        }

        csn_value[0] = (parseFloat(fullCsn.substring(0, 1)) * 1) % 10;
        csn_value[1] = (parseFloat(fullCsn.substring(1, 2)) * 3) % 10;
        csn_value[2] = (parseFloat(fullCsn.substring(2, 3)) * 7) % 10;
        csn_value[3] = (parseFloat(fullCsn.substring(4, 5)) * 1) % 10;
        csn_value[4] = (parseFloat(fullCsn.substring(5, 6)) * 3) % 10;
        csn_value[5] = (parseFloat(fullCsn.substring(7, 8)) * 7) % 10;
        csn_value[6] = (parseFloat(fullCsn.substring(8, 9)) * 1) % 10;
        csn_value[7] = (parseFloat(fullCsn.substring(9, 10)) * 3) % 10;
        li_temp = parseFloat(fullCsn.substring(10, 11)) * 5 + "0";
        csn_value[8] = parseFloat(li_temp.substring(0, 1)) + parseFloat(li_temp.substring(1, 2));
        csn_value[9] = parseFloat(fullCsn.substring(11, 12));
        li_lastid = (10 - ( ( csn_value[0] + csn_value[1] + csn_value[2] + csn_value[3] + csn_value[4] + csn_value[5] + csn_value[6] + csn_value[7] + csn_value[8] ) % 10 ) ) % 10;

        return csn_value[9] === li_lastid;
    }

    function chkEssentialFieldIsEmpty(elem, msgId) {
        var $msg_obj = $('#' + msgId);
        var value = $.trim($(elem).val());

        $msg_obj.hide();
        if (value === '') {
            $msg_obj.text('필수정보 입니다.').show();
        } else {
            return true;
        }
    }

    function chkCompanyName(obj) {
        var check = chkEssentialFieldIsEmpty(obj, 'msg_company_name');
        if (check === true) {
            setLogScript('com-info', 'corporate-name');
        }
    }

    function chkCeoName(obj) {
         var name_pattern = /[^ㄱ-ㅎ가-힣a-zA-Z\s\/.,]/gi;
        var check = chkEssentialFieldIsEmpty(obj, 'msg_ceo_nm');
        var inputVal = $.trim($(obj).val());
        var $msg_ceo_nm = $('#msg_ceo_nm');

        if (inputVal !== '' && name_pattern.test(inputVal) === true) {
            $msg_ceo_nm.hide();
            $msg_ceo_nm.text('대표자명에 특수문자, 숫자는 사용하실 수 없습니다.').show();
            $(obj).val(inputVal.replace(name_pattern, ''));
        } else if (check === true) {
            setLogScript('com-info', 'president-name');
        }
    }



    // @todo 여기 정리가 필요함.
    /**
     * 사업자 번호 형식 체크 후 나이스 정보 요청.
     * @param corpCodeEl
     */
    function chkCorpCode(elt) {
        // if (!window.setBlurFlag) {
        //     return;
        // }

        var corpCode = $(elt).val().replace(/[^0-9]/g, ''),
            $msg_corp_code_1 = $('#msg_corp_code_1'),
            $msg_corp_code_2 = $('#msg_corp_code_2'),
            $business = $('#business'),
            $confirmFlag = $('#confirmFlag'),
            csn1 = corpCode.substr(0, 3),
            csn2 = corpCode.substr(3, 2),
            csn3 = corpCode.substr(5, 5)
        ;

        if (corpCode.length > 0 && corpCode.length != 10) {
            $business.val('');
            $msg_corp_code_2.hide();
            $msg_corp_code_1.text('올바른 사업자번호가 아닙니다.').show();
            $confirmFlag.val('n');
            setCompanyData('');
            return false;
        }

        $msg_corp_code_1.hide();
        $msg_corp_code_2.hide();
        $('#msg_ceo_nm').hide();
        $('#msg_company_name').hide();

        if (corpCode === '') {
            $msg_corp_code_1.text('사업자 등록번호를 입력하세요').show();
            $confirmFlag.val('n');
            return false;
        }

        if (corpCode === '0000000000') {
            $msg_corp_code_1.text('올바른 사업자번호가 아닙니다.').show();
            $confirmFlag.val('n');
            setCompanyData('');
            return false;
        }

        // 임시 사업자 번호 csn2가 00 이면 예외 처리
        if (csn2 != '00') {
            if (!isValidCsn(csn1, csn2, csn3)) {
                $business.val('');
                $msg_corp_code_2.hide();
                $msg_corp_code_1.text('올바른 사업자번호가 아닙니다.').show();
                $confirmFlag.val('n');
                setCompanyData('');
                return false;
            }
        }

        $('#csn1').val(csn1);
        $('#csn2').val(csn2);
        $('#csn3').val(csn3);

        if ($confirmFlag.val() === 'y') {
            if (corpCode !== $business.val()) {
                $confirmFlag.val('n');
                $business.val('');
            }
        }

        // enterprise.membercompanyConfirm();
        return true;

    }

    function companySubmitChk() {
        var $form = $('#c_frm'),
            $corp_code = $('#corp_code'),
            $confirmFlag = $('#confirmFlag'),
            $id = $('#id'),
            $password1 = $('#password1'),
            $ceo_nm = $('#ceo_nm'),
            $company_nm = $('#company_nm'),
            $msg_corp_code_1 = $('#msg_corp_code_1'),
            $password1_warning_txt = $('#password1_warning_txt'),
            $msg_ceo_nm = $('#msg_ceo_nm'),
            $msg_company_name = $('#msg_company_name'),
            $idCheckMsg1 = $('#idCheckMsg1'),
            $idCheckMsg2 = $('#idCheckMsg2'),
            $password1_good_txt = $('#password1_good_txt'),
            channel = $('#channel').val(),
            $corp_charge = $('#' + channel + '_corp_charge'),
            $cellnum = $('#' + channel + '_cellnum'),
            $email = $('#' + channel + '_email_id'),
            $cell1 = $('#cell1'),
            $cell2 = $('#cell2'),
            $cell3 = $('#cell3'),
            $none_corporate_fl = $('#noneCorporateNum'),
            $joinMethod = $('#join_method').val()
        ;

        var $msg_corp_charge = $('msg_corp_charge');
        var $msg_phone = $('p[name="msg_phone"]');
        var email = $email.val();
        var $msg_email = $('#msg_email');
        var name_pattern = /[^ㄱ-ㅎ가-힣a-zA-Z\s]/gi;

        $('#msg_corp_code_1, #msg_corp_code_2').hide();
        if (!$none_corporate_fl.is(':checked')) {
            if ($corp_code.val() === '') {
                $msg_corp_code_1.text('사업자 등록번호를 입력하세요.').show();
                alert('사업자 등록번호를 입력하세요.');
                $corp_code.focus();
                return false;
            } else if ($confirmFlag.val() === 'n') {
                $msg_corp_code_1.text('기업 인증 확인을 해주세요').show();
                alert('기업 인증 확인을 해주세요');
                $corp_code.focus();
                return false;
            } else if ($confirmFlag.val() === 'y' && $('#business').val() !== $('#csn1').val() + $('#csn2').val() + $('#csn3').val()) {
                $confirmFlag.val('n');
                $msg_corp_code_1.text('기업 인증 확인을 해주세요').show();
                alert('기업 인증 확인을 해주세요');
                $corp_code.focus();
                return false;
            }
        }

        var company_nm_val = $.trim($company_nm.val());
        $msg_company_name.hide();
        if (company_nm_val === '' || company_nm_val === '회사명') {
            $msg_company_name.show();
            alert('기업명을 입력해주세요.');
            $company_nm.focus();
            return false;
        }

        $msg_ceo_nm.hide();
        if ($ceo_nm.val() === '' || $ceo_nm.val() === '대표자명') {
            $msg_ceo_nm.show();
            alert('대표자명을 입력해 주세요.');
            $ceo_nm.focus();
            return false;
        }

        if (/[^ㄱ-ㅎ가-힣a-zA-Z\s\/.,]/gi.test($ceo_nm.val()) === true) {
            $msg_ceo_nm.text('대표자명에 특수문자, 숫자는 사용하실 수 없습니다.').show();
            alert('대표자명에 특수문자, 숫자는 사용하실 수 없습니다.');
            $ceo_nm.focus();
            return false;
        }

        if ($('#confirm_notify_type').val() == 'unregistered') {
            var $msg_industry_category = $('#msg_industry_category');
            $msg_industry_category.hide();
            if ($('#industry_code').val() === '') {
                $msg_industry_category.text("업종을 선택하세요").show();
                alert('업종을 선택하세요');
                $('html, body').animate({scrollTop : $("#industry_regist_btn").offset().top}, 400);
                return false;
            }
            if ($('#industry_keyword').val() === '') {
                $msg_industry_category.text("업종 키워드를 선택하세요").show();
                alert('업종 키워드를 선택하세요');
                $('html, body').animate({scrollTop : $("#industry_regist_btn").offset().top}, 400);
                return false;
            }
        }

        var $msg_company_cd = $('#msg_company_cd');
        var $company_cd = $('input[name="company_cd"]');
        $msg_company_cd.hide();
        if ($company_cd.val() === '') {
            $msg_company_cd.text("기업구분을 선택하세요").show();
            alert('기업구분을 선택하세요');
            $('html, body').animate({scrollTop : $("#div_choice_company_cd").offset().top}, 400);
            return false;
        }

        var $employ_agent_number = $('#employ_agent_number');
        var $employ_agent_num = $('#employ_agent_num');
        if ($employ_agent_number.val() !== '' && $employ_agent_number.val() !== '유료 직업소개 사업 등록번호') {
            $employ_agent_num.val($employ_agent_number.val());
        } else {
            $employ_agent_num.val('');
        }

        if ($joinMethod !== 'sreg') {
            if ($('#mail_confirm_complete').val() !== 'y' && $('#sms_confirm_complete').val() !== 'y' && $('#ipin_confirm_complete').val() !== 'y') {
                alert('담당자 인증을 해 주세요.');
                $('html, body').animate({scrollTop: $("#pos_cert_num").offset().top}, 400);
                return false;
            }

            if ($email.val() === '') {
                $msg_email.text('이메일 주소를 입력하세요.').show();
                alert('이메일 주소를 입력하세요.');
                $email.focus();
                return false;
            } else if (validateEmail(email) === false) {
                $msg_email.text('이메일 형식이나 도메인이 올바르지 않습니다.').show();
                alert('이메일 형식이나 도메인이 올바르지 않습니다.');
                $email.focus();
                return false;
            } else if (validateDomain(email) === false) {
                var msg = "입력하신 이메일 도메인 주소가 .co 또는 .cm 이 맞으면 확인,\n\n틀리다면 취소를 눌러 주시기 바랍니다.";
                if (!confirm(msg)) {
                    $email.focus();
                    return false;
                }
            }


            $msg_corp_charge.hide();
            if ($corp_charge.val() === '') {
                $msg_corp_charge.text('담당자명을 입력해주세요.');
                alert('담당자명을 입력해주세요.');
                $corp_charge.focus();
                return false;
            }

            if (name_pattern.test($corp_charge.val()) === true) {
                $msg_corp_charge.text('담당자명에 특수문자, 숫자는 사용하실 수 없습니다.').show();
                alert('담당자명에 특수문자, 숫자는 사용하실 수 없습니다.');
                $corp_charge.focus();
                return false;
            }

            $msg_phone.hide();
            if ($cellnum.val() === '') {
                $msg_phone.text('휴대폰번호를 입력해주세요.').show();
                alert('휴대폰번호를 입력해주세요.');
                $cellnum.focus();
                return false;
            } else {
                var cellNum = $cellnum.val().replace(/-/g, "");
                var cellLen = cellNum.length;

                if (!$.isNumeric(cellNum)) {
                    $msg_phone.text('휴대폰번호를 정확하게 입력해주세요.').show();
                    alert('휴대폰번호를 정확하게 입력해주세요.');
                    $cellnum.focus();
                    return false;
                }

                if (cellLen === 11) {
                    $cell1.val(cellNum.substr(0, 3));
                    $cell2.val(cellNum.substr(3, 4));
                    $cell3.val(cellNum.substr(7));
                } else if (cellLen === 10) {
                    $cell1.val(cellNum.substr(0, 3));
                    $cell2.val(cellNum.substr(3, 3));
                    $cell3.val(cellNum.substr(6));
                } else {
                    $msg_phone.text('휴대폰번호를 정확하게 입력해주세요.').show();
                    alert('휴대폰번호를 정확하게 입력해주세요.');
                    $cellnum.focus();
                    return false;
                }
            }

            $idCheckMsg1.hide();
            $idCheckMsg2.hide();
            var id = $.trim($id.val());
            if (id === '') {
                $idCheckMsg1.text('필수정보 입니다.').show();
                alert('아이디를 입력해 주세요.');
                $id.focus();
                return false;
            } else if ($('#id_chk_ok').val() !== '1') {
                if (!idExsistCheck(id)) {
                    alert('사용가능한 아이디를 입력해주세요.');
                    $id.focus();
                    return false;
                }
            }

            $password1_warning_txt.hide();
            $password1_good_txt.hide();
            if ($password1.val() === '') {
                $password1_warning_txt.text('비밀번호를 입력하세요.').show();
                alert('비밀번호를 입력하세요.');
                $password1.focus();
                return false;
            }

            // PasswordStrength
            var password1 = $password1.val();
            if (password1 && false === PasswordStrength.verify(password1, "", $id.val())) {
                var msgStrengthAndMessage = PasswordStrength.getStrength() + ' - ' + PasswordStrength.getMessage();
                $password1_warning_txt.text(msgStrengthAndMessage).show();
                alert('비밀번호를 확인해 주세요.');
                $password1.focus();
                return false;
            }

        } else {
            if ($corp_charge.val() === '') {
                alert('담당자명은 필수 값입니다');
                document.location.href = '/zf_user/member/registration/join?ut=c';
            }

            if ($('#email_id').val() === '') {
                alert('이메일은 필수 값입니다');
                document.location.href = '/zf_user/member/registration/join?ut=c';
            }
        }

        var $tc_msg = $('#tc_msg');
        $tc_msg.hide();
        if ($('#tc_1_fl').val() === 'n' || $('#tc_2_fl').val() === 'n') {
            $tc_msg.show();
            alert('회원 약관 및 개인정보 이용에 동의하여 주시기 바랍니다');
            $('html, body').animate({scrollTop : $("#company_terms_title").offset().top}, 400);
            return false;
        }

        if ($('#tc_3_fl').val() === 'n') {
            $tc_msg.show();
            alert('SMS발송서비스 이용약관에 동의하셔야 SMS 서비스를 이용하실 수 있습니다. 약관에 동의해주세요.');
            $('html, body').animate({scrollTop : $("#company_terms_title").offset().top}, 400);
            return false;
        }

        if ($('input[name="dormancy_term"]:checked').length === 0 ) {
            alert('정보보유기간을 선택해주세요.');
            $('html, body').animate({scrollTop : $("#company_terms_title").offset().top}, 400);
            return false;
        }

        // 해외 주소인 경우 강제로 구주소로 입력해준다.
        if ($('#btnOversea').is(':checked')) {
            var globalAddress = $('#address').val();
            var globalZipcode = $('#zipcode').val();

            $('#old_address').val(globalAddress);
            $('#old_zipcode').val(globalZipcode);
            $('#old_address_details').val('');
            $('#new_address').val('');
            $('#new_zipcode').val('');
            $('#new_address_details').val('');
            $('#address_sido').val('');
            $('#address_sigungu').val('');
            $('#x_coordinate').val('');
            $('#y_coordinate').val('');
            $('#zip_use_type').val('J');
        }


        document.getElementById('btn_submit').id = '';
        $form.submit();
    }

    //기업회원 nice 인증
    var corpCodeLogChk = false,
        prevCsn = '';

    /**
     * 사번 나이스정보 확인.(올바른 정보인지 확인해서, 기업정보 가져오기)
     */
    function membercompanyConfirm() {
        var url = '/zf_user/member/registration/enterprise-confirm';
        var params = 'csn1=' + $('#csn1').val() + '&csn2=' + $('#csn2').val() + '&csn3=' + $('#csn3').val();

        var fullCsn = $('#csn1').val() + $('#csn2').val() + $('#csn3').val();
        $('#msg_corp_code_1').hide();
        if (fullCsn.length != 10) {
            $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
            $corp_code.val('').focus();
            return false;
        }

        if ($.isNumeric($('#csn1').val()) === false) {
            $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
            $corp_code.val('').focus();
            return false;
        }

        if ($.isNumeric($('#csn1').val()) === false) {
            $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
            $corp_code.val('').focus();
            return false;
        }

        if ($.isNumeric($('#csn2').val() ) === false) {
            $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
            $corp_code.val('').focus();
            return false;
        }

        if ($.isNumeric( $('#csn3').val()) === false) {
            $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
            $corp_code.val('').focus();
            return false;
        }

        if (fullCsn === prevCsn) {
            return;
        }

        $.ajax({
            url: url,
            data: params,
            type: 'POST',
            dataType: 'json'
        }).done(function (data) {
            prevCsn = data.business;

            var $choice_company_cd = $('.choice_company_cd');
            var $corp_code = $('#corp_code');
            var $msg_corp_code_2 = $('#msg_corp_code_2');
            var $confirm_notify_type = $('#confirm_notify_type');
            var $nice_notice_txt = $('#nice_notice_txt');
            var $first_notice_txt = $('#first_notice_txt');
            var $reg_cominfo_view_btn = $('#reg_cominfo_view_btn');

            $nice_notice_txt.hide();
            $('#saramin_notice_txt').hide();
            $first_notice_txt.hide();

            $choice_company_cd.find('.seltxt').removeClass('companyCdFix');

            if (data !== '') {
                $('#confirmFlag').val('y');
                $('#resultcode').val(data.code);
                $('#business').val(data.business);
                $('#must').show();
                $('.contact_certification').show();
                setCompanyData(data);
                $choice_company_cd.find('.seltxt > span').html('기업구분');

                switch (data.code) {
                    case '00' : // 미등록
                        alert('NICE 평가정보㈜에 등록되지 않은 사업자등록번호입니다.\n회원가입 후, 일부 서비스 이용 시 추가 인증이 필요할 수 있습니다.');
                        $reg_cominfo_view_btn.hide();
                        areaInputCompanyShow('all');
                        $confirm_notify_type.val('unregistered');
                        $first_notice_txt.show();

                        if ($.isNumeric(data.force_company_cd) && data.force_company_cd > 1) {
                            $choice_company_cd.find('.seltxt').addClass('companyCdFix');
                            $('[data-value="' + data.force_company_cd + '"]').trigger('click');
                            message = '해당 사업자등록번호로 가입 이력이 있어 기업 구분이 자동 적용됩니다.';
                            $msg_corp_code_2.text(message).show();
                        } else {
                            $('input[name=company_cd]').val('');
                        }

                        setLogScript('com-info', 'registration-number', 'Comnum_input', 'Comnum_check');
                        break;
                    case '01' : // 간이과세자
                    case '02' : // 면세사업자
                    case '03' : // 일반과세자
                    case '04' : // 비영리법인
                    case '07' : //고유식별단체
                    case '100' : // 폐업자, 휴업자 아닌 경우
                    case '110' : // companyinfo_search 에 존재하는 경우

                        var message = '사업자 등록번호가 성공적으로 인증되었습니다.';
                        if ($.isNumeric(data.force_company_cd) && data.force_company_cd > 1) {
                            $choice_company_cd.find('.seltxt').addClass('companyCdFix');
                            $('[data-value="' + data.force_company_cd + '"]').trigger('click');
                            message = '해당 사업자등록번호로 가입 이력이 있어 기업 구분이 자동 적용됩니다.';
                        } else {
                            $('input[name=company_cd]').val('');
                        }
                        $msg_corp_code_2.text(message).show();

                        if (corpCodeLogChk === false) {
                            setLogScript('com-info', 'registration-number', 'Comnum_input', 'Comnum_check');
                        }

                        $nice_notice_txt.show();
                        if ($('#csn2').val() != '00') {
                            if (data.company_nm === "" || data.ceo_nm === "") {
                                alert('사업자등록번호는 정상적으로 확인되었으나 회원가입 후, 일부 서비스 이용 시 추가 인증이 필요할 수 있습니다.');
                                $('#company_nm').focus();
                                $reg_cominfo_view_btn.hide();
                            } else {
                                $reg_cominfo_view_btn.show();
                            }
                        } else {
                            $reg_cominfo_view_btn.hide();
                        }
                        if (data.code == '110') {
                            areaInputCompanyShow('part');
                            $confirm_notify_type.val('registered');
                        } else {
                            areaInputCompanyShow('all');
                            $confirm_notify_type.val('unregistered');
                        }
                        corpCodeLogChk = true;
                        break;
                    case '05' : // 폐업자
                    case '06' : // 휴업자
                    case '91' :
                    case '92' :
                    case '93' :
                        alert('휴/폐업 기업으로 등록된 사업자등록번호로 가입하실 수 없습니다.\n기업 정보가 올바르지 않은 경우 NICE평가정보(주)로 사업자등록증을 보내주시기 바랍니다.\n접수 2~3영업일 이내에 휴폐업정보가 업데이트됩니다.\n\n[사업자등록증 보내실 곳]\n■ 제출자 성명 및 전화번호 기재 필수\n■ e-mail : nicesbc_cs@nice.co.kr\n■ FAX : 02-6280-6833 ');
                        //resetCompanyData('fail');
                        $corp_code.val('').focus();
                        break;
                    case '111' :
                        $('#msg_corp_code_1').text('올바른 사업자번호가 아닙니다.').show();
                        //resetCompanyData('fail');
                        $corp_code.val('').focus();
                        break;
                    //case '99' : // 인증실패도 default로
                    default :
                        alert('기업 인증에 실패하였습니다. 모든 항목에 대해 직접 입력하신 후 [회원가입]을 완료하실 수 있습니다.');
                        $corp_code.val('').focus();
                        areaInputCompanyShow('all');
                        $confirm_notify_type.val('unregistered');
                        break;
                }
            } else {
                confirmFailAction();
            }
        }).fail(function () {
            confirmFailAction();
        });
    }

    function areaInputCompanyShow(type) {
        $('#area_input_company').show();
        if (type == 'all') {
            $('#address_area').show();
            $('#address_detail_area').show();
            $('#job_category_area').show();
        } else {
            $('#address_area').hide();
            $('#address_detail_area').hide();
            $('#job_category_area').hide();
        }
    }

    function setCompanyData(data) {
        setCompanyInput('company_nm', !!data.company_nm ? data.company_nm : '');
        setCompanyInput('ceo_nm', !!data.ceo_nm ? data.ceo_nm : '');
        clearCompanyData();
    }

    function clearCompanyData() {
        $('#address_main').val('');
        $('#address_sebu').val('');
        $('#old_zipcode').val('');
        $('#new_zipcode').val('');
        $('#old_address').val('');
        $('#new_address').val('');
        $('#old_address_details').val('');
        $('#new_address_details').val('');
        $('#industry_code').val('');
        $('#industry_keyword').val('');
        $('#industry_selected_area').html('')
    }

    function setCompanyInput(name, value) {
        var $elt = $('#' + name);
        $elt.prop('readOnly', false);
        $elt.val(value);
        if (!!value) {
            $elt.prop('readOnly', true);
        }
    }

    function confirmFailAction() {
        alert('기업 인증에 실패하였습니다. 모든 항목에 대해 직접 입력하신 후 [회원가입]을 완료하실 수 있습니다.');
        $('#confirmFlag').val('y');
    }

    /**
     * 이메일 유효성 검사
     * @param email
     * @returns {boolean}
     */
    function validateEmail(email) {
        var MailChk = /^[0-9a-z._+-]+@([0-9a-z_-]+\.)+[a-z]{2,10}$/i;
        return MailChk.test(email);
    }

    /**
     * 홈페이지 유효성 검사
     * @param hompage
     * @returns {boolean}
     */
    function validateHomepage(hompage) {
        var HomepageChk = new RegExp("[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-]+)*(\\.com|\\.net|\\.org|\\.biz|\\.info|\\.me|\\.name|\\.edu|\\.gov|\\.int|\\.jobs|\\.tel|\\.mobi|\\.museum|\\.pro|\\.travel|\\.aero|\\.arpa|\\.cat|\\.coop|\\.asia|\\.kr|\\.co\\.kr|\\.or\\.kr|\\.pe\\.kr|\\.re\\.kr|\\.ne\\.kr|\\.seoul\\.kr|\\.busan\\.kr|\\.daegu\\.kr|\\.incheon\\.kr|\\.gwangju\\.kr|\\.daejeon\\.kr|\\.ulsan\\.kr|\\.gyeonggi\\.kr|\\.gangwon\\.kr|\\.chungbuk\\.kr|\\.chungnam\\.kr|\\.jeonbuk\\.kr|\\.jeonnam\\.kr|\\.gyeongbuk\\.kr|\\.gyeongnam\\.kr|\\.go\\.kr|\\.mil|\\.mil\\.kr|\\.ac|\\.ac\\.kr|\\.hs\\.kr|\\.ms\\.kr|\\.es\\.kr|\\.kg\\.kr|\\.sc\\.kr|\\.jeju\\.kr|\\.cc|\\.jp|\\.co\\.jp|\\.or\\.jp|\\.eu|\\.tw|\\.tv|\\.cn|\\.au|\\.ca|\\.de|\\.fr|\\.es|\\.us|\\.uk|\\.com\\.cn|\\.net\\.cn|\\.in|\\.net\\.in|\\.co\\.in|\\.com\\.my|\\.co|\\.cm|\\.vn|\\.land)$");
        return (HomepageChk.test(hompage));
    }

    /**
     * 도메인 확인
     * @param str
     * @returns {boolean}
     */
    function validateDomain(str) {
        // 검사할 도메인이 없으면 리턴
        if (!str && str.length === 0) {
            return true;
        }
        // 체크할 도메인 리스트
        var arr = ['.co', '.cm'];

        var dot     = str.lastIndexOf(".");
        var dname   = str.substring(dot, str.length);

        for(var i=0; i<arr.length; i++) {
            if(dname === arr[i]) {
                return false;
            }
        }
        return true;
    }


    return {
        chkCorpCode: chkCorpCode,
        membercompanyConfirm: membercompanyConfirm,
        chkCompanyName: chkCompanyName,
        chkCeoName: chkCeoName,
        companySubmitChk:companySubmitChk
    }
})(jQuery);

