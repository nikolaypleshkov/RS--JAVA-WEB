<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style=" min-height: 100%;">
<head>
    <title>Book</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/src/main/webapp/assets/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    
    </script>
</head>
<body>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">ArtiX Reservation</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="home-servlet">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Booking</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#">Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="signin">Sign In</a>
          <a class="dropdown-item" href="signup">Create Account</a>
          <a class="dropdown-item" href="#" style="display: none;">Logout</a>
        </div>
      </li>
    </ul>
  </div>
</nav>


<div class="form-group" style="margin-top:5%;">
  <h1 class="text-center">Flights</h1>
</div>
<div class="d-flex justify-content-center" >

  <form action="${pageContext.request.contextPath}/add-list" method="get">
  <div class="form-row">
    <div class="col" style="width: 50%">
      <input type="text" class="form-control" placeholder="Travelling To?" name="city_to">
    </div>

    <div class="col">
      <input type="text" class="form-control" placeholder="Travelling From?" name="city_from">
    </div>
    <div class="col">
      <input class="form-control"  id="datepicker" placeholder="Travelling when?" />
    </div>
    <div class="col">
      <button type="submit" class="btn btn-dark" style="width: 60%;" name="flight-search">Search</button>
    </div>
  </div>
</form>
</div>

<form method="get" action="add-list">
  <div class="d-flex justify-content-center" style="margin-top: 5%;">
    <%
      try
      {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/usersData","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from flights WHERE flight_from = 'Burgas,Bulgaria' AND flight_to =  'Berlin,Germany';");
    %>
    <table class="table" style="width: 50%">
      <thead class="thead-dark">
      <% ResultSetMetaData resultSetMetaData = rs.getMetaData();
        int total = resultSetMetaData.getColumnCount();
      %>
      <tr>
        <th scope="col">Flight №</th>
        <th scope="col">Flight Name</th>
        <th scope="col">From</th>
        <th scope="col">To</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Airport</th>
        <th scope="col"></th>

      </tr>
      </thead>
      <tbody>
      <%while(rs.next()){
      %>
        <tr>
          <th scope="row" name = "flight_numb"><%=rs.getString(2) %></th>
          <td scope="row" name = "flight_name"><%=rs.getString(3) %></td>
          <td scope="row" name = "from-td"><%=rs.getString(4) %></td>
          <td scope="row" name = "to-td"><%=rs.getString(5) %></td>
          <td scope="row" name = "date"><%=rs.getString(6) %></td>
          <td scope="row" name = "time"><%=rs.getString(7) %></td>
          <td scope="row" name="airport-td"><%=rs.getString(8) %></td>
          <td scope="row"> <button class="btn btn-dark" type="submit">Book</button></td>
        </tr>
      <%
          st.close();
          con.close();
        }%>
      </tbody>
    </table>
    <%}
    catch(Exception e){
      e.printStackTrace();
    %><br><%
    }

  %>

  </div>
</form>

<script>
  $('#datepicker').datepicker({
    uiLibrary: 'bootstrap'
  });
</script>
<footer class="bg-dark text-center text-white" style=" position: absolute;bottom: 0; width: 100%;">

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>
</body>
</html>