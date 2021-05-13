//geolocation 실행
/**window.onload = function() {
    if (navigator.geolocation) {
        navigator
            .geolocation
            .getCurrentPosition(MyPosition);
    }
    searchPlaces();
}

function MyPosition(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    var latlng = new kakao
        .maps
        .LatLng(lat, lng);
    var options = {
        level: 3,
        center: latlng,
        mapTypeId: kakao.maps.MapTypeId.ROADMAP
    };
    var map = new kakao
        .maps
        .Map(document.getElementById("map"), options);
}**/
// 마커를 담을 배열입니다
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao
            .maps
            .LatLng(37.58295875131805, 127.00252629768936), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao
    .maps
    .Map(mapContainer, mapOption);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao
    .maps
    .ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 장소 검색 객체를 생성합니다
var ps = new kakao
    .maps
    .services
    .Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao
    .maps
    .InfoWindow({ zIndex: 1 });

// 키워드로 장소를 검색합니다
// searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document
        .getElementById('keyword')
        .value + ' BHC치킨';

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('검색어를 입력하세요');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB);

}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'),
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(),
        bounds = new kakao
        .maps
        .LatLngBounds(),
        listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for (var i = 0; i < places.length; i++) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao
            .maps
            .LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다 마커와 검색결과 항목에click 했을때 해당 장소에 인포윈도우에 장소명을 생성합니다.

        (function(marker, title) {
            kakao
                .maps
                .event
                .addListener(marker, 'click', function() {
                    displayInfowindow(marker, title);
                });
            itemEl.onclick =  function () {
                displayInfowindow(marker, title);
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (
            index + 1
        ) + '"></span><div class="info">   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span class="address">' + places.road_address_name + '</span>';
    } else {
        itemStr += '   <span class="address">' + places.address_name + '</span>';
    }

    itemStr += '  <span class="tel">' + places.phone + '</span></div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://bkcbuc.s3.ap-northeast-2.amazonaws.com/bkc_img/icon/findstore/nowlocat' +
        'ion.png', // 마커 이미지 url,
        imageSize = new kakao
        .maps
        .Size(30, 43), // 마커 이미지의 크기
        imgOptions = {

            offset: new kakao
                .maps
                .Point(15, 35) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },

        markerImage = new kakao
        .maps
        .MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao
        .maps
        .Marker({
            position: position, // 마커의 위치
            image: markerImage
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker); // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild(paginationEl.lastChild);
    }

    for (i = 1; i <= pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i === pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
    // 지도를 표시하는 div 크기를 변경하는 함수입니다
    function resizeMap() {
        var mapContainer = document.getElementById('map');
        mapContainer.style.width = '650px';
        mapContainer.style.height = '650px';
    }

    function relayout() {

        // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다 크기를 변경한 이후에는 반드시
        // map.relayout 함수를 호출해야 합니다 window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로
        // 호출됩니다
        map.relayout();
    }
}