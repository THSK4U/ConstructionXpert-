package dao;

import java.util.List;

import metier.Ressources;

public interface InRessource {
	public Ressources save(Ressources M);
	public Ressources getRessource(int id);
	public Ressources update(Ressources p);
	public Ressources  deleteRessource(int id);
	public 	List<Ressources> selectAllRessources(int projectId);
}
