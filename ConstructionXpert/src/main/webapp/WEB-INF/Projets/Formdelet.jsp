<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projets" %>
<%@ page import="dao.ImpProjets" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Livre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
        
        .container {
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            font-weight: bold;
        }
        h1{
         font-weight: bold;
        
        }
         .cover{
    width: 70px;
  }
    </style>
</head>
<body>
    <div class="container">
        <h1>Supprimer Projet</h1>
        <p>Êtes-vous sûr de vouloir supprimer ce Projet?</p>
        <% String idParam = request.getParameter("id"); %>
    <% if (idParam != null && !idParam.isEmpty()) { %>
        <% int id = Integer.parseInt(idParam); %>
        <% ImpProjets dao = new ImpProjets(); %>
        <% Projets Projet = dao.getProjets(id); %>
        <% if (Projet != null) { %>
        <form action="deleteProject?id=<%= Projet.getId() %>" method="post">
      <div>
     <input type="hidden" name="id" value="<%= Projet.getNom() %>">
     <label>
   <%= Projet.getNom() %> - <%= Projet.getDescription() %> - <%= Projet.getDateDebut() %> - <%= Projet.getDateFin() %> - <%= Projet.getBudget() %> </label>
            </div>
      <button type="submit" class="btn btn-danger">Oui, Supprimer</button>
            <a href="/Constructionxpert/Projets" class="btn btn-secondary">Annuler</a>
            <% } else { %>
            <p>Aucun Livre.</p>
        <% } %>
    <% }  %>
       

        </form>
    </div>
</body>
</html>
