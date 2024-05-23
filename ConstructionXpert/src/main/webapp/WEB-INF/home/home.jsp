<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - ConstructionXpert</title>
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
        
        main{
            background-color: rgba(162, 162, 162, 0.792);

        }
        .content {
            display: flex;
            align-content: center;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
            height: 100vh;
            width: 60%;
            padding-left: 10%;
            align-items: center;
        }
        .lbnai{
            position: absolute;
            right: 0;    
            margin-right: 10%; 
            bottom: 0;  
            }
        .content h1 {
            font-size: 3rem;
            color: white;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: rgba(255, 118, 41, 0.70);
            color: white;
            font-size: 1.2rem;
            border: none;
            margin: 10px;
            padding: 15px 30px;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: rgba(255, 118, 41, 0.93);
        }
        .loading {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9;
            width: 100%;
            height: 100%;
            background-color: #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: opacity 0.6s, visibility 0.3s;
            animation: fadeOut 0s linear 5s forwards;
        }
        .loading.loaded {
            opacity: 0;
            visibility: hidden;
        }
        .scaleDown span {
            display: inline-block;
            animation: scaleDown 2s infinite;
            color: rgba(255, 118, 41);
        }
        @keyframes scaleDown {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            100% {
                transform: scale(0);
                opacity: 0;
            }
        }
        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
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
            .nav {
                flex-direction: row;
                gap: 10px;
                padding-top: 0;
            }
            .content {
                padding: 10px;
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
        }
    </style>
</head>
<body>

    <main>
     <img class="lbnai" src="https://dso2.raed.net:454/files/construction-jacket.png" style="width: 30%;">
       <!-- <img class="lbnai" src="https://www12.0zz0.com/2024/05/23/10/227414495.png" style="width: 30%;"> -->
    
        <div class="content">
            <h1>Welcome to ConstructionXpert</h1>
            <a href="Projets" class="btn btn-custom">Liste des projets</a>
            <a href="page2.jsp" class="btn btn-custom">Liste des Taches</a>
            <a href="page3.jsp" class="btn btn-custom">Liste des res</a>
        </div>
    </main>

    <div class="loading">
        <p class="scaleDown">
            <span style="animation-delay:0s">B</span>
            <span style="animation-delay:50ms">Y</span>
            <span style="animation-delay:.1s">:</span>
            <span style="animation-delay:.15000000000000002s">T</span>
            <span style="animation-delay:.2s">A</span>
            <span style="animation-delay:.25s">H</span>
            <span style="animation-delay:.30000000000000004s">A</span>
            <span style="animation-delay:.35000000000000003s"></span>
            <span style="animation-delay:.4s">S</span>
            <span style="animation-delay:.45s">E</span>
            <span style="animation-delay:.5s">L</span>
            <span style="animation-delay:.55s">L</span>
            <span style="animation-delay:.6000000000000001s">A</span>
            <span style="animation-delay:.65s">K</span>
        </p>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(function() {
                document.querySelector('.loading').classList.add('loaded');
            }, 2000);
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
