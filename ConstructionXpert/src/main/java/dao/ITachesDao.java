package dao;

import metier.Taches;
import java.util.List;

public interface ITachesDao {
	public Taches ajouter(Taches tache);
	public Taches modifier(Taches tache);
	public Taches supprimer(int id);
	public Taches getTache(int id);
	public List<Taches> getTache(String status, int projectId);
    public List<Taches> getAllTaches();
    
}