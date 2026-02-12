<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Montserrat', sans-serif; }
        body { display: flex; min-height: 100vh; background: #f5f5f5; }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #1a73e8;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 40px;
            font-size: 24px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 10px;
            margin: 6px 0;
            border-radius: 8px;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover { background-color: rgba(255,255,255,0.2); }

        /* Main content */
        .main {
            flex: 1;
            padding: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .top-bar h1 { color: #333; }

        /* Stats Cards */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }

        .card h3 { color: #1a73e8; margin-bottom: 10px; }
        .card p { font-size: 24px; font-weight: 600; color: #333; }

        /* Welcome section */
        .welcome {
            background: linear-gradient(90deg, #1a73e8, #34a853);
            color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        @media(max-width:768px){
            .sidebar { width: 60px; padding: 10px; }
            .sidebar h2, .sidebar a span { display: none; }
            .card-container { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>HotelAdmin</h2>
        <a href="#"><span>Dashboard</span></a>
        <a href="#"><span>Rooms</span></a>
        <a href="#"><span>Bookings</span></a>
        <a href="#"><span>Guests</span></a>
        <a href="#"><span>Payments</span></a>
        <a href="#"><span>Reports</span></a>
        <a href="login.jsp"><span>Logout</span></a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="top-bar">
            <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
            <p>Date: <%= new java.util.Date() %></p>
        </div>

        <!-- Welcome Card -->
        <div class="welcome">
            <h2>Daily Message</h2>
            <p>"Ensure your guests feel at home – excellence is in the details."</p>
        </div>

        <!-- Stats Cards -->
        <div class="card-container">
            <div class="card">
                <h3>Total Rooms</h3>
                <p>120</p>
            </div>
            <div class="card">
                <h3>Active Bookings</h3>
                <p>45</p>
            </div>
            <div class="card">
                <h3>Total Guests</h3>
                <p>78</p>
            </div>
            <div class="card">
                <h3>Revenue Today</h3>
                <p>$3,250</p>
            </div>
        </div>

        <!-- Upcoming Events or Notices -->
        <div class="card-container" style="margin-top:30px;">
            <div class="card">
                <h3>Upcoming Events</h3>
                <p>Wedding Banquet - 5th Feb</p>
            </div>
            <div class="card">
                <h3>Pending Payments</h3>
                <p>7</p>
            </div>
        </div>
    </div>

</body>
</html>
