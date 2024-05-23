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
	public Projets save(Projets p) {
		Connection connection = SConnection.getConnection();
        try {
            PreparedStatement preparedStatement = 
            		connection.prepareStatement(
            "INSERT INTO Projets (nom, description, dateDebut, dateFin, budget) VALUES (?, ?, ?, ?,?)");
            preparedStatement.setString(1, p.getNom());
            preparedStatement.setString(2, p.getDescription());
            preparedStatement.setDate(3, p.getDateDebut());
          	preparedStatement.setDate(4, p.getDateFin());
          	preparedStatement.setDouble(5, p.getBudget());
          	preparedStatement.executeUpdate();
          	
          	
          	PreparedStatement stmt2 = connection.prepareStatement("SELECT LAST_INSERT_ID() AS last_id");
            ResultSet rs = stmt2.executeQuery();
            if (rs.next()) {
                 p.setId(rs.getInt("last_id"));
            }
            stmt2.close();
            preparedStatement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return p;
	}

	@Override
	public Projets getProjets(int id) {
		Connection connection = SConnection.getConnection();
		Projets Projets = null;
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("select * from Projets WHERE id= ?");
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
            	int id_Projets = rs.getInt("id");
	            String nom = rs.getString("nom");
	            String description = rs.getString("description");
	            Date dateDebut = rs.getDate("dateDebut");
	            Date dateFin = rs.getDate("dateFin");
	            double budget = rs.getDouble("budget");
		    	Projets = new Projets(id_Projets,nom,description,dateDebut,dateFin,budget);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Projets;
	}

	@Override
	public Projets update(Projets p) {
		Connection connection = SConnection.getConnection();	       
		Projets updatedProjets = new Projets();
	        try {
	        	updatedProjets.setId(p.getId());
	        	updatedProjets.setNom(p.getNom());
	        	updatedProjets.setDescription(p.getDescription());
	        	updatedProjets.setDateDebut(p.getDateDebut());
	        	updatedProjets.setDateFin(p.getDateFin());
	        	updatedProjets.setBudget(p.getBudget());
	            
	            PreparedStatement ps = connection.prepareStatement(
	                "UPDATE Projets SET nom=?, description=?,dateDebut=?,dateFin=?,budget=? WHERE id=?"
	            );
	            ps.setString(1, p.getNom());
	            ps.setString(2, p.getDescription());
	            ps.setDate(3, services.DateCasting.ToSqlDate(p.getDateDebut()));
	            ps.setDate(4, services.DateCasting.ToSqlDate(p.getDateFin()));
	            ps.setDouble(5, p.getBudget());
	            ps.setInt(6, p.getId());
	            ps.executeUpdate();
	            ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return updatedProjets;
	}

	@Override
	public Projets deletProjets(int id) {
		Connection connection = SConnection.getConnection();

        try {
            PreparedStatement psDelete = connection.prepareStatement(
                    "DELETE FROM Projets WHERE id=?"
            );
            psDelete.setLong(1, id);
            int rowsDeleted = psDelete.executeUpdate();
            psDelete.close();

            PreparedStatement resetStmt = connection.prepareStatement("ALTER TABLE Projets AUTO_INCREMENT = 1");
            resetStmt.executeUpdate();
           
            if (rowsDeleted > 0) {
                PreparedStatement psUpdate = connection.prepareStatement(
                        "UPDATE Projets SET id = id - 1 WHERE id > ?"
                );
                psUpdate.setLong(1, id);
                psUpdate.executeUpdate();
                
                psUpdate.close();
                resetStmt.close();
            } else {
                System.out.println("Error Update");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
	
}
