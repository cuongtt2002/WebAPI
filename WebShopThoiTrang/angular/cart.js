var app = angular.module('AppBanHang', []);
app.controller("CartCtrl", function ($scope, $http) {

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

    $scope.demsoluong= function(){
        $scope.soluongdamua = 0 ;
       var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
       for (let x of danhachsanpham) {
           $scope.soluongdamua += x.soLuong;

       }
    }
    $scope.demsoluong();

    $scope.hienthigiohang = function(){
        $scope.danhachsanphamgiohang = JSON.parse(localStorage.getItem('cart'));
    }
    $scope.hienthigiohang();

    $scope.TongTien = function(){
        $scope.luutongtien = 0;
        var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
        for (var i = 0 ; i < danhachsanpham.length ; i++) {
           var tongtien1sp = danhachsanpham[i].giaTien *  danhachsanpham[i].soLuong;
           $scope.luutongtien += tongtien1sp;
 
        }
    }
    $scope.TongTien();

    $scope.Tangsoluong= function(s){
        var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
        for (let x of danhachsanpham) {
           if(x.maSanPham == s.maSanPham) {
             x.soLuong += 1;
             break;

           }
 
        }
        localStorage.setItem('cart', JSON.stringify(danhachsanpham));// lưu vào   localStorage
        $scope.hienthigiohang();
        $scope.TongTien();
        $scope.demsoluong();
        
    }
    $scope.Giamsoluong= function(s){
        var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
        for (var i = 0 ; i < danhachsanpham.length ;i++) {
           if(danhachsanpham[i].maSanPham == s.maSanPham) {
             danhachsanpham[i].soLuong -= 1;
            if(danhachsanpham[i].soLuong == 0){
                danhachsanpham.splice(i,1);
            }
             break;

           }
 
        }
        localStorage.setItem('cart', JSON.stringify(danhachsanpham));// lưu vào   localStorage
        $scope.hienthigiohang();
        $scope.TongTien();
        $scope.demsoluong();
        
    }

    $scope.xoatatca = function(){
        localStorage.removeItem('cart');
        $scope.hienthigiohang();
        $scope.TongTien();
        $scope.demsoluong();

    }

    $scope.xoa1sp = function(s){
        var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
        for (var i = 0 ; i < danhachsanpham.length ;i++) {
           if(danhachsanpham[i].maSanPham == s.maSanPham) {
                danhachsanpham.splice(i,1);
           }
 
        }
        localStorage.setItem('cart', JSON.stringify(danhachsanpham));// lưu vào   localStorage
        $scope.hienthigiohang();
        $scope.TongTien();
        $scope.demsoluong();
    }


    $scope.dathang = function(){
        if($scope.soluongdamua == 0){
            alert("chưa có sản phẩm trong giỏ ");
            window.location.href='giohang.html'
        }
        else(
            window.location.href ='dathang.html'
        )
    }
    


    



});