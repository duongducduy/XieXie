<%-- 
    Document   : dashboard
    Created on : Jun 22, 2025, 9:41:52 PM
    Author     : duong
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
      <style>
    body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fc;
}

.container {
    display: flex;
    height: 100vh;
    width: 100vw;
    overflow: hidden;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    background-color: #ffffff;
    padding: 20px;
    border-right: 1px solid #e0e0e0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.sidebar .logo {
    font-size: 20px;
    font-weight: bold;
    color: #5b21b6;
    margin-bottom: 30px;
}

.sidebar .menu ul,
.sidebar .friends ul,
.sidebar .settings ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar li {
    margin: 10px 0;
    color: #555;
    cursor: pointer;
}

.sidebar li.active {
    color: #5b21b6;
    font-weight: bold;
}

.sidebar .logout {
    color: red;
}

/* MAIN CONTENT */
.main {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
}

.search-bar input {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
    margin-bottom: 20px;
}

.highlight-course {
    background-color: #7c3aed;
    color: white;
    padding: 30px;
    border-radius: 16px;
    margin-bottom: 20px;
    position: relative;
}

.highlight-course button {
    margin-top: 15px;
    padding: 10px 20px;
    background: white;
    color: #7c3aed;
    border: none;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
}

.course-progress {
    display: flex;
    gap: 20px;
    margin: 20px 0;
}

.course-progress .item {
    flex: 1;
    background: white;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    text-align: center;
    font-size: 14px;
}

.course-progress .item span {
    font-weight: bold;
    display: block;
    margin-top: 8px;
}

.continue-section h3 {
    margin-top: 30px;
    margin-bottom: 15px;
    font-size: 20px;
}

.course-grid {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
}

.card {
    background: white;
    border-radius: 12px;
    padding: 15px;
    width: 220px;
    box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    text-align: center;
}

.card img {
    width: 100%;
    border-radius: 8px;
    margin-bottom: 10px;
}

.card p {
    font-weight: bold;
    font-size: 14px;
    margin: 10px 0 5px;
}

.mentor-table {
    margin-top: 30px;
}

.mentor-table table {
    width: 100%;
    background: white;
    border-collapse: collapse;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 1px 4px rgba(0,0,0,0.1);
}

.mentor-table th, .mentor-table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #f0f0f0;
    font-size: 14px;
}

.details {
    background: #e0e7ff;
    border: none;
    padding: 8px 12px;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    color: #3730a3;
}

/* PROFILE SIDEBAR */
.profile-bar {
    width: 250px;
    background-color: #ffffff;
    padding: 20px;
    border-left: 1px solid #e0e0e0;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.profile-bar .profile img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 10px;
}

.profile-bar .profile h4 {
    margin: 5px 0;
    font-size: 16px;
}

.profile-bar .profile p {
    font-size: 12px;
    color: #666;
    text-align: center;
}

.stats img {
    width: 100%;
    margin: 20px 0;
}

.mentors p {
    font-weight: bold;
    margin-bottom: 10px;
}

.mentors ul {
    list-style: none;
    padding: 0;
    width: 100%;
}

.mentors li {
    margin: 10px 0;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.see-all {
    width: 100%;
    padding: 8px;
    background: #7c3aed;
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
}
</style>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div class="logo">COURSE</div>
        <nav class="menu">
            <ul>
                <li class="active">Dashboard</li>
                <li>Inbox</li>
                <li>Lesson</li>
                <li>Task</li>
                <li>Group</li>
            </ul>
        </nav>
        <div class="friends">
            <p>FRIENDS</p>
            <ul>
                <li>Prashant<br><small>Software Developer</small></li>
                <li>Prashant<br><small>Software Developer</small></li>
                <li>Prashant<br><small>Software Developer</small></li>
            </ul>
        </div>
        <div class="settings">
            <p>SETTINGS</p>
            <ul>
                <li>Settings</li>
                <li class="logout">Logout</li>
            </ul>
        </div>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main">
        <div class="search-bar">
            <input type="text" placeholder="Search your course here..." />
        </div>

        <div class="highlight-course">
            <div class="content">
                <h2>Sharpen Your Skills With<br>Professional Online Courses</h2>
                <button>Join Now</button>
            </div>
        </div>

        <div class="course-progress">
            <div class="item">2/8 Watched<br><span>Product Design</span></div>
            <div class="item">2/8 Watched<br><span>Product Design</span></div>
            <div class="item">2/8 Watched<br><span>Product Design</span></div>
        </div>

        <div class="continue-section">
            <h3>Continue Watching</h3>
            <div class="course-grid">
                <div class="card">
                    <img src="img/thumb1.png" alt="course" />
                    <p>Beginner’s Guide To Becoming A Professional Frontend Developer</p>
                    <small>Prashant Kumar Singh</small>
                </div>
                <div class="card">
                    <img src="img/thumb2.png" alt="course" />
                    <p>How To Create Your Online Course Step 3</p>
                    <small>Prashant Kumar Singh</small>
                </div>
                <div class="card">
                    <img src="img/thumb3.png" alt="course" />
                    <p>Learn Software Development With Us!</p>
                    <small>Prashant Kumar Singh</small>
                </div>
            </div>
        </div>

        <div class="mentor-table">
            <h3>Your Mentor</h3>
            <table>
                <tr>
                    <th>Name & Date</th>
                    <th>Course Type</th>
                    <th>Course Title</th>
                    <th>Action</th>
                </tr>
                <tr>
                    <td>Prashant Kumar Singh<br>25/2/2023</td>
                    <td>FRONTEND</td>
                    <td>Understanding Concept Of React</td>
                    <td><button class="details">Show Details</button></td>
                </tr>
                <tr>
                    <td>Ravi Kumar<br>25/2/2023</td>
                    <td>FRONTEND</td>
                    <td>Understanding Concept Of React</td>
                    <td><button class="details">Show Details</button></td>
                </tr>
            </table>
        </div>
    </main>

    <!-- PROFILE SIDEBAR -->
    <aside class="profile-bar">
        <div class="profile">
            <img src="img/user.png" alt="avatar" />
            <h4>Good Morning Prashant</h4>
            <p>Continue Your Journey And Achieve Your Target</p>
        </div>
        <div class="stats">
            <img src="img/chart.png" alt="chart" />
        </div>
        <div class="mentors">
            <p>Your Mentor</p>
            <ul>
                <li>Prashant Kumar Singh <button>Follow</button></li>
                <li>Prashant Kumar Singh <button>Follow</button></li>
                <li>Prashant Kumar Singh <button>Follow</button></li>
                <li><button class="see-all">See All</button></li>
            </ul>
        </div>
    </aside>
</div>
</body>
</html>

