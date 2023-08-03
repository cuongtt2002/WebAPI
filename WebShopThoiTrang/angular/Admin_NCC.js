var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminNhaCungCapCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.tenNhaCungCap = "";
        $scope.diaChi = "";
        $scope.soDienThoai = "";
        $scope.email = "";
    }

    //Lấy liên hệ 
	$scope.listdata; 
    $scope.pageSize = "20";   
    $scope.LoadNCC = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/NhaCungCap/get-NCC',
        }).then(function (response) {	
            $scope.listdata = response.data.data;
        });
    };  
    $scope.LoadNCC();



    //Lấy về một bản ghi 
    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/NhaCungCap/Get-ById/' + ma,
        }).then(function (response) {
            let ncc = response.data;
            $scope.maNhaCungCap = ncc.maNhaCungCap;
            $scope.tenNhaCungCap = ncc.tenNhaCungCap;
            $scope.diaChi = ncc.diaChi;
            $scope.soDienThoai = ncc.soDienThoai;
            $scope.email = ncc.email;
        });
    }

    //Viết hàm thêm / sửa nhà cung cấp
    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maNhaCungCap = $scope.maNhaCungCap;
        obj.tenNhaCungCap = $scope.tenNhaCungCap;
        obj.diaChi = $scope.diaChi;
        obj.soDienThoai = $scope.soDienThoai;
        obj.email = $scope.email;
            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/NhaCungCap/Them-NCC',
                    }).then(function (response) {
                        $scope.LoadNCC();
                        alert('Thêm nhà cung cấp thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/NhaCungCap/Cap-nhat-NCC',
                    }).then(function (response) {
                        $scope.LoadNCC();
                        alert('Sửa nhà cung cấp thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }

    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/NhaCungCap/delete-NCC/' + ma,
            }).then(function (response) {
                $scope.LoadNCC();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});