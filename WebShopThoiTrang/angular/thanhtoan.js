var app = angular.module('AppBanHang', []);
app.controller("ThanhTtoanCtrl", function ($scope, $http) {
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

    $scope.TongTien = function(){
        $scope.luutongtien = 0;
        var  danhachsanpham = JSON.parse(localStorage.getItem('cart')) || [];
        for (var i = 0 ; i < danhachsanpham.length ; i++) {
           var tongtien1sp = danhachsanpham[i].giaTien *  danhachsanpham[i].soLuong;
           $scope.luutongtien += tongtien1sp;
 
        }
    }
    $scope.TongTien();

    $scope.KiemTraThongTin = function(){
            if($scope.TenKH == null || $scope.Email == null || $scope.DiaChi == null || $scope.SDT == null || $scope.TenKH == '' || $scope.Email == '' || $scope.DiaChi == '' || $scope.SDT == ''){
                alert('Vui lòng nhập đầy đủ thông tin');
                return false;
            }
            else{
                return true;
            }
    }

   //Thanh toán
   $scope.ThanhToan = function(){
    if($scope.KiemTraThongTin() == true){
        var obj = {};
        obj.objectjson_khach = {};
        obj.objectjson_khach.TenKhachHang= $scope.TenKH ,
        obj.objectjson_khach.DiaChi = $scope.DiaChi,
        obj.objectjson_khach.SoDienThoai = $scope.SDT,
        obj.objectjson_khach.Email = $scope.Email


        obj.listjson_chitietdonhang = [];
        let danhachsanpham = JSON.parse(localStorage.getItem('cart'));
     
        for(var i = 0; i < danhachsanpham.length; i++) {
            obj.listjson_chitietdonhang.push({
                MaSanPham:danhachsanpham[i].maSanPham, 
                SoLuong: danhachsanpham[i].soLuong,
                GiaTien: danhachsanpham[i].giaTien
            })
        }
        $http({
            method: 'POST', 
            data: obj, 
            url: current_url + '/api/DonHang/create-donhang',
        }).then(function (response) {	
            alert('Thanh toán thành công, cảm ơn quý khách đã tin tưởng sản phẩm của shop');
            localStorage.removeItem('cart');
            window.location.href = 'index.html';
        });
    }
}
    

});