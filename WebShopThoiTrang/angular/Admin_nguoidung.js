var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminNguoiDungCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.taiKhoan = "";
        $scope.matKhau = "";
        $scope.email = "";
        $scope.hoTen = "";
        $scope.ngaySinh = "";
        $scope.diaChi = "";
        $scope.soDienThoai = "";
        $scope.gioiTinh = "";
        $scope.anhDaiDien = "";
        $scope.trangThai = "True";
        $scope.vaiTro = "";
    }

    //Lấy liên hệ 
	$scope.listdata; 
    $scope.pageSize = "20";   
    $scope.LoadNguoiDung = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/NguoiDung/nguoidung-timkiem',
        }).then(function (response) {	
            $scope.listdata = response.data.data;
            console.log($scope.listdata)
        });
    };  
    $scope.LoadNguoiDung();



    //Lấy về một bản ghi 
    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/NguoiDung/Get-theo-ma/' + ma,
        }).then(function (response) {
            let nguoidung = response.data;
            $scope.maNguoiDung = nguoidung.maNguoiDung;
            $scope.taiKhoan=nguoidung.taiKhoan;
            $scope.matKhau = nguoidung.matKhau;
            $scope.email = nguoidung.email;
            $scope.hoTen = nguoidung.hoTen;
            $scope.ngaySinh = nguoidung.ngaySinh;
            $scope.diaChi = nguoidung.diaChi;
            $scope.soDienThoai = nguoidung.soDienThoai;
            $scope.gioiTinh = nguoidung.gioiTinh;
            $scope.anhDaiDien = nguoidung.anhDaiDien;
            if(nguoidung.trangThai =="true"){
                $scope.trangThai = "true"
            }
            else{
                $scope.trangThai ="false";
            }
            $scope.vaiTro = nguoidung.vaiTro;
        });
    }

    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maNguoiDung = $scope.maNguoiDung;
        obj.taiKhoan = $scope.taiKhoan;
        obj.matKhau = $scope.matKhau;
        obj.email = $scope.email;
        obj.hoTen = $scope.hoTen;
        obj.ngaySinh = $scope.ngaySinh;
        obj.diaChi = $scope.diaChi;
        obj.soDienThoai = $scope.soDienThoai;
        obj.gioiTinh = $scope.gioiTinh;
        obj.trangThai = ($scope.trangThai === "true") ? true : false;
        obj.vaiTro = $scope.vaiTro;
        var file = document.getElementById('file').files[0];

        if(file)
        {
            const formData = new FormData();
            formData.append('file', file);

            $http({
                method: 'POST',
                headers: {
                    "Authorization": 'Bearer ' + _user.token,
                    'Content-Type': undefined
                },
                data: formData,
                url:  Admin_current_url + '/api/NguoiDung/upload',
            }).then(function (res) {

                obj.anhDaiDien = res.data.filePath;

                if($scope.btnText == "Thêm")
                {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/NguoiDung/create-nguoidung',
                    }).then(function (response) {
                        $scope.LoadNguoiDung();
                        alert('Thêm người dùng thành công!');
                    });
                }
                else
                {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/NguoiDung/update-nguoidung',
                    }).then(function (response) {
                        $scope.LoadNguoiDung();
                        alert('Sửa người dùng  thành công!');
                    });
                }
            });
        }
        else
        {
            obj.anhDaiDien = $scope.anhDaiDien;

            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/NguoiDung/create-nguoidung',
                    }).then(function (response) {
                        $scope.LoadNguoiDung();
                        alert('Thêm người dùng  thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url +  '/api/NguoiDung/update-nguoidung',
                    }).then(function (response) {
                        $scope.LoadNguoiDung();
                        alert('Sửa người dùng  thành công!');
                    });
            }
        }
        $("#exampleModal").modal("hide");
    }
    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/NguoiDung/delete-nguoidung/' + ma,
            }).then(function (response) {
                $scope.LoadNguoiDung();
                alert('Xóa thành công!');
            });
        } 
    };
    
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});