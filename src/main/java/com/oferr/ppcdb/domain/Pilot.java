package com.oferr.ppcdb.domain;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "Pilot")
@Table(name = "pilot")
public class Pilot {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "EMAIL", nullable = false, unique = true, length = 35)
	private String piEmail;

	@Column(name = "FIRST_NAME", length = 15)
	private String piFirstName;

	@Column(name = "LAST_NAME", length = 15)
	private String piLastName;

	@Column(name = "PHONE", length = 15)
	private String piPhone;

	@Column(name = "QUESTION", length = 40)
	private String piQuestion;

	@Column(name = "ANSWER", length = 15)
	private String piAnswer;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "ppPilotMang")
	@JsonIgnore
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	private List<Ppc> ppcs = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "flPilot")
	@JsonIgnore
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	private List<Flight> flights = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "ptPilot")
	@JsonIgnore
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	private List<Partner> partners = new ArrayList<>();

	@OneToOne(fetch=FetchType.EAGER)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "created" })
	@JoinColumn(name = "usPilot")
	User piUser;

//	Constractor  ---------------------------------------------------------------------------

	public Pilot() {
	}

	public Pilot(User user, String piEmail, String piFirstName, String piLastName, String piPhone, String piQuestion,
			String piAnswer) {
		super();
		this.setUser(user);
		this.setPiEmail(piEmail);
		this.setPiFirstName(piFirstName);
		this.setPiLastName(piLastName);
		this.setPiPhone(piPhone);
		this.setPiQuestion(piQuestion);
		this.setPiAnswer(piAnswer);
	}

	// Getter and setter

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPiEmail() {
		return piEmail;
	}

	public void setPiEmail(String piEmail) {
		this.piEmail = piEmail;
	}

	public String getPiFirstName() {
		return piFirstName;
	}

	public void setPiFirstName(String piFirstName) {
		this.piFirstName = piFirstName;
	}

	public String getPiLastName() {
		return piLastName;
	}

	public void setPiLastName(String piLastName) {
		this.piLastName = piLastName;
	}

	public String getPiPhone() {
		return piPhone;
	}

	public void setPiPhone(String piPhone) {
		this.piPhone = piPhone;
	}

	public String getPiQuestion() {
		return piQuestion;
	}

	public void setPiQuestion(String piQuestion) {
		this.piQuestion = piQuestion;
	}

	public String getPiAnswer() {
		return piAnswer;
	}

	public void setPiAnswer(String piAnswer) {
		this.piAnswer = piAnswer;
	}

	public List<Ppc> getPpcs() {
		return ppcs;
	}

	public void setPpcs(List<Ppc> ppcs) {
		this.ppcs = ppcs;
	}

	public List<Flight> getFlights() {
		return flights;
	}

	public void setFlights(List<Flight> flights) {
		this.flights = flights;
	}

	public List<Partner> getPartners() {
		return partners;
	}

	public void setPartners(List<Partner> partners) {
		this.partners = partners;
	}

	// PPC obj update from Pilot class
	public void addPpc(Ppc ppc) {
		ppcs.add(ppc);
		ppc.setPpPilotMang(this);
	}

	public void removePpc(Ppc ppc) {
		ppcs.remove(ppc);
		ppc.setPpPilotMang(null);
	}

	public User getUser() {
		return piUser;
	}

	public void setUser(User piUser) {
		this.piUser = piUser;
	}

	// Flight obj update from Pilot class
	public void addFlight(Flight flight) {
		flights.add(flight);
		flight.setFlPilot(this);
	}

	public void removeFlight(Flight flight) {
		flights.remove(flight);
		flight.setFlPilot(null);
	}

//  Partner obj update from Pilot class
	public void addPartner(Partner partner) {
		partners.add(partner);
		partner.setPtPilot(this);
	}

	public void removePartner(Partner partner) {
		partners.remove(partner);
		partner.setPtPilot(null);
	}

// 	get Full name
	public String getFullName() {
		String fn = this.getPiFirstName() + " " + this.getPiLastName();
		return fn;
	}

}
