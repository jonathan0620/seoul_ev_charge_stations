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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37e16c9961b8fe4828baa1c828c1fda7"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.mapContainer {
	display: flex;
	flex-direction: row;
}

.mapLeftWrap {
	width: 30%;
	margin-top: 10px;
	margin-left: 10px;
}

.mapContainer .mapLeftWrap {
	transform: rotate(0);
	position: absolute;
	left: 0;
	height: 400px;
	background-color: #fff;
	width: 377px;
	box-shadow: 0 0 10px #ffc107;
	border-right: 1px solid #ffc107;
	z-index: 2;
	min-height: 50rem;
}

.mapContainer .mapLeftWrap .mapLeft {
	background-color: #fff;
	border-bottom: 1px solid #dddddd;
	display: flex;
	flex-direction: column;
	height: 400px;
}

.mapLeftWrap {
	display: none;
}

.mapLeftWrap.ev {
	display: block;
}

.mapLeftWrap .subPageTab {
	margin-bottom: 0.7rem;
	padding: 2.5rem 2.5rem 1rem 2.5rem;
	background-color: #fff;
	margin-bottom: 0;
}

.mapLeftWrap .subPageTab.white {
	background-color: #fff;
}

.mapLeftWrap .subPageTab li a {
	font-size: 1.6rem;
	color: #666;
	font-weight: 400;
	padding: 0 0 1.1rem 0;
}

.mapLeftWrap .subPageTab li.on a {
	color: #2c7fdf;
	font-weight: 500;
}

.mapLeftWrap .mapLeft span * {
	vertical-align: middle;
}

