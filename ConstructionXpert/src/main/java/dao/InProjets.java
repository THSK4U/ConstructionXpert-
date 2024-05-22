package dao;

import java.util.List;

import metier.Projets;

public interface InProjets {
	public Projets save(Projets M);
	public Projets getProjets(int id);
	public Projets update(Projets p);
	public Projets  deletProjets(int id);
	public 	List<Projets> selectAllProjets();
}
