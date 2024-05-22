<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projets" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Liste des Projets</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Description</th>
                <th>Date Debut</th>
                <th>Date Fin</th>
                <th>Budget</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Projets> projetsList = (List<Projets>) request.getAttribute("projetsList");
                if (projetsList != null) {
                    for (Projets projet : projetsList) {
            %>
            <tr>
                <td><%= projet.getId() %></td>
                <td><%= projet.getNom() %></td>
                <td><%= projet.getDescription() %></td>
                <td><%= projet.getDateDebut() %></td>
                <td><%= projet.getDateFin() %></td>
                <td><%= projet.getBudget() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">Aucun projet trouvé</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
