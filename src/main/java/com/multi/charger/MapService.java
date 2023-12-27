package com.multi.charger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapService {

	private MapDAO mapDAO;

	@Autowired
	public MapService(MapDAO mapDAO) {
		this.mapDAO = mapDAO;
	}

	public List<MapVO> getAllChargingStationsall() {
		return mapDAO.getAllChargingStationsall();
	}

	/*
	 * public List<MapVO> getAllChargingStations() { List<MapVO> chargingStations =
	 * mapDAO.getAllChargingStations(); logger.info("Service: {}",
	 * chargingStations); return chargingStations; } public List<MapVO>
	 * getFilteredChargingStations(MapVO filter) { return
	 * mapDAO.getFilteredChargingStations(filter); }
	 */
}