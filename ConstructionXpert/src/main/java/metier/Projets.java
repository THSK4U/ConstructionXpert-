package metier;

import java.sql.Date;

public class Projets {

    private int id;
    private String nom;
    private String description;
    private Date dateDebut;
    private Date dateFin;
    private double budget;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}
	public Date getDateFin() {
		return dateFin;
	}
	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	public Projets(String nom, String description, Date dateDebut, Date dateFin, double budget) {
		super();
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.budget = budget;
	}
	public Projets(int id, String nom, String description, Date dateDebut, Date dateFin, double budget) {
		super();
		this.id = id;
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.budget = budget;
	}
	public Projets() {
		super();
	}
	
	@Override
	public String toString() {
		return "Projets [id=" + id + ", nom=" + nom + ", description=" + description + ", dateDebut=" + dateDebut
				+ ", dateFin=" + dateFin + ", budget=" + budget + "]";
	}
    
    
    
}
