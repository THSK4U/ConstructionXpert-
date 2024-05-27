package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.Ressources;

public class ImRessource implements InRessource {

	@Override
	public Ressources save(Ressources R) {
        try {
    		Connection connection = SConnection.getConnection();
            PreparedStatement updatedRessources = 
            		connection.prepareStatement(
            "INSERT INTO Ressource (nom, type, quantite, fournisseur, id_tache) VALUES (?,?,?,?,?)");
        	updatedRessources.setString(1 ,R.getNom());
        	updatedRessources.setString(2 ,R.getType());
        	updatedRessources.setInt(3 ,R.getQuantite());
        	updatedRessources.setString(4 ,R.getFournisseur());
        	updatedRessources.setInt(5 ,R.getIdTache());
        	updatedRessources.executeUpdate();

          	
          	PreparedStatement stmt2 = connection.prepareStatement("SELECT LAST_INSERT_ID() AS last_id");
            ResultSet rs = stmt2.executeQuery();
            if (rs.next()) {
                 R.setId(rs.getInt("last_id"));
            }
            stmt2.close();
            updatedRessources.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return R;
	}


	@Override
	public Ressources getRessource(int id) {
		Connection connection = SConnection.getConnection();
		Ressources Ressources = null;
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement("select * from Ressource WHERE id= ?");
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
            	int idR = rs.getInt("id");
	            String nom = rs.getString("nom");
	            String type = rs.getString("type");
	            int quantite = rs.getInt("quantite");
	            String fournisseur = rs.getString("fournisseur");
	            int id_tache = rs.getInt("id_tache");
	            Ressources = new Ressources(idR, nom, type, quantite, fournisseur, id_tache);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Ressources;
	}

	@Override
	public Ressources update(Ressources p) {
		Connection connection = SConnection.getConnection();	       
		Ressources updatedRessources = new Ressources();
	        try {
	        	updatedRessources.setId(p.getId());
	        	updatedRessources.setNom(p.getNom());
	        	updatedRessources.setType(p.getType());
	        	updatedRessources.setQuantite(p.getQuantite());
	        	updatedRessources.setFournisseur(p.getFournisseur());
	        	updatedRessources.setIdTache(p.getIdTache());
	            
	            PreparedStatement ps = connection.prepareStatement(
	                "UPDATE Ressource SET nom=?, type=?,quantite=?,fournisseur=?,id_tache=? WHERE id=?"
	            );
	            ps.setString(1, p.getNom());
	            ps.setString(2, p.getType());
	            ps.setInt(3, p.getQuantite());
	            ps.setString(4, p.getFournisseur());
	            ps.setInt(5, p.getIdTache());
	            ps.setInt(6, p.getId());
	            ps.executeUpdate();
	            ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return updatedRessources;
	}

	@Override
	public Ressources deleteRessource(int id) {
		Connection connection = SConnection.getConnection();

        try {
            PreparedStatement psDelete = connection.prepareStatement(
                    "DELETE FROM Ressource WHERE id=?"
            );
            psDelete.setLong(1, id);
            int rowsDeleted = psDelete.executeUpdate();
            psDelete.close();

            PreparedStatement resetStmt = connection.prepareStatement("ALTER TABLE Ressource AUTO_INCREMENT = 1");
            resetStmt.executeUpdate();
           
            if (rowsDeleted > 0) {
                PreparedStatement psUpdate = connection.prepareStatement(
                        "UPDATE Ressource SET id = id - 1 WHERE id > ?"
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
	

	@Override
	public List<Ressources> selectAllRessources(int TachetId) {
		List<Ressources> RessourcesList = new ArrayList<>();	    
	    try {
	    	Connection connection = SConnection.getConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Ressource WHERE id_tache = ?");
	        preparedStatement.setInt(1, TachetId);
	        ResultSet rs = preparedStatement.executeQuery();
	        
	        while (rs.next()) {
	            int id = rs.getInt("ID");
	            String nom = rs.getString("nom");
	            String type = rs.getString("type");
	            int quantite = rs.getInt("quantite");
	            String fournisseur = rs.getString("fournisseur");
	            int id_tache = rs.getInt("id_tache");
	            
	            RessourcesList.add(new Ressources(id, nom, type, quantite, fournisseur, id_tache));
	            System.out.println(RessourcesList);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    
	    return RessourcesList;
	}
}
