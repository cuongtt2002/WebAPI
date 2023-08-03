var app = angular.module('AppBanHang', []);
app.controller("ThuongHieuCtrl", function ($scope, $http) {

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


    $scope.listthuonghieu //danh sachs san pham
    $scope.Loadthuonghieu = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/ThuongHieu/get-all/',
        }).then(function (response) {			 
            $scope.listthuonghieu= response.data;       
        });
    };
    $scope.Loadthuonghieu();  
    //Sản phẩm  theo thương hiệu 

    $scope.listSPtheoTH; 
    $scope.pageSize="3";   
    $scope.LoadSPtheoTH = function () {	
        
        var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        obj.maThuongHieu= value;
        $http({
            method: 'POST', 
            data: obj, 
            url: current_url + '/api/Home/search-san-pham',
        }).then(function (response) {	
            $scope.listSPtheoTH = response.data.data;
            console.log($scope.listSPtheoTH);
        });
    };  
    $scope.LoadSPtheoTH();     

    //Tìm kiếm sản phẩm 

    $scope.nuttimkiem = function(timkiem){
        console.log(timkiem);
        window.location.href = 'sanpham.html?tensanpham=' + timkiem;
    };   

   
    // Hàm thêm sản phẩm vào giỏ hàng 
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
   


    // hàm đếm số lượng giỏ hàng
    $scope.demsoluong= function(){
        $scope.soluongdamua = 0 ;
       var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
       for (let x of danhachsanpham) {
           $scope.soluongdamua += x.soLuong;

       }
    }
    $scope.demsoluong();

    
    
});