.mapLeftWrap .subPageTab>li:hover:before, .mapLeftWrap .subPageTab>li.on:before
	{
	width: 700px;
	left: 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<!-- 상단바 -->
	<div id="top">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="mapContainer">
		<!-- 지도 -->
		<div id="map"
			style="width: 100%; height: 800px; margin-top: 10px; outline: none"></div>
		<!-- 지도 왼쪽 메뉴바 -->
		<div class="mapLeftWrap ev" style="">
			<ul class="subPageTab">
				<li class="on">충전소 검색</li>
			</ul>
			<div class="mapLeft">
				<div class="mapTab searchTab on">
					<div class="mapSrch">
						<ul>
							<li>
								<p>
									<label for="">지역선택 <span class="nece"></span></label>
								</p> <select id="F_SI_DO1" title="서울특별시" tabindex="0">
									<option value="11">서울특별시</option>
							</select> <span id="sido_change" style="display: none;"></span> <select
								id="F_GU_GUN1" title="구 선택" tabindex="0">
									<option value="">구 선택</option>
									<option value="110">종로구</option>
									<option value="140">중구</option>
									<option value="170">용산구</option>
									<option value="200">성동구</option>
									<option value="215">광진구</option>
									<option value="230">동대문구</option>
									<option value="260">중랑구</option>
									<option value="290">성북구</option>
									<option value="305">강북구</option>
									<option value="320">도봉구</option>
									<option value="350">노원구</option>
									<option value="380">은평구</option>
									<option value="410">서대문구</option>
									<option value="440">마포구</option>
									<option value="470">양천구</option>
									<option value="500">강서구</option>
									<option value="530">구로구</option>
									<option value="545">금천구</option>
									<option value="560">영등포구</option>
									<option value="590">동작구</option>
									<option value="620">관악구</option>
									<option value="650">서초구</option>
									<option value="680">강남구</option>
									<option value="710">송파구</option>
									<option value="740">강동구</option>
							</select> <span id="sigungu_change" style="display: none;"></span>
							</li>
							<li>
								<p>
									<label for="">충전소 분류</label>
								</p> <select name="F_STAT_TYPE1" id="F_STAT_TYPE1" class="w50p"
								title="충전소 분류" tabindex="0">
									<option value="">전체</option>
									<option value="A0">공공시설</option>
									<option value="B0">주차시설</option>
									<option value="C0">휴게시설</option>
									<option value="D0">관광시설</option>
									<option value="E0">상업시설</option>
									<option value="F0">차량정비시설</option>
									<option value="H0">공동주택시설</option>
									<option value="I0">근린생활시설</option>
									<option value="J0">교육문화시설</option>
									<option value="G0">기타시설</option>
							</select> <input type="checkbox" name="F_24HOUR1" id="F_24HOUR1" value="1"
								tabindex="0"> <label for="F_24HOUR1">24시간 이용</label>
							</li>
							<li>
								<p>
									<label for="F_CHGE_TYPE1">충전기 타입</label>
								</p> <select name="F_CHGE_TYPE1" id="F_CHGE_TYPE1" class="w100p"
								tabindex="0">
									<option value="">전체</option>
									<option value="01">DC차데모</option>
									<option value="02">AC완속</option>
									<option value="03">DC차데모+AC3상</option>
									<option value="04">DC콤보</option>
									<option value="05">DC차데모+DC콤보</option>
									<option value="06">DC차데모+AC3상+DC콤보</option>
									<option value="07">AC3상</option>
							</select> <select name="F_SEARCH_TYPE1" id="F_SEARCH_TYPE1" class="w33p">
									<option value="station">충전소</option>
									<option value="area">지역명</option>
							</select> <input type="text" id="F_STAT_NAME1" name="key_search"
								placeholder="검색어 입력" title="검색어 입력" tabindex="0">
							</li>
							<li id="f_search_area" style="display: none;">
								<p>
									<label for="">검색반경</label>
								</p> <span><input type="radio" name="item" id="chk01"
									title="3km" value="3" onclick="radiusChange(3);"
									checked="checked" tabindex="0"> <label for="chk01">3km</label></span>
								<span><input type="radio" name="item" id="chk02"
									title="5km" value="5" onclick="radiusChange(5);" tabindex="0">
									<label for="chk02">5km</label></span> <span><input type="radio"
									name="item" id="chk03" title="10km" value="10"
									onclick="radiusChange(10);" tabindex="0"> <label
									for="chk03">10km</label></span>
							</li>
						</ul>
						<div id="restart" class="btnWrap">
							<button href="#" id="BTN_FIND_BY_NAME" tabindex="0">검색하기</button>
							<button href="#" class="blue" onclick="clearSearch();"
								tabindex="0">초기화</button>
						</div>
					</div>
					<div class="list" id="statList">
						<!-- style="height: calc(100vh - 671px); -->
						<!-- <ul class="chargerList">
							<li id="ME18B279" sid=" ME18B279"><a href="#"
								onclick="javascript:onClickStationOfList('ME18B279', '0'); return false;"
								onkeypress="this.onclick;" title="강동구청"><div class="icon"
										style="background: url(../img/monitor/logo/logo_00.png) center no-repeat; background-size: 60% !important;"></div>
									<div>
										<p class="title">강동구청</p>
										<p>
											<span class="state">사용가능</span><span class="type">급속</span>
										</p>
									</div></a></li>
							<li id="ME20A197" sid=" ME20A197"><a href="#"
								onclick="javascript:onClickStationOfList('ME20A197', '0'); return false;"
								onkeypress="this.onclick;" title="길동복합청사"><div class="icon"
										style="background: url(../img/monitor/logo/logo_00.png) center no-repeat; background-size: 60% !important;"></div>
									<div>
										<p class="title">길동복합청사</p>
										<p>
											<span class="state">사용가능</span><span class="type">급속</span>
										</p>
									</div></a></li>
							<li id="ME174003" sid=" ME174003"><a href="#"
								onclick="javascript:onClickStationOfList('ME174003', '0'); return false;"
								onkeypress="this.onclick;" title="암사1동 공영주차장"><div
										class="icon"
										style="background: url(../img/monitor/logo/logo_00.png) center no-repeat; background-size: 60% !important;"></div>
									<div>
										<p class="title">암사1동 공영주차장</p>
										<p>
											<span class="state state_gr">사용중</span><span class="type">급속</span>
										</p>
									</div></a></li>
							<li id="ME174005" sid=" ME174005"><a href="#"
								onclick="javascript:onClickStationOfList('ME174005', '0'); return false;"
								onkeypress="this.onclick;" title="천호3동 제1공영주차장"><div
										class="icon"
										style="background: url(../img/monitor/logo/logo_00.png) center no-repeat; background-size: 60% !important;"></div>
									<div>
										<p class="title">천호3동 제1공영주차장</p>
										<p>
											<span class="state">사용가능</span><span class="type">급속</span>
										</p>
									</div></a></li>
							<li id="ME174004" sid=" ME174004"><a href="#"
								onclick="javascript:onClickStationOfList('ME174004', '0'); return false;"
								onkeypress="this.onclick;" title="천호유수지 공영주차장"><div
										class="icon"
										style="background: url(../img/monitor/logo/logo_00.png) center no-repeat; background-size: 60% !important;"></div>
									<div>
										<p class="title">천호유수지 공영주차장</p> -->
						<p>
							<span class="state">사용가능</span><span class="type">급속</span>
						</p>
					</div>
				</div>
				<div class="list" id="statList">
					<!-- style="height: calc(100vh - 671px); -->
					<ul>
						<li class="force_justify_center">검색 결과가 없습니다.</li>
						<li class="force_justify_center">[검색하기]를 클릭하세요.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<script>
		// 지도에 전체 충전소 불러오기
		$(function() {
			$
					.ajax({
						url : "getAllChargingStations",
						success : function(json) {
							console.log(json)
							var mapContainer = document.getElementById('map'), mapOption = {
								center : new kakao.maps.LatLng(37.5132,
										127.1002), // 지도의 중심좌표
								level : 3
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

							for (var i = 0; i < json.length; i++) {
								var position = json[i];
								var latlng = new kakao.maps.LatLng(
										position.c_lat, position.c_lon);
								var imageSize = new kakao.maps.Size(24, 35);
								var markerImage = new kakao.maps.MarkerImage(
										imageSrc, imageSize);

								var marker = new kakao.maps.Marker({
									map : map,
									position : latlng,
									title : position.c_name,
									image : markerImage
								});
							}//for
						}//success
					})//ajax
		})//$

		//버튼
		function toggleLeftPanel() {
			$(".mapLeftWrap").toggleClass("closed");
		}
	</script>
</body>
</html>