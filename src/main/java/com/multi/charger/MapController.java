package com.multi.charger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {

	@Autowired
	private MapService mapService;

	@RequestMapping("getAllChargingStations")
	@ResponseBody
	public List<MapVO> getAllChargingStationsall(Double c_lat, Double c_lon) {
		return mapService.getAllChargingStationsall();
	}
}
