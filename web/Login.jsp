<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<title>Pawtectors | Admin Portal</title>
<link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
--color-primary: #1F4A66;
--color-accent: #4A89B0;
--bg-gradient: linear-gradient(135deg, #1F4A66 0%, #0f2a3d 100%);
}

    body {
        font-family: 'Inter', sans-serif;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        background: var(--bg-gradient);
        color: white;
    }

    .login-card {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(20px);
        padding: 50px;
        border-radius: 30px;
        box-shadow: 0 25px 50px rgba(0,0,0,0.3);
        width: 100%;
        max-width: 400px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        text-align: center;
    }

    .logo-area {
        margin-bottom: 40px;
    }

    .logo-area i {
        font-size: 50px;
        color: var(--color-accent);
        margin-bottom: 15px;
    }

    .logo-area h1 {
        font-size: 24px;
        font-weight: 800;
        margin: 0;
        letter-spacing: -0.5px;
    }

    .logo-area p {
        font-size: 14px;
        color: #A8C8DB;
        margin-top: 5px;
    }

    .form-group {
        text-align: left;
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        margin-bottom: 8px;
        color: #A8C8DB;
        letter-spacing: 1px;
    }

    .input-wrapper {
        position: relative;
    }

    .input-wrapper i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #64748b;
    }

    .form-control {
        width: 100%;
        padding: 14px 15px 14px 45px;
        background: rgba(255, 255, 255, 0.9);
        border: none;
        border-radius: 12px;
        box-sizing: border-box;
        font-family: inherit;
        font-size: 15px;
        color: #1F4A66;
        transition: 0.3s;
    }

    .form-control:focus {
        outline: none;
        box-shadow: 0 0 0 4px rgba(74, 137, 176, 0.3);
    }

    .btn-login {
        width: 100%;
        padding: 16px;
        background: var(--color-accent);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    .btn-login:hover {
        background: #5ba2cc;
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }

    .back-link {
        display: inline-block;
        margin-top: 25px;
        color: #A8C8DB;
        text-decoration: none;
        font-size: 14px;
        transition: 0.2s;
    }

    .back-link:hover {
        color: white;
    }

    /* Error message styling */
    .error-msg {
        background: #fee2e2;
        color: #991b1b;
        padding: 12px;
        border-radius: 10px;
        font-size: 13px;
        margin-bottom: 20px;
        display: ${param.error != null ? 'block' : 'none'};
    }
</style>


</head>
<body>

<div class="login-card">
    <div class="logo-area">
        <i class="fa-solid fa-shield-cat"></i>
        <h1>Admin Portal</h1>
        <p>Please authorize to continue</p>
    </div>

    <div class="error-msg">
        <i class="fa-solid fa-circle-exclamation"></i> Invalid username or password.
    </div>

    <form action="AdminAuth" method="POST">
        <div class="form-group">
            <label>Username</label>
            <div class="input-wrapper">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="username" class="form-control" placeholder="Admin username" required>
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-wrapper">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>
        </div>

        <button type="submit" class="btn-login">Login to Dashboard</button>
    </form>

    <a href="AboutUs.html" class="back-link">
        <i class="fa-solid fa-arrow-left"></i> Return to Site
    </a>
</div>


</body>
</html>