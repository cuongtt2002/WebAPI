var app = angular.module('AppBanHang', []);
app.controller("LienHeCtrl", function ($scope, $http) {

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

    $scope.listlienhe //danh sachs san pham
    $scope.Loadlienhe = function () {		 // ham lay ra  
        $http({
            method: 'GET', 
            url: current_url + '/api/LienHe/get-all/',
        }).then(function (response) {			 
            $scope.listlienhe= response.data;     
        });
    };
    $scope.Loadlienhe();  

   


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

