var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminLoaiSanPhamCtrl", function ($scope, $http) {

    
    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.tenLoaiSanPham = "";
    }

    $scope.listdata;
    $scope.pageSize = 5;
    $scope.currentPage = 1;
    $scope.totalPages = 1;

    $scope.LoadLoaiSP = function () {
        let obj = {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: Admin_current_url + '/api/LoaiSanPham/get-loai',
        }).then(function (response) {
            $scope.listdata = response.data.data;
            $scope.totalPages = Math.ceil(response.data.totalItems/ $scope.pageSize);
            console.log(response.data);
        });
    };

    $scope.setPage = function (page) {
        if (page < 1 || page > $scope.totalPages) {
            return;
        }
        $scope.currentPage = page;
        if ($scope.currentPage === $scope.totalPages && $scope.listdata.length === 0) {
            $scope.currentPage = 1;
        }
        $scope.LoadLoaiSP();
    };    

    $scope.LoadLoaiSP();

    
    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/LoaiSanPham/Get-theo-ma/' + ma,
        }).then(function (response) {
            let loaisp = response.data;
            $scope.maLoaiSanPham = loaisp.maLoaiSanPham;
            $scope.tenLoaiSanPham = loaisp.tenLoaiSanPham;
        });
    }

    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maLoaiSanPham = $scope.maLoaiSanPham;
        obj.tenLoaiSanPham = $scope.tenLoaiSanPham;
            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/LoaiSanPham/Them-loai',
                    }).then(function (response) {
                        $scope.LoadLoaiSP();
                        alert('Thêm loại sản phẩm thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/LoaiSanPham/Cap-nhat-loai',
                    }).then(function (response) {
                        $scope.LoadLoaiSP();
                        alert('Sửa loại sản phẩm thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }
    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/LoaiSanPham/delete-loai/' + ma,
            }).then(function (response) {
                $scope.LoadLoaiSP();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});