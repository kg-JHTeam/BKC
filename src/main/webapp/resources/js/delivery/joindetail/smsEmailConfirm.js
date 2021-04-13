var confirm_layer_close;
var changeConfirmCell;
var sendCodeAction;
var layerPopupText;
var set_overseas_selective;
var already_phone_join_check;
var sendCodeTimer = null;

jQuery(function ($) {

    var overseas_fl = $('#overseas_fl'),
        collectionBasisContentsOverseas = $('#collectionBasisContentsOverseas'),
        channel = $('#channel'),
        mail_confirm_complete = $('#mail_confirm_complete'),
        sms_confirm_complete = $('#sms_confirm_complete'),
        ipin_confirm_complete = $('#ipin_confirm_complete'),
        confirm_status = $('#confirm_status'),
        confirm_method = $('#confirm_method'),
        sms_code = $('#sms_code'),
        email_code = $('#email_code'),
        cellnum = $('#cellnum'),
        email_id = $('#email_id'),
        email_dm = $('#email_dm'),
        certi_phone1 = $('#certi_phone1'),
        certi_phone2 = $('#certi_phone2'),
        phone_certi_list = $('li[name="phone_certi_list"]'),
        list_mail = $('#list_mail'),
        email_confirm_msg = $('#email_confirm_msg'),
        phone_msg = $('#phone_msg'),
        name_phone_msg = $('p[name="name_phone_msg"]'),
        phone_msg_good = $('#phone_msg_good'),
        phone_confirm_msg = $('#phone_confirm_msg'),
        confirm_remain_mail_time_area = $('#confirm_remain_mail_time_area'),
        confirm_remain_sms_time_area = $('#confirm_remain_sms_time_area'),
        confirm_remain_time_zone = $('#confirm_remain_time_zone'),
        confirm_remain_time_area = $('#confirm_remain_time_area'),
        pop_byemail = $('#pop_byemail'),
        pop_byphone = $('#pop_byphone'),
        layer_pop_byphone = $('#layer_pop_byphone'),
        layer_pop_byemail = $('#layer_pop_byemail'),
        cell1 = $('#cell1'),
        cell2 = $('#cell2'),
        cell3 = $('#cell3')
    ;

    channel.val('sms');
    sms_confirm_complete.val('n');
    mail_confirm_complete.val('n');

    var clearId = '';
    function startConfirmTimer() {
        var minute = 3;
        var second = 0;

        if ($('.layer_identify.open').attr("id") == 'layer_pop_byphone') {
            confirm_remain_sms_time_area.html('남은시간 (<span id="confirm_sms_remain_time"></span>)');
        } else {
            confirm_remain_mail_time_area.html('남은시간 (<span id="confirm_mail_remain_time"></span>)');
        }

        setTimeText(minute, second);

        stopConfirmTimer();

        clearId = setInterval(lap, 1000);

        function setTimeText(minute, second) {
            var second_text = (second / 10) < 1 ? "0" + second : second;

            if ($('.layer_identify.open').attr("id") == 'layer_pop_byphone') {
                $('#confirm_sms_remain_time').html(minute + ':' + second_text);
            } else {
                $('#confirm_mail_remain_time').html(minute + ':' + second_text);
            }
        }

        function lap() {
            if (second == 0 && minute > 0) {
                second = 59;
                minute -= 1;
            } else {
                second -= 1;
            }

            setTimeText(minute, second);

            if (minute == 0 && second == 0) {
                changeConfirmText('warning_txt', '입력시간이 만료되었습니다. 인증번호를 다시 발송해주세요.');
                if ($('.layer_identify.open').attr("id") == 'layer_pop_byphone') {
                    confirm_remain_sms_time_area.html('');
                } else {
                    confirm_remain_mail_time_area.html('');
                }
                stopConfirmTimer();
            }
        }
    }

    function stopConfirmTimer() {
        if (clearId) {
            clearInterval(clearId);
            clearId = '';
        }
    }

    function changeConfirmText(type, text) {

        if (channel.val() == 'sms') {
            if (phone_confirm_msg.attr('class') == type) {
                phone_confirm_msg.html(text);
                phone_confirm_msg.show();
            } else {
                phone_confirm_msg.removeClass().addClass(type).html(text);
                phone_confirm_msg.show();
            }
        } else {
            if (email_confirm_msg.attr('class') == type) {
                email_confirm_msg.html(text);
                email_confirm_msg.show();
            } else {
                email_confirm_msg.removeClass().addClass(type).html(text);
                email_confirm_msg.show();
            }
        }
    }

    function checkNumberOnly(e) {
        var evt = e || window.event;

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
            var agent = navigator.userAgent.toLowerCase();
            if ((navigator.appName === 'Netscape' && agent.indexOf('trident') !== -1) || (agent.indexOf("msie") !== -1)) {
                evt.returnValue = false;
            } else {
                evt.preventDefault();
                evt.stopPropagation();
            }
        }
    }

    function confirmComplete(form) {
        var form = $(form);
        if (channel.val() == 'sms') {
            if (sms_confirm_complete.val() == 'y') {
                form.submit();
            }
        } else {
            if (mail_confirm_complete.val() == 'y') {
                form.submit();
            }
        }
    }

    changeConfirmCell = function (mode) {
        if (mode === 'sms') {
            if (sms_confirm_complete.val() === 'y') {
                $('input[name="tmp_cellnum"]').attr('readonly', true);
                already_phone_join_check();
                $('.layer_identify.open').removeClass('open');
                cellnum.attr('readonly', true);
                confirm_status.val('complete');
                confirm_method.val('7');
                certi_phone1.val($('#cell1').val());
                certi_phone2.val(cellnum.val());
                $('#confirm_good_txt').show();
            } else {
                alert('인증을 완료하세요.');
            }
        } else {
            if (mail_confirm_complete.val() === 'y') {
                $('input[name="tmp_email_id"]').attr('readonly', true);
                already_email_join_check();
                $('.layer_identify.open').removeClass('open');
                email_id.attr('readonly', true);
                email_dm.attr('readonly', true);
                confirm_status.val('complete');
                confirm_method.val('11');
                list_mail.hide();
                $('#confirm_good_txt').show();
            } else {
                alert('인증을 완료하세요.');
            }
        }
    };

    already_email_join_check = function () {
        var email = email_id.val() + '@' + email_dm.val();

        $.ajax({
            data: {
                'seq': $('#seq').val()
                , 'confirm_status': 'complete'
                , 'user_nm': $('#user_nm').val()
                , 'birth_year': $('#birth_year').val()
                , 'birth_month': $('#birth_month').val()
                , 'birth_day': $('#birth_day').val()
                , 'email': email
            }
            , dataType: 'json'
            , type: 'post'
            , url: '/zf_user/member/registration/already-email-join-check'
            , success: function (response, status, request) {
                if (status == 'success' && response != '') {
                    $('#p_already_id').text(response);
                    $('#p_member_nudge').show();
                }
            },
            error: function (e) {
                if (window.console) {
                    console.log(e);
                }
            },
            complete: function () {

            }
        });
    };

    already_phone_join_check = function () {

        var user_nm = $('#user_nm').val(),
            birth_year = $('#birth_year').val(),
            birth_month = $('#birth_month').val(),
            birth_day = $('#birth_day').val(),
            cell1 = $('#cell1').val(),
            cell2 = $('#cell2').val(),
            cell3 = $('#cell3').val()
        ;

        if (user_nm === '' || birth_year === '' || birth_month === '' || birth_day === '' ||
            cell1 === '' || cell2 === '' || cell3 === '') {
            return;
        }

        $.ajax({
            data: {
                'seq': $('#seq').val()
                , 'confirm_status': 'complete'
                , 'user_nm': user_nm
                , 'birth_year': birth_year
                , 'birth_month': birth_month
                , 'birth_day': birth_day
                , 'cell1': cell1
                , 'cell2': cell2
                , 'cell3': cell3
            }
            , dataType: 'json'
            , type: 'post'
            , url: '/zf_user/member/registration/already-join-check'
            , success: function (response, status, request) {
                if (status === 'success' && response !== '') {
                    $('#p_already_id').text(response);
                    $('#p_member_nudge').show();
                }
            },
            error: function (e) {
                if (window.console) {
                    console.log(e);
                }
            },
            complete: function () {

            }
        });
    };

    var $btn_pop = $('.btn_cert_pop');

    confirm_layer_close = function (obj) {
        if(!confirm('인증을 하지 않으면 회원가입을 하실 수 없어요.\n그래도 창을 닫으시겠어요?\n(창을 닫으시면 현재 발송된 인증번호는 더 이상 사용하실 수 없습니다.)')){
            return;
        }
        stopConfirmTimer();
        $btn_pop.removeClass('on');
        if (channel.val() === 'sms') {
            sms_confirm_complete.val('n');
            cellnum.attr('readonly', false);
            pop_byemail.attr('disabled', false);
            confirm_status.val('send');
            pop_byphone.attr('disabled', false);
            pop_byemail.attr('disabled', false);
            $('.certi_list').removeClass('afterCert');
            sms_code.attr('readonly', false);
            sms_code.val('');
            phone_confirm_msg.hide();
            confirm_remain_sms_time_area.html('');
        } else {
            mail_confirm_complete.val('n');
            email_id.attr('readonly', false);
            email_dm.attr('readonly', false);
            pop_byphone.attr('disabled', false);
            confirm_status.val('send');
            pop_byphone.attr('disabled', false);
            pop_byemail.attr('disabled', false);
            list_mail.show();
            email_code.attr('readonly', false);
            email_code.val('');
            email_confirm_msg.hide();
            confirm_remain_mail_time_area.html('');
        }
        $(obj).closest('.layer_identify').removeClass('open');
    };


    $btn_pop.on('click', function () {
        $btn_pop.removeClass('active');
        $(this).addClass('active');
        $('#' + $(this).data('popupid')).addClass('open');

        if ($('#' + $(this).data('popupid')).css("display") === 'none') {
            $('#' + $(this).data('popupid')).css("display", '')
        }

        if ($('.layer_identify.open').attr("id") === 'layer_pop_byphone') {
            if (sms_confirm_complete.val() === 'y' || mail_confirm_complete.val() === 'y') {
                layer_pop_byphone.removeClass('open');
                if (mail_confirm_complete.val() === 'y') {
                    pop_byphone.removeClass('active');
                    pop_byemail.addClass('active');
                }
                alert("인증이 이미 완료되었습니다.");
                return;
            }
        } else {
            if (sms_confirm_complete.val() === 'y' || mail_confirm_complete.val() === 'y') {
                layer_pop_byemail.removeClass('open');
                if (sms_confirm_complete.val() === 'y') {
                    pop_byemail.removeClass('active');
                    pop_byphone.addClass('active');
                }
                alert("인증이 이미 완료되었습니다.");
                return;
            }
        }

        if (sendCodeAction()) {
            layerPopupText();
        } else {
            $('#sms_layer_sub_title').text('인증번호를 보낼 수가 없습니다.');
            $('#email_layer_sub_title').text('인증번호를 보낼 수가 없습니다.');
        }
    });

    // 인증번호 발송.
    sendCodeAction = function () {
        if ($('.layer_identify.open').attr("id") === 'layer_pop_byphone') {

            if (overseas_fl.val() == '1') {
                layer_pop_byphone.removeClass('open');
                pop_byphone.removeClass('active');
                alert('이메일 인증을 이용해주세요.');
                return;
            }

            if (sms_confirm_complete.val() === 'y') {
                alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
                return;
            }

            channel.val('sms');
        } else {

            email_id = $('#' + channel.val() + '_email_id');
            var email_str = email_id.val();
            //메일정상여부
            if(!/^[0-9a-z_+-]+([\.]*[0-9a-z_+-])*@([0-9a-z_-]+\.)+[a-z]{2,10}$/i.test(email_str)) {
                layer_pop_byemail.removeClass('open');
                pop_byemail.removeClass('active');
                email_id.focus();
                alert("잘못된 이메일 주소입니다. 이메일 주소를 정확하게 입력해주세요.");
                return;
            }

            if (email_id.val() === '') {
                layer_pop_byemail.removeClass('open');
                pop_byemail.removeClass('active');
                email_id.focus();
                alert("이메일 주소를 다시 확인해주세요.");
                return;
            }

            if (mail_confirm_complete.val() === 'y') {
                alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
                return;
            }

            channel.val('mail');
        }

        var cellNum = $('#' + channel.val() + '_cellnum').val().replace(/-/g, "");
        var cellLen = cellNum.length;
        var cell = '',
            email = '';

        if (overseas_fl.val() === '0' && channel.val() === 'sms') {

            if (cellNum === '') {
                layer_pop_byphone.removeClass('open');
                pop_byphone.removeClass('active');
                alert('휴대폰 번호를 입력해 주세요.');
                return;
            }

            if (!$.isNumeric(cellNum)) {
                name_phone_msg.html('휴대폰번호를 정확하게 입력해주세요.').show();
                layer_pop_byphone.removeClass('open');
                pop_byphone.removeClass('active');
                alert('잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.');
                return;
            }

            if (cellLen === 10) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 3));
                cell3.val(cellNum.substr(6));
            } else if (cellLen === 11) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 4));
                cell3.val(cellNum.substr(7));
            } else {
                phone_msg_good.hide();
                confirm_remain_time_zone.hide();
                confirm_remain_time_area.hide();
                cellnum.focus();
                name_phone_msg.html('잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.').show();
                pop_byphone.removeClass('active');
                if ($('.layer_identify.open').attr("id") === 'layer_pop_byphone') {
                    layer_pop_byphone.removeClass('open');
                } else {
                    layer_pop_byemail.removeClass('open');
                }

                alert('잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.');
                return;
            }

            cell = cell1.val() + '-' + cell2.val() + '-' + cell3.val();
            cellnum.val(cell);
            $('#cell').val(cell);
        } else {
            if (overseas_fl.val() === '1') {
                cell = '';
                cellnum.val('');
                $('#cell').val(cell);
            }
        }

        email = email_id.val();

        var returnBool = true;

        if (sendCodeTimer) {
            clearTimeout(sendCodeTimer);
        }

        sendCodeTimer = setTimeout(function() {$.ajax('/zf_user/persons/send-code', {
            type: 'POST',
            data: {
                phone: cell,
                email: email,
                channel: channel.val(),
                needCheckLimit : 'y'
            },
            async : false,
            dataType: 'json',
            success: function (json) {
                if (json.code === 'limit.send') {
                    alert(json.msg);
                    returnBool = false;
                    return changeConfirmText('warning_txt', json.msg);
                }
                if (json === "invalid_phone") {
                    returnBool = false;
                    return changeConfirmText('warning_txt', '휴대폰번호가 올바르지 않습니다.');
                }
                if (json === "invalid_email") {
                    returnBool = false;
                    return changeConfirmText('warning_txt', '이메일주소가 올바르지 않습니다.');
                }
                if (json.code === "certification_notice") {
                    returnBool = false;
                    return changeConfirmText('warning_txt', "일시적인 오류로 인하여 " + json.message + " 이용이 불가능합니다. 잠시 후 다시 이용해주세요.");
                }
                startConfirmTimer();
                return true;
            }

        })},300);

        return returnBool;
    };

    // 인증 번호 발송 후 텍스트 처리
    layerPopupText = function () {
        if ($('.layer_identify.open').attr("id") == 'layer_pop_byphone') {
            var cellNum = $('#sms_cellnum').val().replace(/-/g, "");
            var cellLen = cellNum.length;

            if (cellLen === 10) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 3));
                cell3.val(cellNum.substr(6));
            } else if (cellLen === 11) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 4));
                cell3.val(cellNum.substr(7));
            }

            var cell = cell1.val() + '-' + cell2.val() + '-' + cell3.val();

            $('#sms_layer_sub_title').html(cell + '로 인증번호가 발송되었습니다.' + '<br />' + '카카오톡으로 전달받은 인증번호를 입력해주세요.' + '<br />' + '(실패 시 SMS 전송)');
            sms_code.focus();
        } else {
            email_id = $('#' + channel.val() + '_email_id');
            var email = email_id.val();
            $('#email_layer_sub_title').html(email + '로 인증번호가 발송되었습니다.' + '<br />' + '이메일로 전달받은 인증번호를 입력해주세요.');
            email_code.focus();
        }
    };

    $('.confirm-action.person').on('click', function (e) {

        if ($('.layer_identify.open').attr("id") === 'layer_pop_byphone') {
            if (sms_confirm_complete.val() === 'y') {
                alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
                return;
            }
            channel.val('sms');
        } else {
            if (mail_confirm_complete.val() == 'y') {
                alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
                return;
            }
            channel.val('mail');
        }

        var cellNum = $('#' + channel.val() + '_cellnum').val().replace(/-/g, "");
        var cellLen = cellNum.length;

        var cell = '',
            email = '',
            send_code = '';


        if (overseas_fl.val() == "0" && channel.val() === 'sms') {
            if (!$.isNumeric(cellNum)) {
                changeConfirmText('warning_txt', '휴대폰번호를 정확하게 입력해주세요.');
                return;
            }

            if (cellLen === 10) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 3));
                cell3.val(cellNum.substr(6));
            } else if (cellLen === 11) {
                cell1.val(cellNum.substr(0, 3));
                cell2.val(cellNum.substr(3, 4));
                cell3.val(cellNum.substr(7));
            } else {
                phone_msg_good.hide();
                confirm_remain_time_zone.hide();
                confirm_remain_time_area.hide();
                cellnum.focus();
                phone_msg.html('잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.').show();
                alert('잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.');
                return;
            }

            cell = cell1.val() + '-' + cell2.val() + '-' + cell3.val();
            cellnum.val(cell);
            $('#cell').val(cell);
        } else {
            if (overseas_fl.val() === '1') {
                cell = '';
                cellnum.val('');
                $('#cell').val(cell);
            }
        }

        email_id = $('#' + channel.val() + '_email_id');
        email = email_id.val();

        if ($('.layer_identify.open').attr("id") === 'layer_pop_byphone') {
            sms_code.val($.trim(sms_code.val()));
            send_code = sms_code.val();
        } else {
            email_code.val($.trim(email_code.val()));
            send_code = email_code.val();
        }

        if (send_code === '') {
            changeConfirmText('warning_txt', '인증번호를 입력해주세요.');
            return;
        }

        $.ajax({
            url: '/zf_user/persons/validate-code',
            type: 'POST',
            data: {
                category: 'join',
                seq: $('#seq').val(),
                code: send_code,
                channel: channel.val(),
                phone: cell,
                email: email
            },
            dataType: 'json',
            success: function (json) {
                if (json === 'limit.cert') {
                    alert('본인 인증이 5회 이상 실패하여 24시간 동안 인증이 제한됩니다.\n제한해제를 원하실 경우, 고객센터로 문의해주세요.');
                    stopConfirmTimer();
                    return false;
                }

                if (json === 'confirms.verified') {
                    stopConfirmTimer();
                    if (channel.val() === 'sms') {
                        sms_confirm_complete.val('y');
                        mail_confirm_complete.val('n');
                        sms_code.attr('readonly', true);
                        confirm_remain_sms_time_area.html('');
                    } else {
                        sms_confirm_complete.val('n');
                        mail_confirm_complete.val('y');
                        email_code.attr('readonly', true);
                        confirm_remain_mail_time_area.html('');
                        if ($('#id').val() === '') {
                            idExsistCheck(email.split('@')[0]);
                        }
                    }
                    $('.btn_cert_pop').addClass('on');
                    changeConfirmText('good_txt', '인증되었습니다.');
                    return;
                }
                // confirms.invalid_token
                if (channel.val() === 'sms') {
                    sms_confirm_complete.val('n');
                } else {
                    mail_confirm_complete.val('n');
                }

                changeConfirmText('warning_txt', '인증번호가 틀렸습니다. 다시 입력해주세요.');
            },
            error: function (error) {
                stopConfirmTimer();
                changeConfirmText('warning_txt', '인증번호 확인 오류. 다시 확인해주세요.');
            }

        });
    });

    $('div.log').ajaxError(function (event, xhr, settings, thrownEvent) {
        if (window.console) {
            console.log(event);
            console.log(thrownEvent);
        }
    });

    set_overseas_selective = function () {

        var $channel = $('#channel');
        var $identify_mail = $('.identify_mail');
        $('p[name="msg_phone"]').hide();

        if (overseas_fl.val() === "1") {
            if (sms_confirm_complete.val() === 'y' ) {
                confirm_status.val('ready');
            }
            collectionBasisContentsOverseas.hide();
            overseas_fl.val('0');
            sms_confirm_complete.val('n');
            certi_phone1.attr('onfocus', '');
            certi_phone2.attr('onfocus', '');
            cellnum.attr('readonly', false);
            pop_byemail.attr('disabled', false);
            pop_byphone.attr('disabled', false);
            phone_certi_list.removeClass('afterCert');
            phone_certi_list.addClass('must');
            sms_code.attr('readonly', false);
            sms_code.val('');
            phone_confirm_msg.hide();
            confirm_remain_sms_time_area.html('');
        } else {

            if ($channel.val() === 'sms') {
                if (sms_confirm_complete.val() === 'y') {
                    alert('인증이 이미 완료되었습니다');
                    return false;
                }
                $channel.val('mail');
                alert('해외거주자는 이메일 인증을 이용해 주세요.');
                $('.identify_phone').hide();
                $identify_mail.show();
                sms_confirm_complete.val('n');
                $('.btn_identify_check').removeClass('on');
                $identify_mail.find('.check_custom').eq(0).click();
                return false;
            }

            collectionBasisContentsOverseas.show();
            overseas_fl.val('1');
            sms_confirm_complete.val('n');
            cellnum.val('');
            pop_byphone.removeClass('active');
            pop_byemail.attr('disabled', false);
            phone_certi_list.removeClass('must');
            phone_certi_list.addClass('afterCert');
            certi_phone1.attr('onfocus', 'this.blur()');
            certi_phone2.attr('onfocus', 'this.blur()');
            phone_confirm_msg.hide();
            phone_msg.hide();
            confirm_remain_sms_time_area.html('');
            certi_phone1.val('');
            certi_phone2.val('');
            if (mail_confirm_complete.val() === 'n') {
                confirm_status.val('ready');
                $('#confirm_good_txt').hide();
            }
        }
    };

    if ($('.dimmed.open').length) {
        $('body').css('overflow', 'hidden');
    }


    $('.identify_select.person > .btn_identify').on('click', function () {
        var id = this.id;
        var $identify_mail = $('.identify_mail');
        var $identify_phone = $('.identify_phone');
        var $common_identify = $('.common_identify');
        var $ignore_cell_1 = $('#ignore_cell_1');
        var $incident_phone = $('._incident_phone');
        var $incident_email = $('._incident_email');

        if ($('.layer_identify').is(':visible')) {
            return;
        }

        if (sms_confirm_complete.val() === 'y' || mail_confirm_complete.val() === 'y') {
            layer_pop_byemail.removeClass('open');
            layer_pop_byphone.removeClass('open');
            alert('인증이 이미 완료되었습니다.');
            return;
        }

        if ($('#overseas_fl').val() === '1' && id === 'identify_phone') {
            alert('해외거주자는 이메일 인증을 이용해 주세요.');
            id = 'identify_email';
        }


        // 해외거주 초기화
        $ignore_cell_1.prop('checked', false);
        $ignore_cell_1.closest('label').get(0).className = 'check_custom check_off';

        $identify_phone.hide();
        $identify_mail.hide();
        $common_identify.hide();

        if (id === 'identify_phone') {
            if ($incident_phone.length > 0) {
                $incident_phone.show();
                $(':focus').blur();
                return;
            }
            $identify_phone.show();
            channel.val('sms');
        } else {
            if ($incident_email.length > 0) {
                $incident_email.show();
                $(':focus').blur();
                return;
            }
            $('._email').show();
            $identify_mail.show();
            channel.val('mail');
        }
        $common_identify.show();

    });

    $('.identify_company > .btn_identify').on('click', function () {

        if (sms_confirm_complete.val() === 'y' || mail_confirm_complete.val() === 'y' || ipin_confirm_complete.val() === 'y') {
            layer_pop_byemail.removeClass('open');
            alert('인증이 이미 완료되었습니다.');
            return;
        }

        var $identify_mail = $('.identify_mail');
        var $identify_phone = $('.identify_phone');
        var $identify_pin = $('.identify_pin');
        var $incident_phone = $('._incident_phone');
        var $incident_email = $('._incident_email');
        var $incident_ipin = $('._incident_ipin');

        $identify_phone.hide();
        $identify_mail.hide();
        $identify_pin.hide();

        if (this.id === 'identify_phone') {
            if ($incident_phone.length > 0) {
                $incident_phone.show();
                $(':focus').blur();
                return;
            }
            popupCertify(document.getElementById('certify-form'));
            //$identify_phone.show();
            channel.val('sms');
            setManagerClear();
        } else if (this.id === 'identify_pin') {
            if ($incident_ipin.length > 0) {
                $incident_ipin.show();
                $(':focus').blur();
                return;
            }
            popupIpin(document.getElementById('ipin-form'));
            //$identify_pin.show();
            channel.val('ipin');
            setManagerClear();
        } else  {
            if ($incident_email.length > 0) {
                $incident_email.show();
                $(':focus').blur();
                return;
            }
            $identify_mail.show();
            channel.val('mail');
            setManagerClear();
        }

    });

    function setManagerClear() {
        $('p[name="msg_email1"]').hide();
        $('p[name="msg_corp_charge"]').hide();
        $('p[name="msg_phone"]').hide();
        $('input[name="email_id"]').val('');
        $('input[name="manager_nm"]').val('');
        $('input[name="cellnum"]').val('');
    }

    $('#btn_mail_identify').on('click', function () {

        $('.email_list').hide();

        if (sms_confirm_complete.val() === 'y' || mail_confirm_complete.val() === 'y' || ipin_confirm_complete.val() === 'y') {
            alert('인증이 이미 완료되었습니다.');
            return;
        }

        var $mail_email_id = $('#mail_email_id'),
            email_str = $mail_email_id.val(),
            $layer = $('#layer_pop_byemail'),
            $email_status = $('#email_status'),
            channel_val = $('#channel').val()
        ;

        $('#' + channel_val + '_msg_email2').hide();
        //이메일 계정이 없거나, 메일 선택이 없을때
        if (email_str === '') {
            alert('이메일 주소를 입력해주세요.');
            return false;
        }

        if (!isPregEmail(email_str)) {
            alert('이메일 주소를 다시 확인해주세요');
            $mail_email_id.focus();
            $('#' + channel_val + '_msg_email1').text('이메일 주소를 다시 확인해주세요').show();
            return false;
        }

        $('#email').val(email_str);

        $.ajax({
            data: {'email': email_str}
            , dataType: 'json'
            , type: 'post'
            , url: '/zf_user/member/registration/ajax-company-email-check'
            , success: function (response) {
                var result = response.result;

                if (result === 'success') {
                    $email_status.val('y');
                    // $('#confirmFlag').val('y');
                    $('#' + channel_val + '_msg_email2').text('사용 가능한 이메일입니다.').show();

                    $layer.addClass('open');

                    companySendCodeAction();

                    channel.val('mail');
                    $('#email_layer_sub_title').html(email_str + '로 인증번호가 발송되었습니다.' + '<br />' + '이메일로 전달받은 인증번호를 입력해주세요.');
                    setLogScript('manager-info', 'e-mail', 'Email_input', 'Email_check');
                    email_code.focus();
                } else {
                    $email_status.val('n');
                    $('#' + channel_val + '_msg_email1').text('이미 사용중인 이메일 주소입니다.').show();

                    $('#p_already_id').text(response.duplicate_id);
                    $('#p_member_nudge').show()
                }

            }
        });


    });


    var companySendCodeAction = function() {

        var $email_id = $('#mail_email_id');
        var email = $email_id.val();

        if(!isPregEmail(email)) {
            $('body').css('overflow', '');
            layer_pop_byemail.removeClass('open');
            $email_id.focus();
            return alert("잘못된 이메일 주소입니다. 이메일 주소를 정확하게 입력해주세요.");
        }
        if (mail_confirm_complete.val() === 'y') {
            return alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
        }
        channel.val('mail');

        // if (overseas_fl.val() == '1' && channel.val() != 'sms') {
        //     $('#cell1').val('');
        //     $('#cell2').val('');
        //     $('#cell3').val('');
        //     cellnum.val('');
        // }

        $.ajax('/zf_user/member/registration/send-code', {
            type: 'POST',
            data: {
                phone: '',
                email: email,
                channel: channel.val(),
                needCheckLimit : 'y'
            },
            dataType: 'json',
            success: function (json) {
                if (json.code === 'limit.send') {
                    alert(json.msg);
                    returnBool = false;
                    return changeConfirmText('warning_txt', json.msg);
                }
                if (json == "invalid_phone") {
                    return changeConfirmText('warning_message', '휴대폰번호가 올바르지 않습니다.');
                }
                if (json == "invalid_email") {
                    return changeConfirmText('warning_message', '이메일주소가 올바르지 않습니다.');
                }
                if (json.code == "certification_notice") {
                    return changeConfirmText('warning_message', "일시적인 오류로 인하여 " + json.message + " 이용이 불가능합니다. 잠시 후 다시 이용해주세요.");
                }
                startConfirmTimer();
                return true;
            },
            error: function (e) {
                if (window.console) {
                    console.log(e);
                }
            },
            complete: function () {
            }
        });

    };

    $('.confirm-action.company').on('click', function (e) {

        if (mail_confirm_complete.val() === 'y') {
            alert("인증이 이미 완료되었습니다. 인증완료 버튼을 눌러주세요.");
            return;
        }
        channel.val('mail');

        email_id = $('#mail_email_id');
        var email = email_id.val();

        email_code.val($.trim(email_code.val()));
        var send_code = email_code.val();

        if (send_code === '') {
            changeConfirmText('warning_message', '인증번호를 입력해주세요.');
            return false;
        }

        $.ajax({
            url: '/zf_user/persons/validate-code',
            type: 'POST',
            data: {
                category: 'join',
                seq: $('#seq').val(),
                code: send_code,
                channel: channel.val(),
                phone: '',
                email: email
            },
            dataType: 'json',
            success: function (json) {
                if (json === 'confirms.verified') {
                    stopConfirmTimer();
                    sms_confirm_complete.val('n');
                    mail_confirm_complete.val('y');
                    email_code.attr('readonly', true);
                    confirm_remain_mail_time_area.html('');
                    $('#btn_mail_identify').addClass('on');
                    $('input[name="email_id"]').attr('readonly', true);
                    changeConfirmText('info_message', '인증되었습니다.');
                    idExsistCheck(email.split('@')[0]);
                    return;
                }
                // confirms.invalid_token
                mail_confirm_complete.val('n');
                changeConfirmText('warning_message', '인증번호가 틀렸습니다. 다시 입력해주세요.');
            },
            error: function (error) {
                stopConfirmTimer();
                changeConfirmText('warning_message', '인증번호 확인 오류. 다시 확인해주세요.');
            }
        });
    });

    function isPregEmail(email_str) {
        return /^[0-9a-z._+-]+@([0-9a-z_-]+\.)+[a-z]{2,10}$/i.test(email_str);
    }

    function popupCertify(form) {
        //if ( $('#c_frm').find('#tc_1_fl').val() == 'n' ||  $(c_frm).find('#tc_2_fl').val() == 'n' || !$(c_frm).find('#phone_cert').is(":checked") ) {
        // if ( !$(c_frm).find('#phone_cert').is(":checked") ) {
        //     alert('휴대폰 인증 항목에 동의해주세요.');
        //     return false;
        // }

        window.name = "Parent_window";
        var win = window.open('about:blank', 'popupCertify_2', 'width=500, height=461, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        win.blur();
        form.target = "popupCertify_2";
        form.submit();
        win.focus();
    }

    function popupIpin(form) {
        /*
         if ( $('#c_frm').find('#tc_1_fl').val() == 'n' ||  $(c_frm).find('#tc_2_fl').val() == 'n' ) {
         alert('약관에 동의해 주세요.');
         return false;
         }
         */
        window.name = "Parent_window";
        var win = window.open('about:blank', 'popupIpin_2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        win.blur();
        form.target = "popupIpin_2";
        form.submit();
        win.focus();
    }

});
