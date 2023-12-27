<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<!-- 상단바 -->
	<div id="top">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<!-- 필터링 -->
	<div>
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
	</div>

	<div id="map"
		style="width: 1130px; height: 480px; margin-top: 10px; outline: none"></div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		// 사용자의 위치를 가져오는 함수
		function getUserLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition,
						showError);
			} else {
				alert("Geolocation is not supported by this browser.");
			}
		}

		// 위치 정보를 성공적으로 가져왔을 때 호출되는 콜백 함수
		function showPosition(position) {
			var userLat = position.coords.latitude;
			var userLng = position.coords.longitude;

			// 가져온 위치 정보를 이용하여 지도에 마커 표시
			showMap(userLat, userLng);
			// 서버에서 충전소 데이터를 받아와 지도에 마커 표시
			fetchChargingStations(userLat, userLng);
		}

		// 위치 정보를 가져오는데 실패했을 때 호출되는 콜백 함수
		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				alert("사용자가 위치 정보 제공을 거부했습니다.");
				break;
			case error.POSITION_UNAVAILABLE:
				alert("위치 정보를 사용할 수 없습니다.");
				break;
			case error.TIMEOUT:
				alert("위치 정보를 가져오는데 시간이 초과되었습니다.");
				break;
			case error.UNKNOWN_ERROR:
				alert("알 수 없는 오류가 발생했습니다.");
				break;
			}
		}

		// 지도에 마커를 표시하는 함수
		function showMap(latitude, longitude) {
			var mapOptions = {
				center : new naver.maps.LatLng(latitude, longitude),
				zoom : 16
			};

			var map = new naver.maps.Map('map', mapOptions);

			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(latitude, longitude),
				map : map
			});
		}

		// 서버에서 충전소 데이터를 받아와 지도에 마커 표시하는 함수
		function fetchChargingStations(userLat, userLng) {
			$.ajax({
				url : "/findNearbyChargingStations",
				type : "GET",
				data : {
					userLat : userLat,
					userLng : userLng
				},
				success : function(chargingStations) {
					// 받아온 충전소 데이터를 이용하여 지도에 마커 표시
					showMarkers(chargingStations);
				},
				error : function() {
					alert("충전소 데이터를 불러오는데 실패했습니다.");
				}
			});
		}

		// 받아온 충전소 데이터를 이용하여 지도에 마커 표시하는 함수
		function showMarkers(chargingStations) {
			var map = naver.maps.Map(document.getElementById('map'));
			var markers = [];

			chargingStations.forEach(function(station) {
				var marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(station.c_lat,
							station.c_lon),
					map : map
				// 마커에 대한 추가 설정도 가능
				});

				// 마커를 배열에 추가
				markers.push(marker);
			});
		}

		// 페이지 로드 시 사용자의 위치 가져오기
		getUserLocation();
	</script>
	<!-- 	<script>
	 $(document).ready(function () {
		 var mapOptions = 
		 {
		 	useStyleMap: true,
		 	scaleControl: true,
		 	logoControl: false,
		 	mapDataControl: true,
		 	mapTypeControl: true,
		 	zoomControl: true,
		 	center: new naver.maps.LatLng(37.5439017, 126.9511353),
		 	zoom:16
		 };

		 var map = new naver.maps.Map(document.getElementById('map'), mapOptions);

	        // AJAX를 사용하여 서버에서 충전소 데이터 가져오기
	        $.ajax({
	            type: 'GET',
	            url: '서버에서_데이터를_가져올_엔드포인트', // 실제 서버 엔드포인트로 교체
	            dataType: 'json',
	            success: function (chargingStations) {
	                showMarkers(chargingStations);
	            },
	            error: function (error) {
	                console.error('충전소 데이터를 가져오는 중 에러 발생:', error);
	            }
	        });

	        var markers = [];

	        function showMarkers(stations) {
	            for (var i = 0; i < stations.length; i++) {
	                var station = stations[i];
	                var marker = createMarker(station);
	                markers.push(marker);
	            }
	        }

		function createMarker(station) {
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(station.lat, station.lon),
				map : map,
				icon : getMarkerIcon(station.chargeType)
			});

			// 마커 클릭 시 정보 표시
			naver.maps.Event.addListener(marker, 'click', function() {
				// 정보 창을 열고 원하는 정보를 표시하는 코드 추가
				// 예: infowindow.open(map, marker);
			});

			return marker;
		}

		function getMarkerIcon(chargeType) {
			var iconColor = (chargeType === 'fast') ? 'green' : 'blue';
			return {
				content : '<div style="background:' + iconColor
						+ ';width:20px;height:20px;border-radius:50%;"></div>',
				size : new naver.maps.Size(20, 20),
				anchor : new naver.maps.Point(10, 10)
			};
		}

		function filterMarkers() {
			var districtFilter = document.getElementById('district').value;
			var chargeTypeFilter = document.getElementById('chargeType').value;
			var chargeNameFilter = document.getElementById('chargeName').value;

			for (var i = 0; i < markers.length; i++) {
				var marker = markers[i];
				var station = chargingStations[i];

				var districtMatch = (districtFilter === 'all' || station.district === districtFilter);
				var chargeTypeMatch = (chargeTypeFilter === 'all' || station.chargeType === chargeTypeFilter);
				var chargeNameMatch = (chargeNameFilter === 'all' || station.chargeName === chargeNameFilter);

				if (districtMatch && chargeTypeMatch && chargeNameMatch) {
					marker.setMap(map);
				} else {
					marker.setMap(null);
				}
			}
		}
	</script> -->
</body>
</html>