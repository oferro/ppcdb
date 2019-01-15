package com.oferr.ppcdb.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "Ppc")
@Table(name = "ppc")
public class Ppc {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "PPC_NAME", nullable = false, length = 15)
	private String ppName;

	@Column(name = "MANUF_NAME", length = 15)
	private String ppManuf;

	@Column(name = "ENGN_TYPE", length = 15)
	private String ppEnginType;

	@Column(name = "ENG_HOUR_START", precision = 5, scale = 1)
	private BigDecimal ppEngHourStart;

	@Column(name = "PPS_FUEL_QT", precision = 4, scale = 1)
	private BigDecimal ppFuelQt;

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Pilot.class)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "PPC_PILOT_MANG")
	private Pilot ppPilotMang;

	@Column(name = "PPC_NotACTIVE")
	private boolean ppNotActive;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "flPpc")
	@JsonIgnore
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "created"})
	private List<Flight> flights = new ArrayList<>();



	public Ppc() {
	}

	public Ppc(String ppName, String ppManuf, String ppEnginType, Double ppEngHourStart, Double ppFuelQt,
			Pilot ppUserMang, boolean ppNotActive) {
		super();
		this.setPpName(ppName);
		this.setPpManuf(ppManuf);
		this.setPpEnginType(ppEnginType);
		this.setPpEngHourStart(ppEngHourStart);
		this.setPpFuelQt(ppFuelQt);
		this.setPpPilotMang(ppUserMang);
		this.setPpNotActive(ppNotActive);
	}

	// Getter and setter

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPpName() {
		return ppName;
	}

	public void setPpName(String ppName) {
		this.ppName = ppName;
	}

	public String getPpManuf() {
		return ppManuf;
	}

	public void setPpManuf(String ppManuf) {
		this.ppManuf = ppManuf;
	}

	public String getPpEnginType() {
		return ppEnginType;
	}

	public void setPpEnginType(String ppEnginType) {
		this.ppEnginType = ppEnginType;
	}

	public BigDecimal getPpEngHourStart() {
		return ppEngHourStart;
	}

	public void setPpEngHourStart(Double ppEngHourStart) {
		this.ppEngHourStart = BigDecimal.valueOf(ppEngHourStart);
	}
	
	public void setPpEngHourStart(String ppEngHourStart) {
		double engHour = Float.parseFloat(ppEngHourStart); 
		this.ppEngHourStart = BigDecimal.valueOf(engHour);
	}

	public BigDecimal getPpFuelQt() {
		return ppFuelQt;
	}

	public void setPpFuelQt(Double ppFuelQt) {
		this.ppFuelQt = BigDecimal.valueOf(ppFuelQt);
	}
	
	public void setPpFuelQt(String ppFuelQt) {
		double fuelQt = Float.parseFloat(ppFuelQt);
		this.ppFuelQt = BigDecimal.valueOf(fuelQt);
	}
	
	public Pilot getPpPilotMang() {
		return ppPilotMang;
	}

	public void setPpPilotMang(Pilot ppPilotMang) {
		this.ppPilotMang = ppPilotMang;
	}

	public List<Flight> getFlights() {
		return flights;
	}

	public void setFlights(List<Flight> flights) {
		this.flights = flights;
	}

	public boolean isPpNotActive() {
		return ppNotActive;
	}

	public void setPpNotActive(boolean ppNotActive) {
		this.ppNotActive = ppNotActive;
	}

//  Flight obj udtade from Ppc class
	public void addFlight(Flight flight) {
       flights.add(flight);
       flight.setFlPpc(this);
   }

   public void removeFlight(Flight flight) {
       flights.remove(flight);
       flight.setFlPpc(null);
   }

}
