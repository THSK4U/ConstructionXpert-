package dao;

	import java.sql.Date;
	import java.util.List;

import metier.Projets;
	
public class Test {

	    public static void main(String[] args) {
	    	
	    	ImpProjets projetsDAO = new ImpProjets();
	        List<Projets> projetsList = projetsDAO.selectAllProjets();
	        

	        		
	        for (Projets projet : projetsList) {
	            System.out.println("ID: " + projet.getId());
	            System.out.println("Nom: " + projet.getNom());
	            System.out.println("Description: " + projet.getDescription());
	            System.out.println("Date Debut: " + projet.getDateDebut());
	            System.out.println("Date Fin: " + projet.getDateFin());
	            System.out.println("Budget: " + projet.getBudget());
	            System.out.println("----------------------------");
	        }
	    }
	}

