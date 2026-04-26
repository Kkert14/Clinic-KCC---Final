<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unauthorized</title>
    
</head>
<body>
    <div class="card">
        <h1>403 - Unauthorized Access</h1>
        <p>You do not have permission to view this page.</p>
        <a href="<?= base_url('/dashboard') ?>">Go Back to Dashboard</a>
    </div>
</body>
</html>

<style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .card {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
        }

        h1 {
            margin-bottom: 10px;
            color: #1e3c72;
            font-size: 28px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
        }

        a {
            text-decoration: none;
            background: #2a5298;
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        a:hover {
            background: #1e3c72;
        }
    </style>