var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminGiamGiaCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.maSanPham = "";
        $scope.phamTramGiamGia = "";
        $scope.thoiGianBatDau = "";
        $scope.thoiGianKetThuc = "";
        $scope.trangThai = "True";
    }

    //Lấy liên hệ 
	$scope.listdata;
    $scope.pageSize = 3;
    $scope.currentPage = 1;
    $scope.totalPages = 1;

    $scope.LoadGG = function () {
        let obj = {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: Admin_current_url + '/api/GiamGia/get-gg',
        }).then(function (response) {
            $scope.listdata = response.data.data;
            $scope.totalPages = Math.ceil(response.data.totalItems / $scope.pageSize);
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
        $scope.LoadGG();
    };    

    $scope.LoadGG();

    //Lấy sản phẩm
    $scope.listSanPham = [];
    $scope.LoadSP = function () {	  
        let obj =  {
            page: "1",
            pageSize: "50"
        };
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/SanPham/timkiem-sanpham',
        }).then(function (response) {	
            $scope.listSanPham = response.data.data;
            console.log($scope.listSanPham);
        });
    };  
    $scope.LoadSP();



     //Lấy về một bản ghi 
     $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/GiamGia/Get-theo-ma/' + ma,
        }).then(function (response) {
            let gg = response.data;
            $scope.maGiamGia = gg.maGiamGia;
            $scope.maSanPham =gg.maSanPham;
            $scope.phamTramGiamGia = gg.phamTramGiamGia;
            $scope.thoiGianBatDau = gg.thoiGianBatDau;
            $scope.thoiGianKetThuc = gg.thoiGianKetThuc;
            if(gg.trangThai =="true"){
                $scope.trangThai = "true"
            }
            else{
                $scope.trangThai ="false";
            }
        });
    }

    //Viết hàm thêm / sửa liên hệ 
    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maGiamGia = $scope.maGiamGia;
        obj.maSanPham = $scope.maSanPham;
        obj.phamTramGiamGia = $scope.phamTramGiamGia;
        obj.thoiGianBatDau = $scope.thoiGianBatDau;
        obj.thoiGianKetThuc = $scope.thoiGianKetThuc;
        obj.trangThai = ($scope.trangThai === "true") ? true : false;
            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GiamGia/Them-GiamGia',
                    }).then(function (response) {
                        $scope.LoadGG();
                        alert('Thêm giam gia  thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GiamGia/Cap-nhat-giamgia',
                    }).then(function (response) {
                        $scope.LoadGG();
                        alert('Sửa giam gia thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }

    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/GiamGia/xoa-giamgia/' + ma,
            }).then(function (response) {
                $scope.LoadGG();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});