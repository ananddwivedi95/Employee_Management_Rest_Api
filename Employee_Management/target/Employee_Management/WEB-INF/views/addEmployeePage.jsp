<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #00f7ff;
            --secondary: #02d1c1;
            --dark-blue: #0f2027;
            --mid-blue: #203a43;
            --glass: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --error: #ff6b6b;
            --success: #51cf66;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, var(--dark-blue), var(--mid-blue));
            font-family: 'Poppins', sans-serif;
            color: white;
            min-height: 100vh;
            padding: 1rem;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            font-size: 1.8rem;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin: 1rem 0;
            text-align: center;
        }

        .glass-panel {
            background: var(--glass);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            display: none;
            animation: fadeIn 0.3s ease;
        }

        .form-section.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.3rem;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.6rem;
            border-radius: 6px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            background: rgba(255, 255, 255, 0.08);
            color: white;
            font-size: 0.9rem;
            transition: all 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.12);
        }

        .form-control.error {
            border-color: var(--error);
        }

        .form-nav {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
        }

        .btn {
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            border: none;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: var(--primary);
            color: #111;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Success Notification */
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--success);
            color: white;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: flex;
            align-items: center;
            gap: 0.8rem;
            z-index: 1000;
            transform: translateX(200%);
            transition: transform 0.3s cubic-bezier(0.68, -0.55, 0.27, 1.55);
        }

        .notification.show {
            transform: translateX(0);
        }

        .notification i {
            font-size: 1.2rem;
        }

        .notification-content {
            font-size: 0.9rem;
        }

        .notification strong {
            display: block;
            font-weight: 600;
            margin-bottom: 0.2rem;
        }

        /* Particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.4);
            border-radius: 50%;
            animation: float-up linear infinite;
        }

        @keyframes float-up {
            to {
                transform: translateY(-100vh);
            }
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 1.5rem;
            }

            .glass-panel {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
<!-- Particle Background -->
<div class="particles" id="particles"></div>

<div class="container">
    <h1>Add New Employee</h1>

    <div class="glass-panel">
        <form id="employeeForm">
            <!-- Section 1: Personal Information -->
            <div class="form-section active" id="section1">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="id">Employee ID *</label>
                        <input type="number" class="form-control" id="id" name="id" required>
                    </div>

                    <div class="form-group">
                        <label for="name">Full Name *</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone *</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>

                    <div class="form-group">
                        <label for="address">Address *</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>
                </div>

                <div class="form-nav">
                    <div></div>
                    <button type="button" class="btn btn-primary" onclick="validateSection1()">
                        Next <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>

            <!-- Section 2: Employment Details -->
            <div class="form-section" id="section2">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <input type="text" class="form-control" id="department" name="department" required>
                    </div>

                    <div class="form-group">
                        <label for="designation">Designation *</label>
                        <input type="text" class="form-control" id="designation" name="designation" required>
                    </div>

                    <div class="form-group">
                        <label for="salary">Salary *</label>
                        <input type="number" step="0.01" class="form-control" id="salary" name="salary" required>
                    </div>

                    <div class="form-group">
                        <label for="dateOfJoining">Joining Date *</label>
                        <input type="date" class="form-control" id="dateOfJoining" name="dateOfJoining" required>
                    </div>
                </div>

                <div class="form-nav">
                    <button type="button" class="btn btn-secondary" onclick="prevSection()">
                        <i class="fas fa-arrow-left"></i> Back
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <span id="submitText">Submit</span> <i class="fas fa-check"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Success Notification -->
<div class="notification" id="notification">
    <i class="fas fa-check-circle"></i>
    <div class="notification-content">
        <strong>Success!</strong>
        <div>Employee added successfully</div>
    </div>
</div>

<script>
    // Initialize particles
    function initParticles() {
        const container = document.getElementById('particles');
        const particleCount = Math.min(Math.floor(window.innerWidth / 15), 50);

        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.classList.add('particle');

            const size = Math.random() * 3 + 1;
            const posX = Math.random() * window.innerWidth;
            const duration = Math.random() * 10 + 10;
            const delay = Math.random() * 5;

            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.left = `${posX}px`;
            particle.style.bottom = `-10px`;
            particle.style.animationDuration = `${duration}s`;
            particle.style.animationDelay = `${delay}s`;
            particle.style.opacity = Math.random() * 0.4 + 0.1;

            container.appendChild(particle);
        }
    }

    // Form navigation
    function validateSection1() {
        const inputs = document.querySelectorAll('#section1 input');
        let isValid = true;

        inputs.forEach(input => {
            if (!input.value.trim()) {
                input.classList.add('error');
                isValid = false;
            } else {
                input.classList.remove('error');
            }
        });

        if (isValid) {
            document.getElementById('section1').classList.remove('active');
            document.getElementById('section2').classList.add('active');
        } else {
            // Shake animation for error
            const section = document.getElementById('section1');
            section.style.animation = 'shake 0.5s';
            setTimeout(() => section.style.animation = '', 500);
        }
    }

    function prevSection() {
        document.getElementById('section2').classList.remove('active');
        document.getElementById('section1').classList.add('active');
    }

    // Form submission
    document.getElementById('employeeForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        // Validate all fields
        const allInputs = document.querySelectorAll('input[required]');
        let isValid = true;

        allInputs.forEach(input => {
            if (!input.value.trim()) {
                input.classList.add('error');
                isValid = false;
            }
        });

        if (!isValid) {
            alert('Please fill all required fields');
            return;
        }

        const submitBtn = document.querySelector('button[type="submit"]');
        const submitText = document.getElementById('submitText');
        const originalText = submitText.textContent;

        // Show loading state
        submitText.textContent = 'Processing...';
        submitBtn.disabled = true;
        submitBtn.innerHTML = `<i class="fas fa-spinner fa-spin"></i> ${submitText.textContent}`;

        try {
            const employeeData = {
                id: parseInt(document.getElementById('id').value),
                name: document.getElementById('name').value,
                email: document.getElementById('email').value,
                phone: document.getElementById('phone').value,
                address: document.getElementById('address').value,
                department: document.getElementById('department').value,
                designation: document.getElementById('designation').value,
                salary: parseFloat(document.getElementById('salary').value),
                dateOfJoining: document.getElementById('dateOfJoining').value
            };

            const response = await fetch('http://localhost:8080/Employee_Management/employee/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(employeeData)
            });

            if (!response.ok) {
                throw new Error(await response.text() || 'Failed to add employee');
            }

            // Show success notification
            const notification = document.getElementById('notification');
            notification.classList.add('show');

            // Reset form
            this.reset();
            prevSection();

            // Hide notification after 3 seconds
            setTimeout(() => {
                notification.classList.remove('show');
            }, 3000);

        } catch (error) {
            console.error('Error:', error);
            alert(`Error: ${error.message}`);
        } finally {
            // Reset button state
            submitText.textContent = originalText;
            submitBtn.disabled = false;
            submitBtn.innerHTML = `${submitText.textContent} <i class="fas fa-check"></i>`;
        }
    });

    // Real-time validation
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('input', function() {
            if (this.value.trim()) {
                this.classList.remove('error');
            }
        });
    });

    // Initialize on load
    document.addEventListener('DOMContentLoaded', initParticles);
</script>
</body>
</html>