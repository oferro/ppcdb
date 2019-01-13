package com.oferr.ppcdb.domain;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name="Flight")
@Table(name="flight")
public class Flight {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Ppc.class)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "FL_PPC")
	private Ppc flPpc; 
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Pilot.class)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "FL_PILOT")
	private Pilot flPilot;
	
	@Column(name = "FL_DATE")
//	@Temporal(TemporalType.DATE)
	private LocalDate flDate;

	@Column(name = "FL_TO_TIME")
//	@Temporal(TemporalType.TIME)
	private LocalTime flToTime;
	
	@Column(name = "FL_Lnd_TIME")
//	@Temporal(TemporalType.TIME)
	private LocalTime flLndTime;
	
	@Column(name = "FL_PASSENGER_NAME", length = 20)
	private String flPassengerName;
	
	@Column(name = "FL_AIR_FIELD", length = 30)
	private String flAirField;
	
	@Column(name = "FL_ROUTE", length = 255)
	private String flRoute;
	
	@Column(name = "FL_ENG_HOUR_START", precision = 5, scale = 1)
	private BigDecimal flEngHourStart;

	@Column(name = "FL_ENG_HOUR_END", precision = 5, scale = 1)
	private BigDecimal flEngHourEnd;

	@Column(name = "FL_FUEL_QT", precision = 4, scale = 1)
	private BigDecimal flFuelQt;

	@Column(name = "FL_OIL_QT",  precision = 4, scale = 1)
	private BigDecimal flOilQt;

	@Column(name = "FL_OTHER_EXP", precision = 8, scale = 2)
	private BigDecimal flOtherExp;

	@Column(name = "FL_MAITENANCE", length = 255)
	private String flMaitenance;
	
	@Column(name = "FL_REMARK", length = 255)
	private String flRemark;
	
	// Constractor
	
	public Flight() {
	}
	
	public Flight(Ppc flPpc, Pilot flPilot, LocalDate flDate, LocalTime flToTime, LocalTime flLndTime, String flPassengerName,
			String flAirField, String flRoute, double flEngHourStart, double flEngHourEnd, double flFuelQt,
			double flOilQt, double flOtherExp, String flMaitenance, String flRemark) {
		super();
		this.setFlPpc(flPpc);
		this.setFlPilot(flPilot);
		this.setFlDate(flDate);
		this.setFlToTime(flToTime);
		this.setFlLndTime(flLndTime);
		this.setFlPassengerName(flPassengerName);
		this.setFlAirField(flAirField);
		this.setFlRoute(flRoute);
		this.setFlEngHourStart(flEngHourStart);
		this.setFlEngHourEnd(flEngHourEnd);
		this.setFlFuelQt(flFuelQt);
		this.setFlOilQt(flOilQt);
		this.setFlOtherExp(flOtherExp);
		this.setFlMaitenance(flMaitenance);
		this.setFlRemark(flRemark);
	}
	

	
	// Getter & Setter

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Ppc getFlPpc() {
		return flPpc;
	}

	public void setFlPpc(Ppc flPpc) {
		this.flPpc = flPpc;
	}

	public Pilot getFlPilot() {
		return flPilot;
	}

	public void setFlPilot(Pilot flPilot) {
		this.flPilot = flPilot;
	}

	public LocalDate getFlDate() {
		return flDate;
	}

	public void setFlDate(LocalDate flDate) {
		this.flDate = flDate;
	}
	
	public void setFlDate(String flDate) {
		this.flDate = LocalDate.parse(flDate);
	}
	
	
	public LocalTime getFlToTime() {
		return flToTime;
	}

	public void setFlToTime(LocalTime flToTime) {
		this.flToTime = flToTime;
	}

	public void setFlToTime(String flToTime) {
		this.flToTime = LocalTime.parse(flToTime);
	}


	public LocalTime getFlLndTime() {
		return flLndTime;
	}

	public void setFlLndTime(LocalTime flLndTime) {
		this.flLndTime = flLndTime;
	}

	public void setFlLndTime(String flLndTime) {
		this.flLndTime = LocalTime.parse(flLndTime);
	}


	public String getFlPassengerName() {
		return flPassengerName;
	}

	public void setFlPassengerName(String flPassengerName) {
		this.flPassengerName = flPassengerName;
	}

	public String getFlAirField() {
		return flAirField;
	}

	public void setFlAirField(String flAirField) {
		this.flAirField = flAirField;
	}

	public String getFlRoute() {
		return flRoute;
	}

	public void setFlRoute(String flRoute) {
		this.flRoute = flRoute;
	}

	public BigDecimal getFlEngHourStart() {
		return flEngHourStart;
	}

	public void setFlEngHourStart(double flEngHourStart) {
		this.flEngHourStart = BigDecimal.valueOf(flEngHourStart);
	}

	public BigDecimal getFlEngHourEnd() {
		return flEngHourEnd;
	}

	public void setFlEngHourEnd(double flEngHourEnd) {
		this.flEngHourEnd = BigDecimal.valueOf(flEngHourEnd);
	}

	public BigDecimal getFlFuelQt() {
		return flFuelQt;
	}

	public void setFlFuelQt(double flFuelQt) {
		this.flFuelQt = BigDecimal.valueOf(flFuelQt);
	}

	public BigDecimal getFlOilQt() {
		return flOilQt;
	}

	public void setFlOilQt(double flOilQt) {
		this.flOilQt = BigDecimal.valueOf(flOilQt);
	}

	public BigDecimal getFlOtherExp() {
		return flOtherExp;
	}

	public void setFlOtherExp(double flOtherExp) {
		this.flOtherExp = BigDecimal.valueOf(flOtherExp);
	}

	public String getFlMaitenance() {
		return flMaitenance;
	}

	public void setFlMaitenance(String flMaitenance) {
		this.flMaitenance = flMaitenance;
	}

	public String getFlRemark() {
		return flRemark;
	}

	public void setFlRemark(String flRemark) {
		this.flRemark = flRemark;
	}

	
}
