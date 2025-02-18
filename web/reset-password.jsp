<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .reset-password-container {
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
        <div class="reset-password-container">
            <h2 class="text-center mb-4">Reset Password</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="reset-password" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="token" value="${token}">
                <div class="mb-3">
                    <label for="password" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="password" name="password" required 
                           onkeyup="validatePassword()">
                    <div id="passwordHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                           required onkeyup="validateConfirmPassword()">
                    <div id="confirmPasswordHelp" class="form-text"></div>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Reset Password</button>
                </div>
                <div class="text-center mt-3">
                    <a href="login.jsp">Back to Login</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
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
            return validatePassword() && validateConfirmPassword();
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
