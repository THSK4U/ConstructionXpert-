package metier;

public class Ressources {

    private int id;
    private String nom;
    private String type;
    private int quantite;
    private String fournisseur;
    private int idTache;
    
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public String getFournisseur() {
		return fournisseur;
	}
	public void setFournisseur(String fournisseur) {
		this.fournisseur = fournisseur;
	}
	public int getIdTache() {
		return idTache;
	}
	public void setIdTache(int idTache) {
		this.idTache = idTache;
	}
	public Ressources(String nom, String type, int quantite, String fournisseur, int idTache) {
		super();
		this.nom = nom;
		this.type = type;
		this.quantite = quantite;
		this.fournisseur = fournisseur;
		this.idTache = idTache;
	}
	public Ressources(int id, String nom, String type, int quantite, String fournisseur, int idTache) {
		super();
		this.id = id;
		this.nom = nom;
		this.type = type;
		this.quantite = quantite;
		this.fournisseur = fournisseur;
		this.idTache = idTache;
	}

	public Ressources() {
		super();
	}
	@Override
	public String toString() {
		return "Ressources [id=" + id + ", nom=" + nom + ", type=" + type + ", quantite=" + quantite + ", fournisseur="
				+ fournisseur + ", idTache=" + idTache + "]";
	}

   
    
    
}
