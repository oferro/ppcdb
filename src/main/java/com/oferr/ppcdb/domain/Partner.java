package com.oferr.ppcdb.domain;

import java.time.LocalDate;

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

@Entity(name = "Partner")
@Table(name ="partner")
public class Partner {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Ppc.class)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "PT_PPC")
	private Ppc ptPpc; 
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Pilot.class)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "PT_PILOT")
	private Pilot ptPilot;
	
	@Column(name = "PT_DATE_IN")
	private LocalDate ptDateIn;

	@Column(name = "PT_DATE_OUT")
	private LocalDate ptDateOut;
	
	@Column(name = "PT_PERCENT", precision = 3, scale = 0)
	private int ptPercent;

	@Column(name = "PT_DEF_PPC")
	private boolean ptDefPpc;
	
	@Column(name = "PT_ACTIVE")
	private boolean ptActive;
	
//	Constractor  ---------------------------------------------------------------------------
	
	public Partner() {
		
	}

	public Partner(Ppc ptPpc, Pilot ptPilot, LocalDate ptDateIn, LocalDate ptDateOut, int ptPercent, boolean ptDefPpc,
			boolean ptActive) {
		super();
		this.ptPpc = ptPpc;
		this.ptPilot = ptPilot;
		this.ptDateIn = ptDateIn;
		this.ptDateOut = ptDateOut;
		this.ptPercent = ptPercent;
		this.ptDefPpc = ptDefPpc;
		this.ptActive = ptActive;
	}

//	Getter & Setter  -----------------------------------------------------------------------


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public Ppc getPtPpc() {
		return ptPpc;
	}

	public void setPtPpc(Ppc ptPpc) {
		this.ptPpc = ptPpc;
	}

	public Pilot getPtPilot() {
		return ptPilot;
	}

	public void setPtPilot(Pilot ptPilot) {
		this.ptPilot = ptPilot;
	}

	public LocalDate getPtDateIn() {
		return ptDateIn;
	}

	public void setPtDateIn(LocalDate ptDateIn) {
		this.ptDateIn = ptDateIn;
	}

	public void setPtDateIn(String ptDateIn) {
		this.ptDateIn = LocalDate.parse(ptDateIn);
	}

	public LocalDate getPtDateOut() {
		return ptDateOut;
	}

	public void setPtDateOut(LocalDate ptDateOut) {
		this.ptDateOut = ptDateOut;
	}

	public void setPtDateOut(String ptDateOut) {
		this.ptDateOut = LocalDate.parse(ptDateOut);
	}

	public int getPtPercent() {
		return ptPercent;
	}

	public void setPtPercent(int ptPercent) {
		this.ptPercent = ptPercent;
	}

	public boolean isPtDefPpc() {
		return ptDefPpc;
	}

	public void setPtDefPpc(boolean ptDefPpc) {
		this.ptDefPpc = ptDefPpc;
	}

	public boolean isPtActive() {
		return ptActive;
	}

	public void setPtActive(boolean ptActive) {
		this.ptActive = ptActive;
	}

	
	


}
