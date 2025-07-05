<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Employee Management System</title>
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
            text-align: center;
            min-height: 100vh;
            overflow-x: hidden;
        }

        .container {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
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
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50%;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--primary), transparent);
            border-radius: 50%;
            filter: blur(1px);
            animation: linePulse 3s ease-in-out infinite;
        }

        h2 {
            font-size: 2rem;
            font-weight: 400;
            margin-bottom: 2rem;
            color: var(--text-light);
            opacity: 0;
            animation: fadeIn 1s ease-out 0.5s forwards;
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

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
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

        @keyframes linePulse {
            0%, 100% {
                width: 50%;
                opacity: 0.8;
            }
            50% {
                width: 70%;
                opacity: 1;
            }
        }

        .logo-container {
            position: relative;
            margin: 2rem auto;
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
            transform-style: preserve-3d;
            opacity: 0;
            animation: fadeIn 1s ease-out 0.8s forwards, float 4s ease-in-out infinite 1s, pulse 3s ease-in-out infinite alternate 1s;
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

        .description {
            font-size: 1.2rem;
            margin: 2rem auto;
            padding: 1.5rem;
            line-height: 1.6;
            max-width: 800px;
            opacity: 0;
            animation: fadeInUp 1s ease-out 1s forwards;
            background: var(--glass);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }

        .description::before {
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

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .button {
            margin-top: 3rem;
            opacity: 0;
            animation: fadeIn 1s ease-out 1.2s forwards;
            position: relative;
        }

        .start-btn {
            position: relative;
            padding: 1.2rem 3rem;
            font-size: 1.2rem;
            border: none;
            border-radius: 50px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--text-dark);
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(0, 247, 255, 0.4);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            overflow: hidden;
            z-index: 1;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }

        .start-btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 25px rgba(2, 209, 193, 0.6);
        }

        .start-btn:active {
            transform: translateY(2px) scale(0.98);
        }

        .start-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: 0.5s;
            z-index: -1;
        }

        .start-btn:hover::before {
            left: 100%;
        }

        .start-btn i {
            transition: transform 0.3s ease;
        }

        .start-btn:hover i {
            transform: translateX(5px);
        }

        /* Animated background elements */
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

        .shape {
            position: absolute;
            opacity: 0.1;
            animation: float-shape linear infinite;
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

        @keyframes float-shape {
            0% {
                transform: translate(0, 0) rotate(0deg);
            }
            50% {
                transform: translate(50px, 50px) rotate(180deg);
            }
            100% {
                transform: translate(0, 0) rotate(360deg);
            }
        }

        /* Tech stack carousel */
        .tech-stack {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin: 2rem 0;
            flex-wrap: wrap;
            opacity: 0;
            animation: fadeIn 1s ease-out 1.3s forwards;
            perspective: 1000px;
        }

        .tech-badge {
            background: var(--glass);
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            backdrop-filter: blur(5px);
            border: 1px solid var(--glass-border);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            cursor: default;
            transform-style: preserve-3d;
        }

        .tech-badge:hover {
            transform: translateY(-5px) rotateX(10deg);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .tech-badge i {
            color: var(--primary);
            font-size: 1.2rem;
            transition: transform 0.3s ease;
        }

        .tech-badge:hover i {
            transform: scale(1.2);
        }

        /* Developer credit styling */
        .developer {
            margin-top: 3rem;
            font-size: 1rem;
            opacity: 0;
            animation: fadeIn 1s ease-out 1.5s forwards;
            position: relative;
        }

        .developer strong {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-weight: 600;
            position: relative;
        }

        .developer strong::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        .developer:hover strong::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            h1 {
                font-size: 3rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .description {
                padding: 1rem;
                font-size: 1rem;
            }

            .logo-container {
                width: 140px;
                height: 140px;
            }

            .logo {
                width: 100px;
                height: 100px;
            }

            .start-btn {
                padding: 1rem 2rem;
                font-size: 1rem;
            }

            .tech-badge {
                padding: 0.6rem 1rem;
                font-size: 0.9rem;
            }
        }

        /* Interactive cursor effects */
        .cursor-effect {
            position: fixed;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--primary-light);
            pointer-events: none;
            transform: translate(-50%, -50%);
            mix-blend-mode: screen;
            z-index: 9999;
            transition: transform 0.1s ease;
        }

        .cursor-follower {
            position: fixed;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid var(--primary-light);
            pointer-events: none;
            transform: translate(-50%, -50%);
            z-index: 9998;
            transition: all 0.3s ease;
            transition-property: width, height, border;
        }
    </style>
</head>
<body>
<!-- Animated background elements -->
<div class="bg-elements" id="bgElements"></div>

<!-- Custom cursor effects -->
<div class="cursor-effect" id="cursor"></div>
<div class="cursor-follower" id="cursorFollower"></div>

<div class="container">
    <h1>Welcome</h1>
    <h2>Employee Management System</h2>

    <div class="logo-container">
        <div class="logo-outer-ring"></div>
        <div class="logo"></div>
    </div>

    <div class="tech-stack">
        <div class="tech-badge">
            <i class="fas fa-leaf"></i> Spring Framework
        </div>
        <div class="tech-badge">
            <i class="fas fa-database"></i> Hibernate
        </div>
        <div class="tech-badge">
            <i class="fas fa-code"></i> CRUD Operations
        </div>
        <div class="tech-badge">
            <i class="fab fa-java"></i> JSP
        </div>
        <div class="tech-badge">
            <i class="fas fa-mobile-alt"></i> Responsive
        </div>
    </div>

    <div class="description">
        <p>A cutting-edge solution for modern workforce management. This system provides:</p>
        <ul style="text-align: left; margin-top: 1rem; list-style-type: none;">
            <li><i class="fas fa-check-circle" style="color: var(--primary); margin-right: 0.5rem;"></i> Real-time employee data management</li>
            <li><i class="fas fa-check-circle" style="color: var(--primary); margin-right: 0.5rem;"></i> Intuitive dashboard with analytics</li>
            <li><i class="fas fa-check-circle" style="color: var(--primary); margin-right: 0.5rem;"></i> Secure role-based access control</li>
            <li><i class="fas fa-check-circle" style="color: var(--primary); margin-right: 0.5rem;"></i> Seamless integration capabilities</li>
        </ul>
    </div>

    <div class="button">
        <a href="/Employee_Management/employee/mainpage" class="start-link">
            <button class="start-btn">
                <i class="fas fa-rocket"></i> Launch Dashboard
            </button>
        </a>
    </div>

    <div class="developer">
        Crafted with <i class="fas fa-heart" style="color: #ff4757;"></i> by <strong>Anand Dwivedi</strong>
    </div>
</div>

<script>
    // Enhanced background elements generation
    document.addEventListener('DOMContentLoaded', function() {
        const bgContainer = document.getElementById('bgElements');
        const elementCount = 30;

        for (let i = 0; i < elementCount; i++) {
            // Create particles
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

            // Create geometric shapes
            if (i % 3 === 0) {
                const shape = document.createElement('div');
                shape.classList.add('shape');

                const shapeSize = Math.random() * 100 + 20;
                const shapeType = Math.floor(Math.random() * 3);
                const shapeColor = `hsla(${Math.random() * 60 + 180}, 70%, 50%, 0.1)`;

                shape.style.width = `${shapeSize}px`;
                shape.style.height = `${shapeSize}px`;
                shape.style.background = shapeColor;
                shape.style.left = `${Math.random() * 90 + 5}%`;
                shape.style.top = `${Math.random() * 90 + 5}%`;
                shape.style.animationDuration = `${Math.random() * 40 + 20}s`;
                shape.style.animationDelay = `${Math.random() * 10}s`;

                if (shapeType === 0) {
                    shape.style.borderRadius = '50%';
                } else if (shapeType === 1) {
                    shape.style.clipPath = 'polygon(50% 0%, 0% 100%, 100% 100%)';
                } else {
                    shape.style.transform = 'rotate(45deg)';
                }

                bgContainer.appendChild(shape);
            }
        }

        // Enhanced button ripple effect
        const button = document.querySelector('.start-btn');
        button.addEventListener('click', function(e) {
            e.preventDefault();

            const ripple = document.createElement('span');
            ripple.classList.add('ripple-effect');

            const rect = button.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            ripple.style.background = 'radial-gradient(circle, rgba(255,255,255,0.8) 0%, transparent 70%)';

            button.appendChild(ripple);

            setTimeout(() => {
                ripple.remove();
                window.location.href = document.querySelector('.start-link').href;
            }, 1000);
        });

        // Custom cursor effects
        const cursor = document.getElementById('cursor');
        const cursorFollower = document.getElementById('cursorFollower');

        document.addEventListener('mousemove', (e) => {
            cursor.style.left = `${e.clientX}px`;
            cursor.style.top = `${e.clientY}px`;

            setTimeout(() => {
                cursorFollower.style.left = `${e.clientX}px`;
                cursorFollower.style.top = `${e.clientY}px`;
            }, 100);
        });

        // Interactive elements cursor effects
        const interactiveElements = document.querySelectorAll('button, a, .tech-badge');

        interactiveElements.forEach(el => {
            el.addEventListener('mouseenter', () => {
                cursor.style.transform = 'translate(-50%, -50%) scale(2)';
                cursor.style.opacity = '0.5';
                cursorFollower.style.width = '30px';
                cursorFollower.style.height = '30px';
                cursorFollower.style.border = '2px solid var(--primary)';
            });

            el.addEventListener('mouseleave', () => {
                cursor.style.transform = 'translate(-50%, -50%) scale(1)';
                cursor.style.opacity = '1';
                cursorFollower.style.width = '40px';
                cursorFollower.style.height = '40px';
                cursorFollower.style.border = '2px solid var(--primary-light)';
            });
        });

        // Tech badge 3D tilt effect
        const techBadges = document.querySelectorAll('.tech-badge');

        techBadges.forEach(badge => {
            badge.addEventListener('mousemove', (e) => {
                const rect = badge.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                const centerX = rect.width / 2;
                const centerY = rect.height / 2;

                const angleX = (y - centerY) / 10;
                const angleY = (centerX - x) / 10;

                badge.style.transform = `perspective(1000px) rotateX(${angleX}deg) rotateY(${angleY}deg) translateY(-5px)`;
            });

            badge.addEventListener('mouseleave', () => {
                badge.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateY(-5px)';
            });
        });
    });
</script>
</body>
</html>