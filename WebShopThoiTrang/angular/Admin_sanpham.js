var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminSanPhamCtrl", function ($scope, $http) {
    $scope.taomoi = function (){ //khi nhấn nút tạo mới các giá trị sẽ trả về rỗng
        $scope.btnText = "Thêm"
        $scope.tenSP = "";
        $scope.moTa = "";
        $scope.size ="";
        $scope.maLoaiSanPham ="";
        $scope.maThuongHieu ="";
        $scope.anhDaiDien ="";
        $scope.listjson_thongso ="";
        sessionStorage.removeItem('listjson_thongso');
        $scope.LoadTS();

    }

    $scope.listdata; 
    $scope.pageSize = 5;
    $scope.currentPage = 1;
    $scope.totalPages = 1;   
    $scope.LoadSanPham = function () {	  
        let obj =  {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/SanPham/timKiem-sanpham',
        }).then(function (response) {	
            $scope.listdata = response.data.data;
            $scope.totalPages = Math.ceil(response.data.totalItems/ $scope.pageSize);
            console.log($scope.listdata);
        });
    };  
    $scope.setPage = function (page) {
        if (page < 1 || page > $scope.totalPages) {
            return;
        }
        $scope.currentPage = page;
        if ($scope.currentPage === $scope.totalPages && $scope.listdata.length === 0) {
            $scope.currentPage = 1;
        }
        $scope.LoadSanPham();
    };    
    $scope.LoadSanPham();


    //hiển thị thông số cuatr sản phẩm 
    $scope.TS = function(ma){
        $http({
            method:'GET',
            headers:{ "Authorization": 'Bearer ' + _user.token},
            url:  Admin_current_url + '/api/SanPham/Get-theo-ma/' + ma,

        }).then(function(response){
            let ts = response.data;
            $scope.listTS = ts.listjson_thongso;
        })
    }


    //đổ ra loại sản phẩm 
	$scope.listloai; 
    $scope.LoadLoai = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize ="50" ;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/LoaiSanPham/get-loai' ,
        }).then(function (response) {	
            $scope.listloai = response.data.data;
            console.log($scope.listdata);
        });
    };  
    $scope.LoadLoai();

    // đổ ra các thương hiệu
    $scope.listTH; 
    $scope.LoadThuongHieu = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize ="50" ;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/ThuongHieu/search-thuonghieu' ,
        }).then(function (response) {	
            $scope.listTH = response.data.data;
            console.log($scope.listdata);
        });
    };  
    $scope.LoadThuongHieu();

     //Lấy về một bản ghi 
     $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        sessionStorage.removeItem('listjson_thongso');
        $scope.LoadTS();
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/SanPham/Get-theo-ma/' + ma,
        }).then(function (response) {
            let sanpham = response.data;
            $scope.maSanPham = sanpham.maSanPham;
            $scope.tenSP= sanpham.tenSP;
            $scope.moTa = sanpham.moTa;
            $scope.ngayTao = sanpham.ngayTao;
            $scope.size = sanpham.size;
            $scope.maLoaiSanPham = sanpham.maLoaiSanPham;
            $scope.maThuongHieu = sanpham.maThuongHieu;
            $scope.anhDaiDien = sanpham.anhDaiDien;
            $scope.listthongso = sanpham.listjson_thongso;
            console.log(sanpham);

            for(var i = 0; i < $scope.listthongso.length; i++)
            {
                var list = sessionStorage.getItem('listjson_thongso');
                if (list == null) {
                    list = [$scope.listthongso[i]];
                } else {
                    list = JSON.parse(list) || [];
                    list.push($scope.listthongso[i]);
                }
                sessionStorage.setItem('listjson_thongso', JSON.stringify(list));
              
            }
        });

    }

    // hàm thêm sửa 
    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maSanPham = $scope.maSanPham;
        obj.tenSP = $scope.tenSP;
        obj.moTa = $scope.moTa;
        obj.size = $scope.size;
        obj.maLoaiSanPham= $scope.maLoaiSanPham;
        obj.maThuongHieu = $scope.maThuongHieu;
        obj.listjson_thongso = $scope.listthongso;
        var file = document.getElementById('file').files[0];

        if(file)
        {
            const formData = new FormData();
            formData.append('file', file);

            $http({
                method: 'POST',
                headers: {
                    "Authorization": 'Bearer ' + _user.token,
                    'Content-Type': undefined
                },
                data: formData,
                url:  Admin_current_url + '/api/SanPham/upload',
            }).then(function (res) {

                obj.anhDaiDien = res.data.filePath;

                if($scope.btnText == "Thêm")
                {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/SanPham/Them-SanPham',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Thêm sản phẩm thành công!');
                    });
                }
                else
                {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/SanPham/Cap-nhat-SanPham',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Sửa sản phẩm thành công!');
                    });
                }
            });
        }
        else
        {
            obj.anhDaiDien = $scope.anhDaiDien;

            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/SanPham/Them-SanPham',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Thêm sản phẩm  thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url +  '/api/SanPham/Cap-nhat-SanPham',
                    }).then(function (response) {
                        $scope.LoadSanPham();
                        alert('Sửa sản phẩm thành công!');
                    });
            }
        }
        $("#exampleModal").modal("hide");
    }

    // hàm thêm thông số 
    
    $scope.CreateCT = function (){
        var TS = {
            tenThongSo: $scope.tenThongSo,
            moTaThongTin: $scope.moTaThongTin,
        }
        console.log(TS);
        var list = sessionStorage.getItem('listjson_thongso');
        if (list == null) {
            list = [TS];
        } else {
            list = JSON.parse(list) || [];//Nếu đã có danh sách thông số trong sessionStorage thì chuyển danh sách thành một mảng JavaScript 
            list.push(TS);//bằng cách gọi hàm JSON.parse() và đưa đối tượng TS vào danh sách này bằng cách sử dụng hàm mảng push().
        }
        sessionStorage.setItem('listjson_thongso', JSON.stringify(list));

        $scope.tenThongSo = '';
        $scope.moTaThongTin = '';
        $scope.LoadTS();
        
    }

     // hiển thị nên 
     $scope.listthongso;
     $scope.LoadTS = function (){
         $scope.listthongso = [];
             let list = JSON.parse(sessionStorage.getItem('listjson_thongso'));
 
             if(list != null){
                 for(var i = 0; i < list.length; i++) {
                     $scope.listthongso.push({
                         tenThongSo:list[i].tenThongSo,
                         moTaThongTin: list[i].moTaThongTin,
                     })
                 }
             }
     }
    $scope.LoadTS();


    // xóa thông số 
    $scope.XoaTS = function (tenThongSo){
        var list = JSON.parse(sessionStorage.getItem('listjson_thongso')) || [];
        for (var i = 0; i < list.length; i++) {
            if(list[i].tenThongSo == tenThongSo){
                list.splice(i, 1);
            }
        }
        sessionStorage.setItem('listjson_thongso', JSON.stringify(list));
        $scope.LoadTS();
    }

    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/SanPham/xoa-sanpham/' + ma,
            }).then(function (response) {
                $scope.LoadSanPham();
                alert('Xóa thành công!');
            });
        } 
    };


     // Người dùng --------------------------------------
     $scope.hoTen = _user.hoten;
     $scope.anhDaiDien = _user.anhdaidien;
});