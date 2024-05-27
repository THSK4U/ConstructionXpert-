<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="metier.Taches" %>
<%@ page import="dao.ImTaches" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tâches</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@800&family=Lexend:wght@100..900&display=swap');
        * {
            margin: 0;
            padding: 0;
            font-family: "Lexend", sans-serif;
        }
        body {
            background-color: #f8f8f8;
        }
        main {
            margin-left: 80px;
            padding: 20px;
        }
        .sidebar {
            position: fixed;
            left: 0;
            width: 80px;
            height: 100%;
            background-color: #000;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .nav {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }
        .nav-item {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box {
            position: absolute;
            background-color: rgba(255, 118, 41, 0.93);
            height: 50px;
            width: 50px;
            border-radius: 10px;
            z-index: -1;
            left: -80px;
            transition: left 0.3s ease;
        }
        .nav-item.active .box {
            left: 5px;
        }
        .nav-item:hover .box {
            left: -50px;
        }
        .nav-link img {
            width: 30px;
            height: 24px;
        }
        .navtop {
            display: flex;
            align-items: center;
            height: 90px;
            padding-left: 20px;
            border-bottom: 2px solid rgba(0, 0, 0, 0.1);
        }
        .navtop p {
            font-size: 2rem;
            font-weight: 700;
        }
        .content {
            margin-top: 20px;
        }
        .form-group label {
            font-weight: bold;
            color: #000;
        }
        .btn {
            background-color: rgba(255, 118, 41, 0.70);	
            border: none;
            color: white;
            transition: background-color 0.3s;
            
        }
        .btn:hover {
            background-color: rgba(255, 118, 41, 0.93);
        }
        .btn-secondary {
            background-color: #6c757d;
        }
         @media (max-width: 768px) {
            main {
                margin-left: 0;
                width: 100%;
                height: 0;
                left: 0;
            }
            .sidebar {
                width: 100%;
                height: 60px;
                bottom: 0;
                overflow: hidden;
            }
            .navtop {
                padding-top: 19px;
                display: flex;
                align-items: center;
                height: 60px;
            }
            .nav {
                flex-direction: row;
                gap: 10px;
                padding-top: 0;
            }
            .content {
                padding: 10px;
                padding-top: 70px;
            }
            .box {
                left: 5px;
                top: 60px;
            }
            .nav-item.active .box {
                left: 5px;
                top: -3px;
            }
            .nav-item:hover .box {
                left: 0;
            }
            .kanban-column {
            min-width: 250px;
        }
        .btnPosition {
  			left: 0;
			}
		
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <ul class="nav">
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="home">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector.svg" alt="Home">
                </a>
            </li>
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="Projets">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(1).svg" alt="Projets">
                </a>
            </li>
            <li class="nav-item active">
                <div class="box"></div>
                <a class="nav-link" href="taches">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Spotted%20Patterns.svg" alt="Tâches">
                </a>
            </li>
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(2).svg" alt="Ressources">
                </a>
            </li>
        </ul>
    </div>

    <main>
        <div class="navtop">
            <p>Tâches</p>
        </div>

         <div class="content">
            <% String idParam = request.getParameter("id"); %>
                <% int id = Integer.parseInt(idParam); %>
                <% ImTaches dao = new ImTaches(); %>
                <% Taches tache = dao.getTache(id); %>
                    <form action="modifierTache" method="post">
                        <input type="hidden" name="id" value="<%= tache.getId() %>">
                        <div class="form-group">
                            <label>Description :</label>
                            <input type="text" class="form-control" name="description" value="<%= tache.getDescription() %>">
                        </div>
                        <div class="form-group">
                            <label for="startDate">Date de début</label>
                            <input type="date" class="form-control" name="dateDebut" value="<%= tache.getDateDebut() %>">
                        </div>
                        <div class="form-group">
                            <label for="endDate">Date de fin</label>
                            <input type="date" class="form-control" id="endDate" name="dateFin" value="<%= tache.getDateFin() %>">
                        </div>
                        <div class="form-group">
                            <label>Statut :</label>
                            <select class="form-control" name="statut">
                                <option value="À faire" <%= "À faire".equals(tache.getStatut()) ? "selected" : "" %>>À faire</option>
                                <option value="En cours" <%= "En cours".equals(tache.getStatut()) ? "selected" : "" %>>En cours</option>
                                <option value="Terminer" <%= "Terminer".equals(tache.getStatut()) ? "selected" : "" %>>Terminer</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="idProjets" value="<%= tache.getIdProjets() %>">
                        </div>
                        <button type="submit" class="btn">Oui, Edit</button>
                        <a href="/Constructionxpert/taches" class="btn btn-secondary">Annuler</a>
                    </form>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
