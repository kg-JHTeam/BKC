//메뉴상태변화
	function status(status, id) {
		var btn = document.getElementById(id);
		var value = btn.value; 

		if (value == "판매중") {
			var input = confirm("판매 중지상태로 변경하시겠습니까?");
			if (input == true) {
				//판매중지로 변경. 
				btn.className = "btn btn-danger";
				btn.value = "판매중지";

				//DB에서 처리
				var product_serial = id;
				var contextpath = "<c:out value='${contextPath}'/>";
				
				window.location.href = "changeUseStatus.ad?product_serial="+id;
			} else {
				return;
			}
		} else {
			var input = confirm("판매중 상태로 변경하시겠습니까?");
			if (input == true) {
				//판매중으로 변경.
				btn.className = "btn btn-info";
				btn.value = "판매중"

				//DB에서 처리
				var product_serial = id;
				var contextpath = "<c:out value='${contextPath}'/>";
				window.location.href = "changeUseStatus.ad?product_serial="+id;
			} else {
				return;
			}
		}
	}
	//메뉴카테고리변경
	function chageSelect(){
		var select = document.getElementById("select1");
	    var selectValue = select.options[select.selectedIndex].value;
	    var contextpath = "<c:out value='${contextPath}'/>";
	    
	    if(selectValue == "all"){
	    	 window.location.href = "adminAllList.ad";
	    } else if(selectValue == "chicken"){
	    	 window.location.href = "adminchickenlist.ad";
	    } else if(selectValue == "beerzone"){
	    	 window.location.href = "adminbeerlist.ad";
	    } else if(selectValue == "sidemenu"){
	    	window.location.href = "adminsidelist.ad"
	    }else if(selectValue=="newmenu"){
	    	window.location.href = "adminnewlist.ad"
	    }
	}
	
	
	