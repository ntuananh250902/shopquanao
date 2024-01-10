<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foody</title>
<style type="text/css">
@import url("http://fonts.googleapis.com/css2?family=Inter:wght@300;600&display=swap");

*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'poppins', sans-serif;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    width: 100%;
  	background: url('./img/digital-digital-art-artwork-illustration-minimalism-hd-wallpaper-preview.jpg') no-repeat;
  	background-position: center;
    background-size: cover;
}

.form-box{
    position: relative;
    width: 400px;
    height: 450px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

h2{
    font-size: 2em;
    color: #fff;
    text-align: center;
}

.inputbox{
    position: relative;
    margin: 30px 0;
    width: 310px;
    border-bottom: 2px solid #fff;
}

.inputbox label{
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    color: #fff;
    font-size: 1em;
    pointer-events: none;
    transition: .5s;
}

input:focus~label,
input:valid~label{
    top: -5px;
}

.inputbox input{
    width: 100%;
    height: 50px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    padding: 0 35px 0 5px;
    color: #fff;
}

.inputbox ion-icon{
    position: absolute;
    right: 8px;
    color: #fff;
    font-size: 1.2em;
    top: 20px;
}

.forget{
    margin: -15px 0 15px;
    font-size: .9em;
    color: #fff;
    display: flex;
    justify-content: space-between;
}

.forget label input{
    margin-right: 3px;
}

a{
    color: #fff;
    text-decoration: none;
}

a:hover{
    text-decoration: underline;
}

button{
    width: 100%;
    height: 40px;
    border-radius: 100px;
    border: none;
    outline: none;
    cursor: pointer;
    font-size: 1em;
    font-weight: 600;
}

.register{
    font-size: .9em;
    color: #fff;
    text-align: center;
    margin: 25px 0 10px;
}

.register a{
    text-decoration: none;
    color: #fff;
    font-weight: 600;
    margin-left: 10px;
}

.register a:hover{
    text-decoration: underline;
}
</style>
</head>
<body>
 <div class="form-box">
            <div class="form-value">
                <form action="loginUser" method="POST">
                    <h2>Đăng Nhập</h2>
                    <div class="inputbox">
                       <ion-icon name="person-outline"></ion-icon>
                        <input type="text" name="tendangnhap" required>
                        <label for="">Tên đăng nhập</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="matkhau" required>
                        <label for="">Mật khẩu</label>
                    </div>
                    <button>Đăng nhập</button>
                    
                </form>
            </div>
        </div>
    <s:if test="hasActionMessages()">
        <div class="welcome">
            <s:actionmessage /> 
        </div>
    </s:if>
     <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>