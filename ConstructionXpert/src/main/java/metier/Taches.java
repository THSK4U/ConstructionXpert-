package metier;

import java.util.Date;

public class Taches {
    private int id;
    private String description;
    private Date dateDebut;
    private Date dateFin;
    private String statut;
    private int idProjets;

    public Taches() {
    }

    public Taches(int id, String description, Date dateDebut, Date dateFin, String statut, int idProjets) {
        this.id = id;
        this.description = description;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.statut = statut;
        this.idProjets = idProjets;
    }

    public Taches(String description, Date dateDebut, Date dateFin, String statut, int idProjets) {
		super();
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.statut = statut;
		this.idProjets = idProjets;
	}

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

    public int getIdProjets() {
        return idProjets;
    }

    public void setIdProjets(int idProjets) {
        this.idProjets = idProjets;
    }
}