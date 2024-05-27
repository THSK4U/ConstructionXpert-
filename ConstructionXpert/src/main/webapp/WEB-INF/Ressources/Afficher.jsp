<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="metier.Ressources" %>
<%@ page import="dao.ImTaches" %>
<%@ page import="dao.ImRessource" %>
<%@ page import="metier.Taches" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ressource</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@800&family=Lexend:wght@100..900&family=Poetsen+One&family=Rubik:ital,wght@0,300..900;1,300..900&display=swap');
        * {
            margin: 0;
            padding: 0;
            font-family: "Lexend", sans-serif;
        }
        body {
            display: flex;
        }
        main {
            margin-left: 80px;
            width: calc(100% - 80px);
            overflow: auto;
        }
        .sidebar {
            position: fixed;
            bottom: 0;
            width: 80px;
            height: 100%;
            background-color: #000000;
            overflow-y: auto;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .nav {
            display: flex;
            flex-direction: column;
            gap: 30px;
            padding-top: 20px;
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
        .head {
            position: fixed;
            width: 100%;
            border-bottom: 0.15rem solid rgba(0, 0, 0, 0.1);
        }
        .navtop {
            display: flex;
            align-items: center;
            height: 72.4px;
        }
        .navtop p {
            font-size: 2rem;
            font-weight: 700;
            margin-left: 50px;
        }
        p {
            margin-bottom: 0;
        }
        .content {
            padding: 20px;
            padding-top: 120px;
            padding-left: 40px;
        }
        table {
            width: 100%;
            overflow-y: auto;
        }
        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            font-size: 0.90rem;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        textarea {
            overflow: hidden;
            border: none;
            outline: none;
            resize: auto;
            font-size: 0.80rem;
            font-family: "Lexend", sans-serif;
            background-color: #fff;
            width: auto;
            height: 20px;
            horizontal-align: left;
            text-align: left;
        }
        .description {
        }
        tr:hover textarea {
            background-color: #f1f1f1;
        }
        .btn {
            border: 1px solid #ddd;
        }
        .button {
            background-color: rgba(255, 118, 41, 0.70);
        }
        .btnPosition {
            position: relative;
            left: -85px;
            border-radius: 10px;
            transition: left 0.3s ease;
            border: none;
        }
        .button:hover {
            background-color: rgba(255, 118, 41, 0.93);
        }

        @media (max-width: 768px) {
            main {
                margin-left: 0;
                width: 100%;
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
            th, td {
                font-size: 0.70rem;
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
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="Projets">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(1).svg" alt="Projets">
                </a>
            </li>
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="taches">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Spotted%20Patterns.svg" alt="Tâches">
                </a>
            </li>
            <li class="nav-item active">
                <div class="box"></div>
                <a class="nav-link" href="Ressources">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(2).svg" alt="Ressources">
                </a>
            </li>
        </ul>
    </div>

    <main>
        <div class="head">
            <div class="navtop">
                <p>Ressources</p>
                <button type="button" class="btn btnPosition ml-auto mr-4" data-toggle="modal" data-target="#addRessourcesModal">
                    Ajouter Ressource
                </button>
            </div>
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Type</th>
                        <th>Quantité</th>
                        <th>Fournisseur</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="Ressources" items="${RessourcesList}">
                    <tr>
                        <td>${Ressources.id}</td>
                        <td>${Ressources.nom}</td>
                        <td>${Ressources.type}</td>
                        <td>${Ressources.quantite}</td>
                        <td>${Ressources.fournisseur}</td>
                        <td>
                            <a href="modifierProject?id=${Ressources.id}" style="width: 6rem;" class="bg-success badge text-wrap text-white">Edit</a>
                            <a href="confirmationProject?id=${Ressources.id}" style="width: 6rem;" class="bg-danger badge text-wrap text-white">Delete</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
 <%
            String idParam = request.getParameter("id"); 
                int RId = Integer.parseInt(idParam);
        %>
    <!-- Modal Add -->
    <div class="modal fade" id="addRessourcesModal" tabindex="-1" aria-labelledby="addRessourcesModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="addRessources" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addRessourcesModalLabel">Ajouter Ressources</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                       	<input type="hidden" class="form-control" id="id" name="id" >
                            <label for="projectName">Nom</label>
                            <input type="text" class="form-control" id="projectName" name="nom" required>
                        </div>
                        <div class="form-group">
                            <label for="projectType">Type</label>
                            <input type="text" class="form-control" id="projectType" name="type" required>
                        </div>
                        <div class="form-group">
                            <label for="projectQuantite">Quantité</label>
                            <input type="number" class="form-control" id="projectQuantite" name="quantite" required>
                        </div>
                        <div class="form-group">
                            <label for="projectFournisseur">Fournisseur</label>
                            <input type="text" class="form-control" id="projectFournisseur" name="fournisseur" required>
                        </div>
                        <div class="form-group">
                            <input type="hidden" class="form-control" id="projectIdTache" name="idTache" value="<%= RId %>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="submit" class="btn button btn-primary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
