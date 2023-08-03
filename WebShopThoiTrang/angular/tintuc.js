var app = angular.module('AppBanHang', ['ui.bootstrap']);
app.controller("tintucCtrl", function ($scope, $http) {

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

       $scope.currentPage = 1;
       $scope.itemsPerPage = 2;
       $scope.listTinTuc
       $scope.LoadTinTuc = function () {		 
           $http({
               method: 'GET', 
               url: current_url + '/api/TinTuc/get--tin-tuc/',
           }).then(function (response) {			 
               $scope.listTinTuc= response.data;     
           });
       };
       $scope.LoadTinTuc(); 

    
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



    // chi tiết tin tức 
    $scope.tintuc;  
    $scope.LoadTinTucbyID = function () { 
		var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'GET', 
            url: current_url + '/api/TinTuc/get-ById/'+value,
        }).then(function (response) { 
            $scope.tintuc = response.data;

        });
    }; 
    $scope.LoadTinTucbyID();


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

