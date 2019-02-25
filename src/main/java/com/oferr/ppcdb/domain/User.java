package com.oferr.ppcdb.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "\"user\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name="username")
    private String username;
    
    @Column(name="password")
    private String password;
    
    @Column(name="password_confirm")
    private String passwordConfirm;

    @Column(name="roles")
    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
   
    @OneToOne (mappedBy = "piUser", cascade = CascadeType.ALL)
	@JsonIgnoreProperties({ "hibernateEgarInitializer", "handler", "created" })
    private Pilot usPilot;

//	Constractor  ---------------------------------------------------------------------------
    
    public User() {
    	
    }
    
    public User(String username, String password, String passwordConfirm, Set<Role> roles, Pilot usPilot) {
		super();
		this.username = username;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.roles = roles;
		this.usPilot = usPilot;
	}

//	Getter & Setter  -----------------------------------------------------------------------
    
    
    public Long getId() {
        return id;
    }

	public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
	public Pilot getUsPilot() {
		return usPilot;
	}

	public void setUsPilot(Pilot usPilot) {
		this.usPilot = usPilot;
	}
    
    
}