package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.Projets;


public class ImpProjets implements InProjets{

	@Override
	public List<Projets> selectAllProjets() {
	    List<Projets> projetsList = new ArrayList<>();	    
	    try {
	    	Connection connection = SConnection.getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Projets");
	        ResultSet rs = preparedStatement.executeQuery();
	        
	        while (rs.next()) {
	            int id = rs.getInt("id");
	            String nom = rs.getString("nom");
	            String description = rs.getString("description");
	            Date dateDebut = rs.getDate("dateDebut");
	            Date dateFin = rs.getDate("dateFin");
	            double budget = rs.getDouble("budget");
	            
	            projetsList.add(new Projets(id, nom, description, dateDebut, dateFin, budget));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    
	    return projetsList;
	}

	
	@Override
	public Projets save(Projets M) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Projets getProjets(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Projets update(Projets p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Projets deletProjets(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
