package metier;

import java.sql.Date;
import java.util.List;

public class Taches {

    private int id;
    private String description;
    private Date dateDebut;
    private Date dateFin;
    private String statut;
    private List<Ressources> ressources;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	public List<Ressources> getRessources() {
		return ressources;
	}
	public void setRessources(List<Ressources> ressources) {
		this.ressources = ressources;
	}
	public Taches(int id, String description, Date dateDebut, Date dateFin, String statut,
			List<Ressources> ressources) {
		super();
		this.id = id;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.statut = statut;
		this.ressources = ressources;
	}
	public Taches(String description, Date dateDebut, Date dateFin, String statut, List<Ressources> ressources) {
		super();
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.statut = statut;
		this.ressources = ressources;
	}
	public Taches() {
		super();
	}
	@Override
	public String toString() {
		return "Taches [id=" + id + ", description=" + description + ", dateDebut=" + dateDebut + ", dateFin=" + dateFin
				+ ", statut=" + statut + ", ressources=" + ressources + "]";
	}
    
    
}
