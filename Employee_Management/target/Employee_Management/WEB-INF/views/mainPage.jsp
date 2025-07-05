<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #00f7ff;
            --primary-light: rgba(0, 247, 255, 0.7);
            --secondary: #02d1c1;
            --dark-blue: #0f2027;
            --mid-blue: #203a43;
            --light-blue: #2c5364;
            --text-light: #ffffff;
            --text-dark: #111827;
            --glass: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --glass-highlight: rgba(255, 255, 255, 0.2);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: var(--dark-blue);
            background: linear-gradient(135deg, var(--dark-blue), var(--mid-blue), var(--light-blue));
            font-family: 'Poppins', sans-serif;
            color: var(--text-light);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .container {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            font-size: 4.5rem;
            font-weight: 700;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 1rem;
            animation: fadeInDown 1s ease-out, textGlow 2s ease-in-out infinite alternate;
            opacity: 0;
            animation-fill-mode: forwards;
            text-align: center;
            width: 100%;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes textGlow {
            0% {
                text-shadow: 0 0 10px var(--primary-light), 0 0 20px rgba(0, 247, 255, 0.3);
            }
            100% {
                text-shadow: 0 0 20px var(--primary-light), 0 0 30px rgba(0, 247, 255, 0.5), 0 0 40px rgba(0, 247, 255, 0.2);
            }
        }

        .logo-container {
            position: relative;
            margin: 1rem auto;
            width: 180px;
            height: 180px;
            perspective: 1000px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-outer-ring {
            position: absolute;
            width: 100%;
            height: 100%;
            border: 3px solid var(--glass-border);
            border-radius: 50%;
            border-top-color: var(--primary);
            border-bottom-color: var(--secondary);
            animation: rotate 15s linear infinite;
            box-shadow: 0 0 20px rgba(0, 247, 255, 0.2);
        }

        .logo {
            width: 120px;
            height: 120px;
            background: url("https://cdn-icons-png.flaticon.com/512/2725/2725340.png") no-repeat center;
            background-size: contain;
            animation: float 4s ease-in-out infinite, pulse 3s ease-in-out infinite alternate;
            filter: drop-shadow(0 0 10px rgba(0, 247, 255, 0.5));
            z-index: 2;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotateY(0);
            }
            50% {
                transform: translateY(-20px) rotateY(10deg);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.05);
            }
        }

        @keyframes rotate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .glass-panel {
            background: var(--glass);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
            max-width: 900px;
            margin: 1rem auto;
            padding: 2rem;
        }

        .glass-panel::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                    to bottom right,
                    transparent,
                    transparent,
                    transparent,
                    var(--glass-highlight),
                    transparent,
                    transparent
            );
            transform: rotate(30deg);
            animation: shine 6s linear infinite;
        }

        @keyframes shine {
            0% {
                transform: translateX(-100%) rotate(30deg);
            }
            100% {
                transform: translateX(100%) rotate(30deg);
            }
        }

        h2 {
            font-size: 2rem;
            font-weight: 400;
            margin-bottom: 1rem;
            color: var(--text-light);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }

        .description {
            font-size: 1.2rem;
            margin: 1.5rem 0;
            line-height: 1.6;
            text-align: center;
        }

        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .action-card {
            position: relative;
            background: var(--glass);
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            overflow: hidden;
            border: 1px solid var(--glass-border);
            cursor: pointer;
            text-decoration: none;
            color: var(--text-light);
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .action-card h3 {
            margin: 1rem 0 0.5rem;
            font-size: 1.2rem;
            color: var(--primary);
        }

        .action-card p {
            font-size: 0.9rem;
            opacity: 0.8;
            margin-bottom: 1rem;
        }

        .action-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            color: var(--primary);
            transition: all 0.3s ease;
        }

        .action-card:hover .action-icon {
            transform: scale(1.1);
        }

        .action-hover {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, transparent, var(--glass-highlight), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .action-card:hover .action-hover {
            opacity: 1;
        }

        .quick-stats {
            margin-top: 3rem;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .stat-badge {
            background: var(--glass);
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            border: 1px solid var(--glass-border);
        }

        .stat-badge i {
            color: var(--primary);
        }

        .bg-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            animation: float-particle linear infinite;
            filter: blur(1px);
        }

        @keyframes float-particle {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
            }
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 3rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .glass-panel {
                padding: 1.5rem;
            }

            .action-grid {
                grid-template-columns: 1fr;
            }

            .logo-container {
                width: 140px;
                height: 140px;
            }

            .logo {
                width: 100px;
                height: 100px;
            }
        }
    </style>
