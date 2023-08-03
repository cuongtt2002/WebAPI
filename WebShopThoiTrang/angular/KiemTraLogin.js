//Kiểm tra đăng nhập----------------------------------------------------------
if (!localStorage.getItem('user')) {
    window.location.replace('login.html');
}

function DangXuat() {
    localStorage.removeItem("user");
    window.location.replace('login.html');
}