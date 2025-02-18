<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .register-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="register-container">
            <h2 class="text-center mb-4">Register</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="register" method="post" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required 
                           minlength="5" onkeyup="validateUsername()">
                    <div id="usernameHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required 
                           onkeyup="validatePassword()">
                    <div id="passwordHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" required 
                           onkeyup="validateConfirmPassword()">
                    <div id="confirmPasswordHelp" class="form-text"></div>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
                <div class="text-center mt-3">
                    <a href="login.jsp">Already have an account? Login</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function validateUsername() {
            const username = document.getElementById('username');
            const help = document.getElementById('usernameHelp');
            
            if (username.value.length < 5) {
                help.innerHTML = 'Username must be at least 5 characters long';
                help.className = 'form-text text-danger';
                return false;
            } else {
                help.innerHTML = 'Username is valid';
                help.className = 'form-text text-success';
                return true;
            }
        }
        
        function validatePassword() {
            const password = document.getElementById('password');
            const help = document.getElementById('passwordHelp');
            
            const hasUpper = /[A-Z]/.test(password.value);
            const hasLower = /[a-z]/.test(password.value);
            const hasNumber = /[0-9]/.test(password.value);
            const hasSpecial = /[!@#$%^&*]/.test(password.value);
            const isLongEnough = password.value.length >= 6;
            
            let message = 'Password must contain:<br>';
            if (!isLongEnough) message += '❌ At least 6 characters<br>';
            if (!hasUpper) message += '❌ At least one uppercase letter<br>';
            if (!hasLower) message += '❌ At least one lowercase letter<br>';
            if (!hasNumber) message += '❌ At least one number<br>';
            if (!hasSpecial) message += '❌ At least one special character (!@#$%^&*)<br>';
            
            if (isLongEnough && hasUpper && hasLower && hasNumber && hasSpecial) {
                help.innerHTML = '✅ Password is valid';
                help.className = 'form-text text-success';
                return true;
            } else {
                help.innerHTML = message;
                help.className = 'form-text text-danger';
                return false;
            }
        }
        
        function validateConfirmPassword() {
            const password = document.getElementById('password');
            const confirm = document.getElementById('confirmPassword');
            const help = document.getElementById('confirmPasswordHelp');
            
            if (password.value === confirm.value) {
                help.innerHTML = '✅ Passwords match';
                help.className = 'form-text text-success';
                return true;
            } else {
                help.innerHTML = '❌ Passwords do not match';
                help.className = 'form-text text-danger';
                return false;
            }
        }
        
        function validateForm() {
            return validateUsername() && 
                   validatePassword() && 
                   validateConfirmPassword();
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