</head>
<body>
<!-- Animated background elements -->
<div class="bg-elements" id="bgElements"></div>

<div class="container">
    <h1 class="animated fadeInDown">Employee Dashboard</h1>

    <div class="logo-container">
        <div class="logo-outer-ring"></div>
        <div class="logo"></div>
    </div>

    <div class="glass-panel">
        <h2 class="animated fadeIn"><i class="fas fa-tachometer-alt"></i> Management Console</h2>

        <div class="description animated fadeInUp">
            <p>Welcome to your employee management portal. Select an action below to manage your workforce:</p>
        </div>

        <div class="action-grid">
            <!-- Add Employee -->
            <a href="/Employee_Management/employee/addEmployeePage" class="action-card">
                <div class="action-icon" style="background: rgba(0, 247, 255, 0.1);">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h3>Add New Employee</h3>
                <p>Register a new team member into the system</p>
                <div class="action-hover"></div>
            </a>

            <!-- View All Employees -->
            <a href="/Employee_Management/employee/view/all" class="action-card">
                <div class="action-icon" style="background: rgba(46, 213, 115, 0.1);">
                    <i class="fas fa-users"></i>
                </div>
                <h3>Employee Directory</h3>
                <p>View complete list of all employees</p>
                <div class="action-hover"></div>
            </a>

            <!-- Update Employee -->
            <a href="/Employee_Management/employee/updateEmployeeDetails" class="action-card">
                <div class="action-icon" style="background: rgba(255, 165, 0, 0.1);">
                    <i class="fas fa-user-edit"></i>
                </div>
                <h3>Update Records</h3>
                <p>Modify existing employee information</p>
                <div class="action-hover"></div>
            </a>

            <!-- Delete Employee -->
            <a href="/Employee_Management/employee/deleteEmployeeDetails" class="action-card">
                <div class="action-icon" style="background: rgba(255, 71, 87, 0.1);">
                    <i class="fas fa-user-minus"></i>
                </div>
                <h3>Remove Employee</h3>
                <p>Delete an employee from the system</p>
                <div class="action-hover"></div>
            </a>

            <!-- View Employee by ID -->
            <a href="/Employee_Management/employee/viewEmployeeById" class="action-card">
                <div class="action-icon" style="background: rgba(135, 108, 255, 0.1);">
                    <i class="fas fa-search"></i>
                </div>
                <h3>Employee Lookup</h3>
                <p>Find specific employee by ID</p>
                <div class="action-hover"></div>
            </a>
        </div>

        <!-- Quick Stats -->
        <div class="quick-stats animated fadeIn">
            <div class="stat-badge">
                <i class="fas fa-users"></i>
                <span>${totalEmployees} Employees</span>
            </div>
            <div class="stat-badge">
                <i class="fas fa-birthday-cake"></i>
                <span>${birthdaysThisMonth} Birthdays</span>
            </div>
            <div class="stat-badge">
                <i class="fas fa-calendar-plus"></i>
                <span>${newHires} New Hires</span>
            </div>
        </div>
    </div>
</div>

<script>
    // Initialize background elements
    document.addEventListener('DOMContentLoaded', function() {
        const bgContainer = document.getElementById('bgElements');
        const particleCount = 30;

        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.classList.add('particle');

            const size = Math.random() * 5 + 1;
            const posX = Math.random() * window.innerWidth;
            const duration = Math.random() * 20 + 10;
            const delay = Math.random() * 5;

            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.left = `${posX}px`;
            particle.style.bottom = `-10px`;
            particle.style.animationDuration = `${duration}s`;
            particle.style.animationDelay = `${delay}s`;
            particle.style.opacity = Math.random() * 0.6 + 0.2;

            bgContainer.appendChild(particle);
        }
    });
</script>
</body>
</html>