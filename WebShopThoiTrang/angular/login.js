function Login() {		
	var user = {};
    user.taiKhoan = $("#taikhoan").val();
    user.matKhau = $("#matkhau").val();
	
    console.log(user);
    $.ajax({
		type: "POST",
		url: "https://localhost:44322/api/NguoiDung/dangnhap",
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify(user)
	}).done(function (data) {         
		localStorage.setItem("user", JSON.stringify(data));
		window.location.href = "admin_gioithieu.html";   
	}).fail(function() {
	  alert('Tài khoản hoặc mật khẩu không chính xác');
	});
};