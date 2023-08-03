var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminHoaDonNhapCtrl", function ($scope, $http) {
    
  
    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.ngayNhap = "";
        $scope.maNhaCungCap ="";
        $scope.maNguoiDung ="";
        $scope.listjson_HDN ="";
        sessionStorage.removeItem('listjson_HDN');
        $scope.LoadCTHDN();
    }

    $scope.listdata;
    $scope.pageSize = 2;
    $scope.currentPage = 1;
    $scope.totalPages = 1;

    $scope.LoadHDN = function () {
        let obj = {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: Admin_current_url + '/api/HoaDonNhap/Get-HDN',
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
        $scope.LoadHDN();
    };    

    $scope.LoadHDN();


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


    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maNhaCungCap = $scope.maNhaCungCap;
        obj.maNguoiDung = _user.manguoidung;
        obj.listjson_HDN = $scope.listCTHDN;
        if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/HoaDonNhap/Them-HDN',
                    }).then(function (response) {
                        $scope.LoadHDN();
                        alert('Thêm HDN thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }

    $scope.listNCC = [];
    $scope.LoadNCC = function () {	  
        let obj =  {
            page: "1",
            pageSize: "50"
        };
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/NhaCungCap/get-NCC',
        }).then(function (response) {	
            $scope.listNCC = response.data.data;
            console.log($scope.listSanPham);
        });
    };  
    $scope.LoadNCC();


    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/HoaDonNhap/xoa-HDN/' + ma,
            }).then(function (response) {
                $scope.LoadHDN();
                alert('Xóa thành công!');
            });
        } 
    };

     
    $scope.CreateCT = function (){
        var CTHDN = {
            maSanPham: $scope.maSanPham,
            soLuong: $scope.soLuong,
            giaTien : $scope.giaTien
        }
        console.log(CTHDN);
        var list = sessionStorage.getItem('listjson_HDN');
        if (list == null) {
            list = [CTHDN];
        } else {
            list = JSON.parse(list) || [];
            list.push(CTHDN);
        }
        sessionStorage.setItem('listjson_HDN', JSON.stringify(list));

        $scope.maSanPham = '';
        $scope.soLuong = '';
        $scope.giaTien ='';
        $scope.LoadCTHDN();
        
    }

    $scope.XoaCT = function (maSanPham){
        var list = JSON.parse(sessionStorage.getItem('listjson_HDN')) || [];
        for (var i = 0; i < list.length; i++) {
            if(list[i].maSanPham == maSanPham){
                list.splice(i, 1);
            }
        }
        sessionStorage.setItem('listjson_HDN', JSON.stringify(list));
        $scope.LoadCTHDN();
    }

    // hiển thị nên 
    $scope.listCTHDN;
    $scope.LoadCTHDN =function (){
        $scope.listCTHDN = [];
            let list = JSON.parse(sessionStorage.getItem('listjson_HDN'));

            if(list != null){
                for(var i = 0; i < list.length; i++) {
                    $scope.listCTHDN.push({
                        maSanPham:list[i].maSanPham,
                        soLuong: list[i].soLuong,
                        giaTien:list[i].giaTien,
                    })
                }
            }
    }


    $scope.CTHDN = function(ma){
        $http({
            method:'GET',
            headers:{ "Authorization": 'Bearer ' + _user.token},
            url:  Admin_current_url +  '/api/HoaDonNhap/Get-theo-ma/' + ma,

        }).then(function(response){
            let ct = response.data;
            $scope.listChiTietHDN = ct.listjson_HDN;
        })
    }





    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});