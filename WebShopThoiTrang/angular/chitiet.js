var app = angular.module('AppBanHang', []);
app.controller("ChitietCtrl", function ($scope, $http) {

    //Menu
    $scope.Menu  //danh sachs san pham
    $scope.LoadMenu = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/Menu/get-all/',
        }).then(function (response) {			 
            $scope.Menu= response.data;     
        });
    };
    $scope.LoadMenu();  


    //Chi tiết sản phẩm
    $scope.sanpham;  
    $scope.LoadSanPhambyID = function () { 
		var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'GET', 
            url: current_url + '/api/SanPham/get-ById/'+value,
        }).then(function (response) { 
            $scope.sanpham = response.data;
            $scope.thongso = response.data.listjson_thongso;
           
        });
    }; 
    $scope.LoadSanPhambyID();




    $scope.listloaisp //danh sachs san pham
    $scope.Loadloaisp = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/LoaiSanPham/get-all/',
        }).then(function (response) {			 
            $scope.listloaisp= response.data;       
        });
    };
    $scope.Loadloaisp();  



    $scope.Themvaogio = function(s,soluong){
        console.log("test");
        var sanpham = {
            maSanPham: s.maSanPham,
            tenSP:s.tenSP,
            anhDaiDien :s.anhDaiDien

        }
        if(s.giaMoiKhiGiam == 0){
            sanpham.giaTien = s.donGia;

        }
        else{
            sanpham.giaTien = s.giaMoiKhiGiam;
        }
        console.log(sanpham);
        var danhachsanpham = null;
        sanpham.soLuong= soluong;       
        var danhachsanpham;
        if (localStorage.getItem('cart') == null) {
            danhachsanpham = [sanpham];
        } else {
            danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];

            let ok = true;
            for (let x of danhachsanpham) {
                if (x.maSanPham == sanpham.maSanPham) {
                    x.soLuong += soluong;
                    ok = false;
                    break;
                }
            }
            if (ok) {
                danhachsanpham.push(sanpham);
            
            }


        }
        localStorage.setItem('cart', JSON.stringify(danhachsanpham));
        alert("Đã thêm giỏ hàng thành công!");
        $scope.demsoluong();
        
    }

    $scope.demsoluong= function(){
        $scope.soluongdamua = 0 ;
       var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
       for (let x of danhachsanpham) {
           $scope.soluongdamua += x.soLuong;

       }
    }
    $scope.demsoluong();
    
   

    
    
});

