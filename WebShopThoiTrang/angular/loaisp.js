var app = angular.module('AppBanHang', []);
app.controller("LoaiSanPhamCtrl", function ($scope, $http) {

   
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
 
    

     $scope.listloaisp //danh sachs san pham
     $scope.Loadloaisp = function () {		 // ham lay ra  
         $http({
             method: 'GET', 
             url: current_url + '/api/LoaiSanPham/get-all/',
         }).then(function (response) {			
             $scope.listloaisp= response.data;  
             console.log($scope.listloaisp);     
         });
     };
     $scope.Loadloaisp();  
 
     //Lấy sản phẩm theo loại sản phẩm 
     $scope.listSPtheoloai; 
     $scope.pageSize = "3";  
     $scope.LoadSPtheoloai = function () {	
         var urlParams = new URLSearchParams(window.location.search);
         var ma = urlParams.get('id');
         let obj =  {};
         obj.page = "1";
         obj.pageSize = $scope.pageSize;
         obj.maLoaiSanPham = ma;
         $http({
             method: 'POST', 
             data: obj, 
             url: current_url + '/api/Home/search-san-pham',
         }).then(function (response) {	
             $scope.listSPtheoloai = response.data.data;
             console.log($scope.listSPtheoloai);
         });
     };  
     $scope.LoadSPtheoloai();
   

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

