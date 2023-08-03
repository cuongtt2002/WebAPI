var app = angular.module('AppBanHang',['ui.bootstrap']);
app.controller("SanPhamCtrl", function ($scope, $http) {
    //lấy ra các sản phẩm trong trang sản phẩm 
    $scope.listSanPhamSearch ;
    $scope.pageSize = "30";  
    $scope.ten;
    $scope.LoadSP = function () {	
        var urlParams = new URLSearchParams(window.location.search);
        var ten = urlParams.get('tensanpham');
        decodeURI(ten);
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        if(ten !== 'undefined'){
            $scope.ten= ten;
            obj.tenSP = ten;
        }
        else
        {
            if(ten === 'undefined' || ten === null){
                window.location.href='index.html';
            }
        }
        $http({
            method: 'POST', 
            data: obj, 
            url: current_url + '/api/Home/search-san-pham',
        }).then(function (response) {	
            $scope.listSanPhamSearch = response.data.data;
            console.log($scope.listSanPhamSearch);
        });
    };  
    $scope.LoadSP();
    


    // Hàm lấy ra tất cả Menu 
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

