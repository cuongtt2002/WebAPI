 var app = angular.module('AppBanHang', []);
app.controller("HomeCtrl", function ($scope, $http) {

    //Sản phẩm mới
    $scope.listSanPhamMoi;  
    $scope.LoadSanPhamMoi = function () {		 
        $http({
            method: 'GET', 
            url: current_url + '/api/Home/san-pham-moi/10',
        }).then(function (response) {			 
            $scope.listSanPhamMoi = response.data;            
        });
    };
    $scope.LoadSanPhamMoi();  

    //Sản phẩm bán chạy

    $scope.listSanPhamBanChay;  //danh sachs san pham
    $scope.LoadSanPhamBanChay = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/Home/san-pham-ban-chay/10',
        }).then(function (response) {			 
            $scope.listSanPhamBanChay = response.data;            
        });
    };
    $scope.LoadSanPhamBanChay();  


    //Sản phẩm giảm giá

    $scope.listSanPhamGiamGia;  //danh sachs san pham
    $scope.LoadSanPhamGiamGia = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/Home/san-pham-giam-gia/15',
        }).then(function (response) {			 
            $scope.listSanPhamGiamGia = response.data;            
        });
    };
    $scope.LoadSanPhamGiamGia();  



    //Menu
    $scope.Menu 
    $scope.LoadMenu = function () {	
        $http({
            method: 'GET', 
            url: current_url + '/api/Menu/get-all/',
        }).then(function (response) {			 
            $scope.Menu= response.data;     
        });
    };
    $scope.LoadMenu();  

     //giới thiệu 
    $scope.listGioiThieu 
    $scope.loadGioiThieu = function(){
        $http({
            method: 'GET', 
            url: current_url + '/api/GioiThieu/get-all/',
        }).then(function (response) {			 
            $scope.listGioiThieu= response.data;   
           
        });
    };
    $scope.loadGioiThieu();

    $scope.nuttimkiem = function(timkiem){
        console.log(timkiem);
        window.location.href = 'sanpham.html?tensanpham=' + timkiem;
    };   
    
    


    $scope.Themvaogio = function(s){
        console.log(s);
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
        sanpham.soLuong= 1;       
        var danhachsanpham;
        if (localStorage.getItem('cart') == null) {
            danhachsanpham = [sanpham];
        } else {
            danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];

            let ok = true;
            for (let x of danhachsanpham) {
                if (x.maSanPham == sanpham.maSanPham) {
                    x.soLuong += 1;
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

