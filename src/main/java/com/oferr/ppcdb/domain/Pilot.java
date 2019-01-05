package com.oferr.ppcdb.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "Pilot")
@Table(name = "pilot")
public class Pilot {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "EMAIL", nullable = false, unique = true, length = 20)
	private String piEmail;

	@Column(name = "PASSWORD", nullable = false)
	private String piPw;

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
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "created"})
	private List<Ppc> ppcs = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "flPilot")
	@JsonIgnore
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "created"})
	private List<Flight> flights = new ArrayList<>();

	
	public Pilot() {
	}

	public Pilot(String piEmail, String piPw, String piFirstName, String piLastName, String piPhone, String piQuestion,
			String piAnswer) {
		super();
		this.setPiEmail(piEmail);
		this.setPiPw(piPw);
		this.setPiFirstName(piFirstName);
		this.setPiLastName(piLastName);
		this.setPiPhone(piPhone);
		this.setPiQuestion(piQuestion);
		this.setPiAnswer(piAnswer);
	}

	//Getter and setter
	
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

	public String getPiPw() {
		return piPw;
	}

	public void setPiPw(String piPw) {
		this.piPw = piPw;
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

//	 PPC obj udtade from Pilot class
	public void addPpc(Ppc ppc) {
        ppcs.add(ppc);
        ppc.setPpPilotMang(this);
    }
 
    public void removePpc(Ppc ppc) {
        ppcs.remove(ppc);
        ppc.setPpPilotMang(null);
    }

//   Flight obj udtade from Pilot class
	public void addFlight(Flight flight) {
        flights.add(flight);
        flight.setFlPilot(this);
    }
 
    public void removeFlight(Flight flight) {
        flights.remove(flight);
        flight.setFlPilot(null);
    }

}
