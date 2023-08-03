var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminLienHeCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.thongTinLienHe = "";
        $scope.email = "";
        $scope.soDienThoai = "";
        $scope.coSoLienHe = "";
    }

    //Lấy liên hệ 
	$scope.listdata; 
    $scope.pageSize = "20";   
    $scope.LoadLienHe = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/LienHe/search-lienhe',
        }).then(function (response) {	
            $scope.listdata = response.data.data;
            console.log($scope.listdata);
        });
    };  
    $scope.LoadLienHe();



    //Lấy về một bản ghi 
    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/LienHe/Get-theo-ma/' + ma,
        }).then(function (response) {
            let lienhe = response.data;
            $scope.maLienHe = lienhe.maLienHe;
            $scope.thongTinLienHe =lienhe.thongTinLienHe;
            $scope.email = lienhe.email;
            $scope.soDienThoai = lienhe.soDienThoai;
            $scope.coSoLienHe = lienhe.coSoLienHe;
        });
    }

    //Viết hàm thêm / sửa liên hệ 
    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maLienHe = $scope.maLienHe;
        obj.thongTinLienHe = $scope.thongTinLienHe;
        obj.email = $scope.email;
        obj.soDienThoai = $scope.soDienThoai;
        obj.coSoLienHe = $scope.coSoLienHe;
            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/LienHe/Them-lienhe',
                    }).then(function (response) {
                        $scope.LoadLienHe();
                        alert('Thêm liên hệ  thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/LienHe/Cap-nhat-lienhe',
                    }).then(function (response) {
                        $scope.LoadLienHe();
                        alert('Sửa liên hệ thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }

    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/LienHe/xoa-lienhe/' + ma,
            }).then(function (response) {
                $scope.LoadLienHe();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});