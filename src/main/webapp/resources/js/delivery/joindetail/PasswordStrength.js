/**
 * Password Strength Class
 *
 * @author xhunter 2013 패스워드정책강화
 * @date 2013-09-06
 * @version $Id$
 */


var PasswordStrength = {
    _message: "",
    strengthHash: {
        0: "",
        1: "사용불가 (안전성 강도 매우 약함)",
        2: "사용불가 (안전성 강도 약함)",
        3: "사용가능한 비밀번호입니다. (안전성 강도 보통)",
        4: "사용가능한 비밀번호입니다. (안전성 강도 강함)",
        5: "사용가능한 비밀번호입니다. (안전성 강도 매우 강함)"
    },
    messages: {
        "base": "8~16자리 영문 대소문자, 숫자, 특수문자 중 3가지 이상 조합",
        "equalid": "아이디와 동일한 비밀번호는 사용할 수 없습니다.",
        "equalold": "현재 사용중인 비밀번호는 사용할 수 없습니다.",
        "repeat": "3자리 이상 반복되는 영문, 숫자, 특수문자는 비밀번호로 사용할 수 없습니다.",
        "consecutive": "3자리 이상 연속되는 영문, 숫자, 특수문자는 비밀번호로 사용할 수 없습니다.",
        "blank": ""
    },
    isValid: function () {
    },
    getMessage: function () {
        return this._message;
    },
    getStrength: function () {
        return this.strengthHash[this._lv];
    },
    verify: function (passwd, old, user_id) {
        var len   = passwd.length,
            score = 0;

        if (/^\s*$/.test(passwd)) {
            this._message = "비밀번호를 입력해 주십시오";
            this._lv = 0;
            return false;
        }

        if (user_id && user_id === passwd) {
            this._message = this.messages.equalid;
            this._lv = 1;
            return false;
        }

        if (old && old === passwd) {
            this._message = this.messages.equalold;
            this._lv = 1;
            return false;
        }


        // 동일 문자 및 연속된 문자 확인
        var sameword = 0;
        var step = 0;
        var rStep = 0;
        var word1, word2, i;

        for (i = 0; i < len - 1; i++) {
            word1 = passwd.substr(i, 1);
            word2 = passwd.substr(i + 1, 1);

            if (word1 === word2) {
                sameword++;
            } else if (sameword < 2) {
                sameword = 0;
            }

            if (word1.charCodeAt(0) === word2.charCodeAt(0) - 1) {
                step++;
            } else if (step < 2) {
                step = 0;
            }

            if (word1.charCodeAt(0) === word2.charCodeAt(0) + 1) {
                rStep++;
            } else if (rStep < 2) {
                rStep = 0;
            }
        }

        if (sameword >= 2) {
            // 3자리 이상 반복되는 영문, 숫자, 특수문자는 사용할 수 없습니다.
            this._message = this.messages.repeat;
            this._lv = 1;
            return false;
        }
        if (step >= 2) {
            // 3자리 이상 연속되는 영문, 숫자, 특수문자는 사용할 수 없습니다.
            this._message = this.messages.consecutive;
            this._lv = 1;
            return false;
        }
        if (rStep >= 2) {
            // 3자리 이상 연속되는 영문, 숫자, 특수문자는 사용할 수 없습니다.
            this._message = this.messages.consecutive;
            this._lv = 1;
            return false;
        }

        var sSymbols = ")!@#$%^&*()";
        var sRSymbols = "!)(*&^%$#@!";
        /* Check for sequential symbol string patterns (forward and reverse) */
        for (var s = 0; s < 8; s++) {
            var sFwd = sSymbols.substring(s, parseInt(s + 3));
            var sRev = sRSymbols.substring(s, parseInt(s + 3));
            if (passwd.toLowerCase().indexOf(sFwd) !== -1 || passwd.toLowerCase().indexOf(sRev) !== -1) {
                this._message = this.messages.consecutive;
                this._lv = 1;
                return false;
            }
        }

        score++;

        if (len < 8 || len > 16) {
            this._message = this.messages.base;
            this._lv = 1;
            return false;
        }

        score++;


        var nComplexity = 0;
        if (passwd.match(/[A-Z]/)) {
            nComplexity++;
        }
        if (passwd.match(/[a-z]/)) {
            nComplexity++;
        }
        if (passwd.match(/[0-9]/)) {
            nComplexity++;
        }
        if (passwd.match(/[^a-zA-Z0-9]/)) {
            nComplexity++;
        }

        if (nComplexity < 3) {
            this._message = this.messages.base;
            this._lv = 2;
            return false;
        }

        if (nComplexity < 3 && len < 8) {
            // 최소 8자 이상 또는 3종류 이상을 조합하여 비밀번호를 구성하여 주십시오
            this._message = this.messages.base;
            this._lv = 2;
            return false;
        }

        score++;

        if (len > 10 && nComplexity > 2) {
            score++;
        }

        if (len > 12 && nComplexity > 2) {
            score++;
        }

        this._lv = score;
        return true;
    }
}