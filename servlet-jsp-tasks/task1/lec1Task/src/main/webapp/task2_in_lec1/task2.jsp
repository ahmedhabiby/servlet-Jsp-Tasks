<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="task21.jsp">
        <label for="fullName">Full Name:</label><br>
        <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
        <br><br>

        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
        <br><br>

        <label for="age">Age:</label><br>
        <input type="number" id="age" name="age" placeholder="Enter your age" required>
        <br><br>

        <h3>Address (Radio Buttons):</h3>
        <label>
            <input type="radio" name="addressRadio" value="Cairo" required> Cairo
        </label><br>
        <label>
            <input type="radio" name="addressRadio" value="Alex"> Alex
        </label><br>
        <label>
            <input type="radio" name="addressRadio" value="Menofia"> Menofia
        </label>
        <br><br>

        <h3>Address (Select Input):</h3>
        <select name="addressSelect" required>
            <option value="">-- Select Address --</option>
            <option value="Cairo">Cairo</option>
            <option value="Alex">Alex</option>
            <option value="Menofia">Menofia</option>
        </select>
          <button type="submit">Submit</button>
</form>
</body>
</html>