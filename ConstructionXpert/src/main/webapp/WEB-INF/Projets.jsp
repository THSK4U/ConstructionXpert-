<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRojets Dashboard</title>
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
            height: 90px;
        }
        .navtop p {
            font-size: 2rem;
            font-weight: 700;
            margin-left: 50px;
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
            font-size: 0.80rem;
        }
        tr:hover{
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
            
        }
        tr:hover textarea {
            background-color: #f1f1f1;
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
            .textarea{
                
            font-size: 0.80rem;
            font-family: "Lexend", sans-serif;
            background-color: #fff;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <ul class="nav">
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="#">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector.svg" alt="Home">
                </a>
            </li>
            <li class="nav-item active">
                <div class="box"></div>
                <a class="nav-link" href="#">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(1).svg" alt="Projets">
                </a>
            </li>
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="/Taches.html">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Spotted%20Patterns.svg" alt="Tâches">
                </a>
            </li>
            <li class="nav-item">
                <div class="box"></div>
                <a class="nav-link" href="#">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(2).svg" alt="Ressources">
                </a>
            </li>
        </ul>
    </div>

    <main>
        <div class="head">
            <div class="navtop">
                <p>Projets</p>
            </div>
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Description</th>
                        <th>Date de début</th>
                        <th>Date de fin</th>
                        <th>Budget</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                 <c:forEach var="projet" items="${projetsList}">
                    <tr>
                        <td>${projet.id}</td>
                        <td>${projet.nom}</td>
                        <td>
                    <textarea rows="4" cols="40" disabled >
                    ${projet.description}
                    </textarea>
                
                        </td>
                        <td>${projet.dateDebut}</td>
                        <td>${projet.dateFin}</td>
                        <td>${projet.budget}</td>
                        <td>
                            <a href="#" style="width: 6rem;" class="bg-success badge text-wrap text-white">Edit</a>
                        <a href="#" style="width: 6rem;" class="bg-danger badge text-wrap text-white">Delete</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
        