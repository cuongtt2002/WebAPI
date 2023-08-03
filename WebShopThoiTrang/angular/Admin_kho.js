var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminKhoCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.tenKho = "";
        $scope.diaChi = "";
        $scope.listjson_kho ="";
        sessionStorage.removeItem('listjson_kho');
        $scope.LoadCTkho();
    }

    
    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        sessionStorage.removeItem('listjson_kho');
        $scope.LoadCTkho();
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/Kho/GetById/' + ma,
        }).then(function (response) {
            let kho = response.data;
            $scope.maKho = kho.maKho;
            $scope.tenKho = kho.tenKho;
            $scope.diaChi = kho.diaChi;

            $scope.listCTkho = kho.listjson_kho;

            for(var i = 0; i < $scope.listCTkho.length; i++)
            {
                var list = sessionStorage.getItem('listjson_kho');
                if (list == null) {
                    list = [$scope.listCTkho[i]];
                } else {
                    list = JSON.parse(list) || [];
                    list.push($scope.listCTkho[i]);
                }
                sessionStorage.setItem('listjson_kho', JSON.stringify(list));
            }
        });
    }

    //--------------------------------------------------------Lấy tất cả kho -----------------------------------------------------------------------
	$scope.listkho; 
    $scope.pageSize = "20";   
    $scope.Loadkho = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/Kho/get-kho',
        }).then(function (response) {	
            $scope.listkho = response.data.data;
        });
    };  
    $scope.Loadkho();

    //-------------------------------------láy sản phẩm -----------------------------------------------------------
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

    //Chi tiết kho ------------------------------------------------------------------------------------------------------------
    $scope.ctkho = function(ma){
        $http({
            method:'GET',
            headers:{ "Authorization": 'Bearer ' + _user.token},
            url:  Admin_current_url + '/api/Kho/GetById/'+ ma,

        }).then(function(response){
            let ct = response.data;
            $scope.listChiTietkho = ct.listjson_kho;
            console.log($scope.listChiTietkho);
        })
    }

    //-------------------------------- thêm CT kho 
    $scope.CreateCT = function (){
        var CTKho = {
            maSanPham: $scope.maSanPham,
            soLuong: $scope.soLuong,
        }
        console.log(CTKho);

        var list = sessionStorage.getItem('listjson_kho');
        if (list == null) {
            list = [CTKho];
        } else {
            list = JSON.parse(list) || [];
            list.push(CTKho);
        }
        sessionStorage.setItem('listjson_kho', JSON.stringify(list));

        $scope.maSanPham = '';
        $scope.soLuong = '';
        $scope.LoadCTkho();
        
    }

    $scope.XoaCT = function (maSanPham){
        var list = JSON.parse(sessionStorage.getItem('listjson_kho')) || [];
        for (var i = 0; i < list.length; i++) {
            if(list[i].maSanPham == maSanPham){
                list.splice(i, 1);
            }
        }
        sessionStorage.setItem('listjson_kho', JSON.stringify(list));
        $scope.LoadCTkho();
    }

    // hiển thị nên 
    $scope.listCTkho;
    $scope.LoadCTkho = function (){
        $scope.listCTkho = [];
            let list = JSON.parse(sessionStorage.getItem('listjson_kho'));

            if(list != null){
                for(var i = 0; i < list.length; i++) {
                    $scope.listCTkho.push({
                        maSanPham:list[i].maSanPham,
                        soLuong: list[i].soLuong,
                    })
                }
            }
            console.log($scope.listCTkho);
    }
    $scope.LoadCTkho();
     //Viết hàm thêm / sửa liên hệ 
     $scope.CreateUpdate = function () {
        let obj = {};
        obj.maKho = $scope.maKho;
        obj.tenKho = $scope.tenKho;
        obj.diaChi = $scope.diaChi;
        obj.listjson_kho = $scope.listCTkho;
            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/Kho/Them-kho',
                    }).then(function (response) {
                        $scope.Loadkho();
                        alert('Thêm kho  thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/Kho/sua-kho',
                    }).then(function (response) {
                        $scope.Loadkho();
                        alert('Sửa kho thành công!');
                    });
            }
        $("#exampleModal").modal("hide");
    }

 //--------------------------------------xóa kho -----------------------------------------------------------------
    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/Kho/xoa-kho/' + ma,
            }).then(function (response) {
                $scope.Loadkho();
                alert('Xóa thành công!');
            });
        } 
    };
});