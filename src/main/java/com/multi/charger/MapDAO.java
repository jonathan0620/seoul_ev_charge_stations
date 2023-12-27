package com.multi.charger;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDAO {

	@Autowired
	private SqlSessionTemplate my;

	public List<MapVO> getAllChargingStationsall() {
		List<MapVO> chargingStations = my.selectList("map.getAllChargingStations");
		return chargingStations;
	}
}

/*
 * public List<MapVO> getAllChargingStations() { List<MapVO> chargingStations =
 * my.selectList("map.selectAllChargingStations"); logger.info("MapDAO: {}",
 * chargingStations); return chargingStations; private static final Logger
 * logger = LoggerFactory.getLogger(MapDAO.class); public List<MapVO>
 * getFilteredChargingStations(MapVO filter) { return
 * my.selectList("map.chargeSelect", filter); }
 */
