<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전기자동차 타요타요</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7gg2vpangl"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
/* background-color: #3498db; */
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    var chargingStationArray = ${chargingStationArray};
    var chargingStations = ${chargingStations};

    $(document).ready(function () {
        var mapOptions = {
            useStyleMap: true,
            scaleControl: true,
            logoControl: false,
            mapDataControl: true,
            mapTypeControl: true,
            zoomControl: true,
            center: new naver.maps.LatLng(37.5132, 127.1002),
            zoom: 16
        };
        var map = new naver.maps.Map(document.getElementById('map'), mapOptions);

        // 충전소 마커 추가
        if (chargingStationArray && chargingStationArray.length > 0) {
            for (var i = 0; i < chargingStationArray.length; i++) {
                var position = chargingStationArray[i]?.split(","); // null이나 undefined인 경우에는 undefined로 설정
                if (position && position.length === 2) {
                    var marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(position[0], position[1]),
                        map: map
                    });
                }
            }
        }

        // JSTL을 사용하여 서버에서 받아온 충전소 정보 표시
        if (chargingStations && chargingStations.length > 0) {
            for (var i = 0; i < chargingStations.length; i++) {
                var station = chargingStations[i];
                // 속성이 정의되었는지 확인
                if (station && station.c_lat != null && station.c_lon != null) {
                    var lat = station.c_lat;
                    var lon = station.c_lon;
                    var name = station.c_name || "";
                    var address = station.c_address || "";
                    var chargeType = station.c_charge_type || "";
                    var chargeCapacity = station.c_charge_capacity || "";

                    console.log("위도: " + lat);
                    console.log("경도: " + lon);

                    // 마커에 표시할 내용 추가
                    var contentString = '<div>' +
                        '<h5>' + name + '</h5>' +
                        '<p>주소: ' + address + '</p>' +
                        '<p>충전 타입: ' + chargeType + '</p>' +
                        '<p>충전 용량: ' + chargeCapacity + '</p>' +
                        '</div>';

                    // 마커 생성
                    var marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(lat, lon),
                        map: map
                    });

                    // 인포윈도우 생성
                    var infowindow = new naver.maps.InfoWindow({
                        content: contentString
                    });

                    // 마커를 클릭하면 인포윈도우 표시
                    naver.maps.Event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                }
            }
        }
    });
</script>
</head>
<body>
	<!-- 상단바 -->
	<div id="top">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<!-- 필터링 -->
	<!-- 	<div>
		<label for="filter" style="margin-bottom: 10px; margin-right: 10px;">서울시
			충전소 찾기</label>
		<div id="filters">
			<label for="district">구 선택:</label> <select id="district"
				onchange="filterMarkers()">
				<option value="all">전체</option>
				<option value="gangnam">강남구</option>
				<option value="gangbuk">강북구</option>
				<option value="gangdong">강동구</option>
				<option value="gangseo">강서구</option>
				<option value="gwanak">관악구</option>
				<option value="gwangjin">광진구</option>
				<option value="guro">구로구</option>
				<option value="geumcheon">금천구</option>
				<option value="nowon">노원구</option>
				<option value="dobong">도봉구</option>
				<option value="dongdaemun">동대문구</option>
				<option value="dongjak">동작구</option>
				<option value="mapo">마포구</option>
				<option value="seodaemun">서대문구</option>
				<option value="seocho">서초구</option>
				<option value="sungdong">성동구</option>
				<option value="sungbuk">성북구</option>
				<option value="songpa">송파구</option>
				<option value="yangcheon">양천구</option>
				<option value="yeongdeungpo">영등포구</option>
				<option value="yongsan">용산구</option>
				<option value="eunpyeong">은평구</option>
				<option value="jongno">종로구</option>
				<option value="junggu">중구</option>
				<option value="jungrang">중랑구</option>
			</select> <label for="chargeType">충전소 타입:</label> <select id="chargeType"
				onchange="filterMarkers()">
				<option value="all">전체</option>
				<option value="fast">급속</option>
				<option value="normal">완속</option>
			</select><label for="chargeType">충전소 선택:</label> <select id="chargeName"
				onchange="filterMarkers()">
				<option value="all">전체</option>
				<option value="charger1">충전소명1</option>
				<option value="charger2">충전소명2</option>
			</select>
		</div>
	</div> -->

	<!-- 지도 표시 -->
	<div id="map"
		style="width: 1130px; height: 480px; margin-top: 10px; outline: none"></div>
</body>
</html>