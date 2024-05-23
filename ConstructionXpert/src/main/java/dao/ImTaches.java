package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.Projets;
import metier.Taches;

public class ImTaches implements ITachesDao {
    private Connection connexion;

    public ImTaches(Connection connexion) {
        this.connexion = connexion;
    }

    @Override
    public Taches ajouter(Taches tache) {
        try {
            String query = "INSERT INTO Taches (description, date_debut, date_fin, status, id_projet) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connexion.prepareStatement(query);
            statement.setString(1, tache.getDescription());
            statement.setDate(2, new java.sql.Date(tache.getDateDebut().getTime()));
            statement.setDate(3, new java.sql.Date(tache.getDateFin().getTime()));
            statement.setString(4, tache.getStatut());
            statement.setInt(5, tache.getIdProjets());
            statement.executeUpdate();
            
            PreparedStatement stmt2 = connexion.prepareStatement("SELECT LAST_INSERT_ID() AS last_id");
            ResultSet rs = stmt2.executeQuery();
            if (rs.next()) {
                 tache.setId(rs.getInt("last_id"));
            }
            stmt2.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public Taches modifier(Taches tache) {
		Taches updated = new Taches();

        try {
        	updated.setId(tache.getId());
        	updated.setDescription(tache.getDescription());
        	updated.setDateDebut(tache.getDateDebut());
        	updated.setDateFin(tache.getDateFin());
        	updated.setStatut(tache.getStatut());
        	updated.setIdProjets(tache.getIdProjets());

        	
            
            PreparedStatement statement = connexion.prepareStatement("UPDATE Taches SET description = ?, date_debut = ?, date_fin = ?, status = ? WHERE id_tache = ?");
            statement.setString(1, tache.getDescription());
            statement.setDate(2, services.DateCasting.ToSqlDate(tache.getDateDebut()));
            statement.setDate(3, services.DateCasting.ToSqlDate(tache.getDateFin()));
            statement.setString(4, tache.getStatut());
            statement.setInt(5, tache.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    @Override
    public Taches supprimer(int id) {
        try {
            PreparedStatement statement = connexion.prepareStatement("DELETE FROM Taches WHERE id_tache = ?");
            statement.setInt(1, id);
            int rowsDeleted = statement.executeUpdate();
            statement.close();

            PreparedStatement resetStmt = connexion.prepareStatement("ALTER TABLE Projets AUTO_INCREMENT = 1");
            resetStmt.executeUpdate();
           
            if (rowsDeleted > 0) {
                PreparedStatement psUpdate = connexion.prepareStatement(
                        "UPDATE Projets SET id = id - 1 WHERE id_tache > ?"
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

    @Override
    public Taches getTache(int id) {
        Taches tache = null;
        try {
            PreparedStatement statement = connexion.prepareStatement("SELECT * FROM Taches WHERE id_tache = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                tache = new Taches();
                tache.setId(resultSet.getInt("id_tache"));
                tache.setDescription(resultSet.getString("description"));
                tache.setDateDebut(resultSet.getDate("dateDebut"));
                tache.setDateFin(resultSet.getDate("dateFin"));
                tache.setStatut(resultSet.getString("statut"));
                tache.setIdProjets(resultSet.getInt("ID_Projets"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public List<Taches> getAllTaches() {
        List<Taches> taches = new ArrayList<>();
        try {
	    	Connection connection = SConnection.getConnection();
	    	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Taches");
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
            	 int id = rs.getInt("id_tache");
 	            String description = rs.getString("description");
 	            Date dateDebut = rs.getDate("date_fin");
 	            Date dateFin = rs.getDate("date_debut");
 	            String status = rs.getString("status");
 	            int id_projet = rs.getInt("id_projet");
 	           taches.add(new Taches(id, description, dateDebut, dateFin, status, id_projet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return taches;
    }
}