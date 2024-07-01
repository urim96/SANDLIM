
function kakaoLogout(){
   window.history.forward();
   location.href="/kakaoLogout.do";
   let ifr = document.createElement("iframe");
   ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
   ifr.setAttribute("style","display:none");
   document.body.appendChild(ifr);
   
}

var newWindow;
function naverLogout() {
    newWindow = window.open('https://nid.naver.com/nidlogin.logout?returl=https://www.naver.com/', '_blank');
    
    $.ajax({
       url : "naverLogout.do",
       type : "GET",
       success : function(res){
          winPopupClose();
          window.location.href = "/main.jsp";
       },
       err : function(err){
       }
       
    });

}

function winPopupClose(){
   newWindow.close();
}

function logout() {

  window.history.forward();
  location.href="logout.do";
}

//베스트메뉴 띄우기
$(document).ready(function(){ 
	let m_sel = "베스트";
      $.ajax({
         url : "bestmenu.san",
         data : {"m_sel": m_sel },
         method : "POST",
         success : function(data){
            $('#cardall2').empty(); 
            values = data.bestList;
            $.each(values, function(index, value){
				$("#cardall2").append(
                    `
                    <div class=" slide">
                    <div class="card1 train-card">
                    <div class="col-lg-3 col-md-6 col-sm-10 mdcard"> 
                    <div class="card">
                        <img class="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}">
                        <div class="card-body" style="text-align: center;">
                           <h6 class="card-title2">${value.m_name}</h6>
                        </div>
                        </div>
                    </div></div></div>`
  );
				$("#cardall3").append(
                    `
                    <div class=" slide">
                    <div class="card1 train-card">
                    <div class="col-lg-3 col-md-6 col-sm-10 mdcard"> 
                    <div class="card">
                        <img class="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}">
                        <div class="card-body" style="text-align: center;">
                            <h6 class="card-title2">${value.m_name}</h6>
                        </div>
                        </div>
                    </div></div></div>`
  );
			});
         	
         },
         error :  function(request, status){
         alert(실패);
         }
      });
	});

//전자영수증
function paymo(val) {
   let orderNo = val;
   let value = {
      o_no : orderNo
   }
   $.ajax({
      url : "receipt.san",
      type : "POST",
      data : value,
      success : function(data) {
         let o_no = data.o_no;
         $("#addressH2").text("");
         $("#adhs2").css("display" ,"none");
         
         if(data.o_address != ''){
         $("#adhs2").css("display", "block");
         $("#addressH2").text("주소: "+data.o_address);               
         }
         
          o_no = o_no.substring("merchant_".length);
          $("#o_noP2").text(o_no); // 주문번호
          $("#spanNumber").text(o_no);
          let o_name = data.o_name; // 상품 명
          let o_total = data.o_total; // 주문 갯수의 총 가격
          let o_num = data.o_num; // 주문 갯수 각각의
          let o_size = data.o_size; // tall grande
          let o_option = data.o_option; // hot ice
          let o_eachPrice = data.o_eachprice; // 상품의 1개당 가격
          let o_toprice = data.o_toprice; // 총 금액
          let o_toprice2 = data.o_toprice; // 총 금액
          o_toprice2 = parseInt(o_toprice2); // 총 금액
          o_toprice = parseInt(o_toprice); // 총 금액
          let o_usePoint = data.o_usepoint;  // 사용 포인트
          o_usePoint = parseInt(o_usePoint); // 사용 포인트
          o_usePoint2 = parseInt(o_usePoint); // 사용 포인트
          let o_savePoint = data.o_savepoint;
          let totalPayPrice = o_toprice - o_usePoint; // 결제 금액 총 금액 - 포인트 금액
          console.log("첫 금액 결제액 - 포인트 :" + totalPayPrice);
          let o_delivery = data.o_delivery; 
          let o_date = data.o_date;
          o_toprice = o_toprice.toLocaleString();  // 총금액 => 배달비 뺀 가격
          o_usePoint = o_usePoint.toLocaleString(); // 사용 포인트
          o_delivery = parseInt(o_delivery); // 배달 비용
          
          let each_name = o_name.split(',');
          let each_num = o_num.split(','); // 갯수
          let each_size = o_size.split(','); // tall/ grande
          let each_option = o_option.split(','); // hot/ ice
          let each_total = o_total.split('원,'); // 개당 가격
          let each_eachPrice = o_eachPrice.split('원,');
          let table = "";
          $("#table_tbody").empty(); // 기존 테이블 데이터 삭제
          for(let i =0 ; i < each_num.length ; i++){
             
             // 상품이름, 기존가격, 갯수 , 총 가격
             table += "<tr><td>"+each_name[i]+"</td><td class='option_margin'>"+each_option[i]+"</td><td>"+each_size[i]+"</td><td>"+each_eachPrice[i]+"원</td><td>"+each_num[i]+"</td><td>"+each_total[i]+"원</td></tr>"
          }
          if(o_delivery === 3000){
             $("#deliveryblock").css("display", "block");
             $("#delivery").text("+3,000원");
             if(o_usePoint2 <= 0){
             o_toprice_2 = o_toprice2 + 3000;  // => 포인트를 뺀 총 금액과 배달비 합친 가격
             console.log("o_toprice_2 배달비 3000원 있을때 포인트 미사용 : " + o_toprice_2);
             o_toprice_2 = o_toprice_2.toLocaleString();
             $("#span_totalPayPrice").text(o_toprice_2+"원");
             }else if(o_usePoint2 > 0){
                let o_toprice2_2 = totalPayPrice + 3000;
                console.log("포인트 사용하고 배달비 있을때 " + o_toprice2_2);
                o_toprice2_2 = o_toprice2_2.toLocaleString();
                 $("#span_totalPayPrice").text(o_toprice2_2+"원");
             }
          }else{
             if(o_usePoint2 <= 0){
             let o_toprice_3 = o_toprice2.toLocaleString(); // 포인트를 뺀 가격
             console.log("포인트 사용 안하고 배달안함: " + o_toprice_3);
             $("#span_totalPayPrice").text(o_toprice_3+"원");
             }else if(o_usePoint2 > 0){
             let o_toprice2_2 = totalPayPrice.toLocaleString();
             console.log("포인트 사용하고 배달안함: " + o_toprice2_2);
             $("#span_totalPayPrice").text(o_toprice2_2+"원");
             }
          }
          o_savePoint = o_savePoint.toLocaleString();
          $("#table_tbody").append(table);
          $("#span_totalPrice").text(o_toprice+"원");
          $("#span_usePoint").text(o_usePoint+"원");
          $("#span_savePoint").text(o_savePoint+"원");
          $("#orderDate").text(o_date);
       },error: function(){
          alert("실패");
       }
   });
}

//나의 전체 주문내역 날짜 검색
   function odAllDate(){
      let o_odAllDate = $("#odAllListDate").val();
      
      if(o_odAllDate == "" || o_odAllDate == null ){
         alert("검색날짜를 입력 해주세요");
      }else{
      let value = {
            o_date : o_odAllDate
      }
      
      $.ajax({
         url : "odAllListDate.san",
         type : "POST",
         data : value,
         success: function(data){
               let date = data.odAllList;
               let odAllListDa = "";
               $("#tbodyodAll").empty();
               $.each(date, function(index, item){
                  odAllListDa += "<tr><td>" + item.o_date + "</td><td>" + item.o_name.split(',')[0].trim()+'...' + "</td><td>" + item.o_toprice + "</td><td><button type='button' class='btn' data-toggle='modal' data-target='#payModal' onclick='paymo(\"" + item.o_no + "\")'>전자영수증</button></td><td>" + item.o_state + "</td></tr>";
               });
                  $("#tbodyodAll").append(odAllListDa);
                  $("#pagediv").empty();
         },error: function(){
            alert("실패");
         }
      });
      }
   }

// 관리자 : 메뉴 추가	
$(document).ready(function(){ 
	$("#mdinsert").click(function(){
		location.href = "insert.san";
	});
	


//관리자 : 메뉴 삭제	
	$("#mddelete").click(function(){
		let delNo = document.getElementById("no_input").value;
			if(confirm("메뉴 상태를 판매 종료로 변경하시겠습니까?")){
				location.href = "deleteMd.san?m_no="+delNo;
		}else {
				location.href = "adminMd.san";
		}
		});
	
//관리자 : 메뉴 추가 페이지에서 메뉴 목록 불러오기 
	$("#mdList").click(function(){
		location.href = "adminMd.san";
	});

// 장바구니 토탈 가격 	
	$("#total").on("change", function() {

         let cnt = $("#total").val();
         let price = $("#getPrice").val();
         price = price.replace("원", "");
         
         price = price * cnt;

         $("#totalprice").val(price + "원");
      });
});  

//관리자 결제 취소 
function cancelPayment(merchant_uid, state, save, o_id, use){
      let mid = merchant_uid;   
      let o_state = state;
      let savePoint = save;
      let id = o_id;
      let usePoint = use;
      let answer = confirm('해당 내역을 취소하시겠습니까?');
      if(answer == true){   
      $.ajax({
         url : "paycan",
         data : {"mid": mid , "state" : o_state, "point" : savePoint, "id" : id, "usePoint" : usePoint},
         method : "POST",
         success : function(val){
            if(val==1){
               alert("취소 완료");
            //   $("#all_module_${val.o_no}").trigger("click");
            }
            else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
         },
         error :  function(request, status){
            alert("취소가 실패하였습니다.");
         }
      });
      }
}

//회원용 결제 취소 (사용 포인트 다시 합쳐주기)
function userCancel(o_no, o_id, o_usepoint, o_state){
		    let answer = confirm('주문을 취소하시겠습니까?');
		 if(answer == true){	
		$.ajax({
			url : "userPaycan",
			data : {
			"mid": o_no,
			"o_id": o_id,
			"o_usepoint" : o_usepoint,
			"o_state" : o_state
			},
			method : "POST",
			success : function(val){
				if(val==1){
					alert("주문이 취소되었습니다.");
					location.href="odMyList.san"; 
				//	$("#all_module_${val.o_no}").trigger("click");
				}
				else alert("주문이 진행중입니다. \n 취소를 원하시면 매장에 문의 부탁드립니다.");
			},
			error :  function(request, status){
				alert("주문 취소에 실패하였습니다. \n 매장으로 문의 부탁드립니다.");
			}
		});
		}
	}
//리뷰 등록 클릭 시 모달 
$(document).on("click", ".review", function () {
    var o_no = $(this).val();
    let val = { o_no : o_no,
	};
  	 $.ajax({
       url: "getinsertReview.san", 
       type: "GET", 
       data: val, 
       success: function(response) { 
              $("#rewo_no").val(response.o_no);
              $("#rewb_title").val(response.o_name);
       },
       error: function(xhr, status, error) { 
       }
   });
   });

// 관리자 : 수정하기 클릭 시 그 메뉴에 해당하는 정보 끌고오는 함수 
$(document).on("click", ".modify", function () {
    var m_no = $(this).val();
    let val = { m_no : m_no };
  	 $.ajax({
       url: "upgetMd.san", 
       type: "GET", 
       data: val, 
       success: function(response) { 

              $("#no_input").val(response.m_no);
              $("#img_input").attr("src", "/resources/img/"+ response.m_img);
              $("#img_input").attr("title", response.m_name);
              $("#img_input").attr("alt", response.m_name);
              $("#img2_input").val(response.m_img);
              $("#name_input").val(response.m_name);
              $("#price_input").val(response.m_price);
              $("#content_input").val(response.m_content);
              $("#keyword_input").val(response.m_kind);
              $("#sugar_input").val(response.m_sugar);
              $("#cal_input").val(response.m_kcal);
              $("#sfat_input").val(response.m_sfat);
              $("#na_input").val(response.m_nat);
              $("#protin_input").val(response.m_pro);
              $("#cof_input").val(response.m_cafe);
              $("#carbo_input").val(response.m_carbo);
              $("#fat_input").val(response.m_fat);
              $("#best_input").val(response.m_sel);
              $("#state_input").val(response.m_state);
       },
       error: function(xhr, status, error) { 
       }
   });
   });
   
//관리자 : 이미지 수정 관련 
function newimg(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("title", "이미지 준비");
          img.setAttribute("alt", "이미지 준비");
          document.querySelector("div#image_container").appendChild(img);
          
          document.getElementById("image_container").style.display = "block";
          document.getElementById("imgchange").style.display = "block";
        };

        reader.readAsDataURL(event.target.files[0]);
      }
      
 //관리자 : 이미지 수정 업로드 후 취소 했을 때 실행되는 함수  
 function delimg() {
    document.getElementById("img1_input").value = ""; 
    document.getElementById("img1_input").src = ""; 
    document.querySelector("#image_container").replaceChildren();
    document.getElementById("image_container").style.display = "none"; 
    document.getElementById("imgchange").style.display = "none";
}


// 전체 메뉴 클릭 시 실행되는 함수 
function allMd(val){
	location.href = val;
}

//메뉴 검색에 사용되는 함수 
function search(){
 	let seCon = document.getElementById("sel1").value;
    let seKey = document.getElementById("key1").value;
    
     if (!seKey) {
		        alert('검색어를 입력해주세요.');
		        return;
		    }
    
	let objParams = {searchCondition : seCon ,searchKeyword : seKey };
	let values = [];
	$.ajax({
		type : "POST",
		url : "search.san", 
		data : objParams, 
		cache : false, 
		success : function(data){
		
            $('#cardall').empty(); 
            $('#serNo_div').empty(); 
            values = data.searchList;
            if(values.length == 0){
  				$("#serNo_div").append(
  				`
  				   <h3 id="serNo_h3">검색 결과가 없습니다.</h3>`
  				   )
            }
			$.each(values, function(index, value){
				let m_state = value.m_state === "품절" ? '<span style="color:red; font-weight:bold;">SOLD OUT</span>' : '<span></span>';
				$("#cardall").append(
                    `
                    <div class="col-lg-3 col-md-6 col-sm-10 mdcard">
                     <div class="card">
                        <img class="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}">
                        <div class="card-body">
                            <h5 class="card-title">${value.m_name}</h5>
                            <p class="card-text">${value.m_price} 원</p>
                             ${m_state}
                             <button type="button" id="List" class="btn" onclick="list('${value.m_no}', '${value.m_kind}' )" data-toggle="modal" data-target="#listModal">상세보기</button>
                        </div>
                        </div>
                    </div><br>
                    `
  )
			});

		},
		error:function(request, status){
			alert("오류가 발생했습니다.");
		}
	});
}


//완료버튼 클릭 시 포인트 업데이트
function pointUp(o_id, o_save, o_state, o_no) {
    $.ajax({
        url: "pointUp.san",
        type: "GET",
        data: {
            o_id: o_id,
            o_savepoint: o_save
        },
        success: function(data) {
            modiod(o_state,  o_no)
            
        },
        error: function() {
        }
    });
}

//주문 상태변경
function modiod(val, val2){
	location.href = "updateOd.san?o_state=" + val + "&o_no=" + val2;
}

//유저화면 키워드 별로 메뉴 리스트 가져오는 함수 
function selectkind(val){
	let objParams = {m_kind: val};
	let values = [];

	$.ajax({
		type : "POST",
		url : "kind.san", 
		data : objParams, 
		cache : false, 
		success : function(data){
		
			$('#serNo_div').empty();
		
            $('#cardall').empty(); 
            values = data.kindList;
            $.each(values, function(index, value){
            let m_state = value.m_state === "품절" ? '<span style="color:red; font-weight:bold;">SOLD OUT</span>' : '<span></span>';
				$("#cardall").append(
				
                    `
                    <div class="col-lg-3 col-md-6 col-sm-10 mdcard"> 
                    <div class="card">
                        <img class="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}">
                        <div class="card-body">
                            <h5 class="card-title">${value.m_name}</h5>
                            <p class="card-text">${value.m_price} 원</p>
                            ${m_state}
                           <button type="button" id="List" class="btn" onclick="list('${value.m_no}', '${value.m_kind}' )" data-toggle="modal" data-target="#listModal">주문하기</button>
                        </div>
                       </div>
                    </div>`
  );
			});
		},
		error:function(request, status){
			alert("오류가 발생했습니다.");
		}
	});
}

// 품절 메뉴
function soldList(val){
	let objParams = {m_state: val};
	let values = [];

	$.ajax({
		type : "POST",
		url : "sold.san", 
		data : objParams, 
		cache : false, 
		success : function(data){
            $('#admdlist').empty();
            	$("#pagediv").empty();
				$("#pagediv .page-num-list").remove();
               values = data.soldList; 
               
                $.each(values, function(index, value){
                let m_state = "";
					if(value.m_state === "품절"){
						m_state ='<span style="color:red; font-weight:bold;">SOLD OUT</span>';
					}else if(value.m_state === "판매종료"){
						m_state ='<span style="color:purple; font-weight:bold;">판매종료</span>';
					}else {
						m_state ='<span style="color:gray; font-weight:bold;">판매가능</span>';
					}
				  $("#admdlist").append(
                   	 ` 
					   <tr>
					   <td> <img class="mdimg" id="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}" style="width:150px; height: 150px"></td>
					   <td>${value.m_name}</td>
					   <td>${value.m_price} 원</td>
					   <td>${value.m_content}</td>
					   <td>${m_state}</td>
					   <td><button type="button" id="List" class="btn" onclick="list('${value.m_no}', '${value.m_kind}' )" data-toggle="modal" data-target="#listModal">상세보기</button></td>
					   <td><button type="button" class="btn modify" id="modify" data-toggle="modal" data-target="#myModal" value= "${value.m_no}">메뉴수정</button></td>
					   </tr>
                    `
  				  );
  				}); 
		},
		error:function(request, status){
			alert("오류가 발생했습니다.");
		}
	});
}

//주문 가능한 메뉴만 보기
function okList(val){
	let objParams = {m_state: val};
	let values = [];

	$.ajax({
		type : "POST",
		url : "sold.san", 
		data : objParams, 
		cache : false, 
		success : function(data){
		
            $('#cardall').empty(); 
            values = data.soldList;
            $.each(values, function(index, value){
            let m_state = value.m_state === "품절" ? '<span style="color:red; font-weight:bold;">SOLD OUT</span>' : '<span></span>';
				$("#cardall").append(
                    `
                    <div class="col-lg-3 col-md-6 col-sm-10 mdcard"> 
                    <div class="card">
                        <img class="mdimg" src="/resources/img/${value.m_img}" alt="${value.m_name}" title="${value.m_name}">
                        <div class="card-body">
                            <h5 class="card-title">${value.m_name}</h5>
                            <p class="card-text">${value.m_price} 원</p>
                            ${m_state}
                           <button type="button" id="List" class="btn" onclick="list('${value.m_no}', '${value.m_kind}' )" data-toggle="modal" data-target="#listModal">주문하기</button>
                        </div>
                        </div>
                    </div><br>`
  );
			});
		},
		error:function(request, status){
			alert("오류가 발생했습니다.");
		}
	});
}
//카트룸에서 사용하는 함수 
function reUsePoint2(){
    $("#outpointbtn").css("display" , "inline-block");
      $("#reUsePoint").css("display" , "none");
      $("#usePoint").css({"border" : "1px solid black", "outline" : "1px solid black" });
   $("#usePoint").prop("readonly", false);
}



//메뉴 상세보기 클릭 시 옵션 보여지게 
function list(val, val_2){
   let no = val;
   let keyword = val_2;
   let data = { m_no : no };
     $.ajax({
        url : "getMd.san",
        type : "POST",
        data : data,
        success: function(data){
      
     if(keyword === '에이드' || keyword === '프라페' ){
        $("#selectSize2").css("display" , "block");
        $("#selectSize").css("display", "none");
        $("#selectOption").css("display", "block");
        $("#getKind").val("");
        $("#getKind").val(keyword);
        $("#ICE").prop("checked", true);
        let content = data.m_content;
        $("#total").val(1);
        $("#getName").val(data.m_name);
        $("#getContent").html(content);
        $("#getMenuState").val(data.m_state);
        $("#getPrice_hide").val(data.m_price);
        let m_price = data.m_price;
        m_price = m_price.toLocaleString();
        $("#getPrice").val(m_price + "원");
        $("#totalprice").val(m_price + "원");
        $("#Mdimg").attr("src", "/resources/img/"+data.m_img);
        $("#Mdimg").attr("title", data.m_name);
        $("#Mdimg").attr("alt", data.m_name);
     }else if(keyword === '커피' || keyword === '논커피' || keyword === '티'){
         $("#selectSize2").css("display" , "none");
         $("#selectSize").css("display", "block");
         $("#selectOption").css("display", "block");
        $("#getKind").val(keyword);
        let content = data.m_content;
        $("#total").val(1);
        $("#getName").val(data.m_name);
        $("#getContent").html(content);
        $("#getPrice_hide").val(data.m_price);
        $("#getMenuState").val(data.m_state);
        let m_price = data.m_price;
        m_price = m_price.toLocaleString();
        $("#getPrice").val(m_price + "원");
        $("#totalprice").val(m_price + "원");
        $("#Mdimg").attr("src", "/resources/img/"+data.m_img);
        $("#Mdimg").attr("title", data.m_name);
        $("#Mdimg").attr("alt", data.m_name);
     }else if(keyword === '디저트'){
        $("#selectSize2").css("display" , "none");
        $("#selectSize").css("display", "none");
        $("#selectOption").css("display", "none");
        $("#getKind").val(keyword);
        let content = data.m_content;
        $("#total").val(1);
        $("#getMenuState").val(data.m_state);
        $("#getName").val(data.m_name);
        $("#getContent").html(content);
        $("#getPrice_hide").val(data.m_price);
        let m_price = data.m_price;
        m_price = m_price.toLocaleString();
        $("#getPrice").val(m_price + "원");
        $("#totalprice").val(m_price + "원");
        $("#Mdimg").attr("src", "/resources/img/"+data.m_img);
        $("#Mdimg").attr("title", data.m_name);
        $("#Mdimg").attr("alt", data.m_name);
     }
     },
     error: function(){
        alert("실패");
     }
  });
}


// 상품 담은 후 다른메뉴 보기 이동 =>  onclick="othermenu()"
   function othermenu(){
      location.href="../selectList.san";
   }

//영양정보 가져오기(모달 사용) 기본은 Tall 사이즈로 => onclick="content()"
function content(){ /*  아작스 써서 데이터 넣기 mdContent.jsp에 */
        document.querySelector("#mdContent").style.display="block";
     $("#sizeContent_T").css({"background-color" : "black", "color" : "white"});
     $("#sizeContent_G").css({"background-color" : "white", "color" : "black"});
   let name = $("#getName").val();
   let val = { m_name : name };
   $.ajax({
      url : "getContent.san",
      type : "POST",
      data : val,
      success: function(data){
         let kind = data.m_kind;
         let onedoName = data.m_name;
         if(kind != '디저트'){
         $("#sizediv").css("display", "block");
         $("#content_Size").empty();
         $(".sizeContent").show();
         $("#content_Size").text("366ml");
         $("#content_Kcal").val(data.m_kcal+"Kcal");            
         $("#content_CarBo").val(data.m_carbo+"g");            
         $("#content_Sugar").val(data.m_sugar+"g");            
         $("#content_Nat").val(data.m_nat+"mg");            
         $("#content_Pro").val(data.m_pro+"g");            
         $("#content_Fat").val(data.m_fat+"g");            
         $("#content_Sfat").val(data.m_sfat+"g");            
         $("#content_Cafe").val(data.m_cafe+"mg");
          $("#cafedivHi").css("display", "block");
         }else if(kind === '디저트'){
           $("#sizediv").css("display", "none");
            $("#content_Size").empty();
            $("#content_Size").text("디저트/원두");
            $(".sizeContent").hide();
            $("#content_Kcal").val(data.m_kcal+"Kcal");            
            $("#content_CarBo").val(data.m_carbo+"g");            
            $("#content_Sugar").val(data.m_sugar+"g");            
            $("#content_Nat").val(data.m_nat+"mg");            
            $("#content_Pro").val(data.m_pro+"g");            
            $("#content_Fat").val(data.m_fat+"g");            
            $("#content_Sfat").val(data.m_sfat+"g");   
            $("#cafedivHi").css("display", "none");
            if(onedoName === '원두'){
            $("#cafedivHi").css("display", "block");
 	    $("#content_Cafe").val(data.m_cafe+"mg");
            }
         }
      },
      error: function(){
         alert("실패")
      }
   });
}

//장바구니 이동
function cartMove(){
   location.href="getCartList.san";
}
   
//영양정보 안에 사이즈 클릭시 사이즈에 관한 영양정보
function sizeContent(menuSize){
   let size = menuSize;
   let name = $("#getName").val();
   let val = { m_name : name };
   $.ajax({
      url : "getContent.san",
      type : "POST",
      data : val,
      success: function(data){
         let kind = data.m_kind;
         if(size === "Tall" && kind != '디저트'){
            $("#sCT").css("border-bottom" , "none");
            $("#sCG").css("border-bottom" , "none");
            $("#sizeContent_G").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
            $("#sizeContent_T").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
            $(".sizeContent").show();
            $("#content_Size").text("366ml");
            $("#content_Kcal").val(data.m_kcal+"Kcal");            
            $("#content_CarBo").val(data.m_carbo+"g");            
            $("#content_Sugar").val(data.m_sugar+"g");            
            $("#content_Nat").val(data.m_nat+"mg");            
            $("#content_Pro").val(data.m_pro+"g");            
            $("#content_Fat").val(data.m_fat+"g");            
            $("#content_Sfat").val(data.m_sfat+"g");            
            $("#content_Cafe").val(data.m_cafe+"mg");   
            $("#cafedivHi").css("display", "block");
         }else if(size === "Grande" && kind != '디저트'){
            $("#sCT").css("border-bottom" , "none");
            $("#sCG").css("border-bottom" , "none");
              $("#sizeContent_T").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
              $("#sizeContent_G").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
            $(".sizeContent").show();
            $("#content_Size").text("512ml");
            $("#content_Kcal").val((data.m_kcal*1.3).toFixed(1).replace(".0","")+"Kcal");            
            $("#content_CarBo").val((data.m_carbo*1.25).toFixed(1).replace(".0","")+"g");            
            $("#content_Sugar").val((data.m_sugar*1.29).toFixed(1).replace(".0","")+"g");            
            $("#content_Nat").val((data.m_nat*1.27).toFixed(1).replace(".0","")+"mg");            
            $("#content_Pro").val((data.m_pro*1.36).toFixed(1).replace(".0","")+"g");            
            $("#content_Fat").val((data.m_fat*1.28).toFixed(1).replace(".0","")+"g");            
            $("#content_Sfat").val((data.m_sfat*1.31).toFixed(1).replace(".0","")+"g");            
            $("#content_Cafe").val((data.m_cafe*1.38).toFixed(1).replace(".0","")+"mg");   
            $("#cafedivHi").css("display", "block");
         }else if(kind === '디저트'){
            $("#content_Size").text("디저트");
            $(".sizeContent").hide();
            $("#content_Kcal").val((data.m_kcal*1.3).toFixed(1).replace(".0","")+"Kcal");            
            $("#content_CarBo").val((data.m_carbo*1.25).toFixed(1).replace(".0","")+"g");            
            $("#content_Sugar").val((data.m_sugar*1.29).toFixed(1).replace(".0","")+"g");            
            $("#content_Nat").val((data.m_nat*1.27).toFixed(1).replace(".0","")+"mg");            
            $("#content_Pro").val((data.m_pro*1.36).toFixed(1).replace(".0","")+"g");            
            $("#content_Fat").val((data.m_fat*1.28).toFixed(1).replace(".0","")+"g");            
            $("#content_Sfat").val((data.m_sfat*1.31).toFixed(1).replace(".0","")+"g");
            $("#cafedivHi").css("display", "none");
            if(size === "Grande"){
            $("#sCT").css("border-bottom" , "none");
            $("#sCG").css("border-bottom" , "none");
              $("#sizeContent_T").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
              $("#sizeContent_G").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
            }else if(size === "Tall"){
            $("#sCT").css("border-bottom" , "none");
            $("#sCG").css("border-bottom" , "none");
            $("#sizeContent_G").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
            $("#sizeContent_T").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
            }
         }
      }, error: function(){
         alert("실패");
      }
   });
} 

   
//상세보기에서 영양정보(서브모달) 닫는 함수 
function subModalClose(){
   $("#sizeContent_G").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
   $("#sizeContent_T").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
   document.querySelector("#mdContent").style.display="none";
}

function CloseSheet() {
    document.getElementById("actionSheet").classList.remove("active");
  }

//   상품 담기 =>  onclick="cartInsert()"
function cartInsert(val) {
   let id = val;
   let state = $("#getMenuState").val();
   
   if(id === 'null' || id === "" ){
      alert("로그인 후 이용 가능합니다.");
      location.href="login.do";
   }else if(id != 'null' && state === '품절'){
        alert("품절 상품입니다.");
   }else{
   let cname = $("#getName").val();
   let opt =  $("input:radio[name=opt]:checked").val();
   let size = $("input:radio[name=sel]:checked").val();
   let kind = $("#getKind").val();
   let firstVal;
   if(kind != '디저트'){
   firstVal = {
         c_id : id,
         c_name : cname,
         c_option : opt,
         c_size : size,
   };
   }else if(kind === '디저트'){
      firstVal = {
      c_id : id,
      c_name : cname,
      c_option : '-',
      c_size : '-',
      };
   }
   $.ajax({
      url : "ListCheck.san",
      type : "POST",
      data : firstVal,
      success: function(data){
         if(data.c_name == null && data.c_option == null && data.c_id == null && data.c_size == null){
            let secondVal;
            let img = document.getElementById('Mdimg').getAttribute('src');
            img = img.split('/');
            img = img[img.length -1];
            let totalprice = $("#totalprice").val();
            let price = $("#getPrice").val();
            if(kind != '디저트'){
            secondVal = {
               c_id : id,
               c_name :  cname,
               c_total : $("#total").val(),
               c_price : price,
               c_option : opt,
               c_size : size,
               c_toprice : totalprice,
               c_img : img.trim(),
            };
            }else if(kind === '디저트'){
            secondVal = {
               c_id : id,
               c_name :  cname,
               c_total : $("#total").val(),
               c_price : price,
               c_option : '-',
               c_size : '-',
               c_toprice : totalprice,
               c_img : img.trim(),
            };
            }
            $.ajax({
               url : "insertCart.san",
               type : "POST",
               data : secondVal,
               success : function(res) {
                  
      				  document.getElementById("actionSheet").classList.add("active");
                  
               },
               error : function(xhr, error) {
                  alert("다시 시도해주세요.");
               }
            });
         } // null 확인 중괄호
         
         
         else{
            let thirdVal;
            let total = data.c_total; // 상품갯수 가져옴
            let toPrice = data.c_toprice; // 토탈 가격
            toPrice = toPrice.replace("원", "").replace(",", "");
            toPrice = parseInt(toPrice);
            let totalprice = $("#totalprice").val(); // 상품 총 가격
            totalprice = totalprice.replace("원", "").replace("," , ""); // 상품 총 가격
            totalprice = parseInt(totalprice);
            
            let total_2 = $("#total").val(); 
            total_2 = parseInt(total_2);
            toPrice = toPrice + totalprice;
            total = total + total_2;
            
            toPrice = toPrice.toLocaleString()+"원";
            
            if(kind != '디저트'){
            thirdVal = {
               c_id : id,
               c_name :  cname,
               c_total : total,
               c_toprice : toPrice,
               c_option : opt,
               c_size : size,
            };
            }else if(kind === '디저트'){
            thirdVal = {
               c_id : id,
               c_name :  cname,
               c_total : total,
               c_toprice : toPrice,
               c_option : '-',
               c_size : '-',
            };
            }
            $.ajax({
               url : "UpdateCart.san",
               type : "POST",
               data : thirdVal,
               success : function(res) {
                 
      				  document.getElementById("actionSheet").classList.add("active");
               },
               error : function(xhr, error) {
                  alert("다시 시도해주세요.");
               }
            });
         }
      },error: function(){
         alert("실패");
      }
   });
   }
   }

// Tall 이랑 Grande 설정시 가격 변동
$(document).ready(function(){ 
 var msize = false;
 var msize_2 = false;

// Tall 사이즈랑 Grande 사이즈 변경시 필요한 변수
  
$("input:radio[name=sel]").click(function(){
   if($("input:radio[name=sel]:checked").val()=='Grande'){
         msize_2 = false;
         msize = false;
   }else if($("input:radio[name=sel]:checked").val()=='Tall'){
         msize_2 = true;
         msize = true;
   }
   let price = $("#getPrice_hide").val().replace(",", ""); // 기본 값
   let price_2 = $("#getPrice").val().replace("원","").replace(",", ""); // 사이즈 가격
   price = parseInt(price);
   price_2 = parseInt(price_2);
   if($("input:radio[name=sel]:checked").val()=='Grande' && msize == false && msize_2 == false) { // Grande 일때
      
      price = price * 1.2;
      price = price.toLocaleString();
      $("#total").val(1);
      $("#getPrice").val("");
      $("#totalprice").val("");
      $("#getPrice").val(price+"원");
      $("#totalprice").val(price+"원");
      
      msize = true;
   }else if($("input:radio[name=sel]:checked").val()=='Tall' && msize == true && msize_2 == true){
      price_2 = price_2 / 1.2;
      price_2 = price.toLocaleString();
      $("#total").val(1);
      $("#getPrice").val("");
      $("#totalprice").val("");
      $("#getPrice").val(price_2+"원");
      $("#totalprice").val(price_2+"원");
      
      msize = false;
   }
});
});

function mainModalClose(){
   document.querySelector("#mdContent").style.display="none";
   $("#sizeContent_G").css({"border-bottom" : "0.5px solid gray", "font-size" : "18px"});
   $("#sizeContent_T").css({"border-bottom" : "2px solid black", "font-size" : "20px", "font-weight" : "bold"});
   document.getElementById("label_Tall").click();
   document.getElementById("label_HOT").click();
   let hidePrice = $("#getPrice_hide").val();
   hidePrice = parseInt(hidePrice);
   hidePrice = hidePrice.toLocaleString();
   $("#totalprice").val(hidePrice+"원");
   $("#getPrice").val(hidePrice+"원");
}

function toPlus(){
   let total = document.getElementById("total");
   let totalVal = parseInt(total.value);
   if (!isNaN(totalVal) && totalVal < 99) {
      total.value = totalVal + 1;
      
      let originPrice = $("#getPrice").val();
      originPrice = originPrice.replace("원", "").replace(",", "");
      originPrice = parseInt(originPrice); // 기존 가격
      total = $("#total").val();
      total = parseInt(total); // 업데이트 된 갯수
      
      let totalPrice = originPrice * total;
      totalPrice = totalPrice.toLocaleString();
      $("#totalprice").val(totalPrice+"원");
      
   }
}
   function toMiu(){
   let total = document.getElementById("total");
   let totalVal = parseInt(total.value);
   if (!isNaN(totalVal) && totalVal > 1) {
      total.value = totalVal - 1;
      
      let originPrice = $("#getPrice").val();
      originPrice = originPrice.replace("원", "").replace(",", "");;
      originPrice = parseInt(originPrice); // 기존 가격
      total = $("#total").val();
      total = parseInt(total); // 업데이트 된 갯수
      
      let totalPrice = originPrice * total;
      totalPrice = totalPrice.toLocaleString();
      $("#totalprice").val(totalPrice+"원");
   }
}

function outPoint(){
   
   $("#usePoint").css({"border" : "none", "outline" : "none" });
   $("#reUsePoint").css("display" , "inline-block");
   $("#outpointbtn").css("display" , "none");
      $("#usePoint").prop("readonly", true);
   
   let usePoint = $("#usePoint").val(); 
   let allTotalPrice = $("#allTotalPrice").val();
   let savePoint = $("#savePoint").val();
   usePoint = parseInt(usePoint);
   allTotalPrice = allTotalPrice.replace("원","").replace("," ,"");
   allTotalPrice = parseInt(allTotalPrice);
   
   if(isNaN(usePoint)){
      alert("사용할 포인트를 입력해주세요");
   }
   else if(savePoint >= usePoint){ // 여기서 -나오는것을 바꿔야함
      let payPrice = allTotalPrice - usePoint;    // 총금액에서 포인트 사용 = > 총 결제 금액
      if(payPrice >= 0){
      let payPrice_2 = payPrice.toLocaleString();
      $("#payPrice").val("0");
      $("#payPrice").val(payPrice_2+"원");
      $("#payPrice_2").val(payPrice_2+"원");
      $("#totalPayPrice").val(payPrice_2+"원");
      
     if($("input:radio[name=o_buy]:checked").val()=='배달'){
     
     
      let payPrice = $("#payPrice").val();
      payPrice = payPrice.replace("원","").replace("," ,"");
      payPrice = parseInt(payPrice);
      payPrice = payPrice + 3000;
      payPrice = payPrice.toLocaleString();
      $("#totalPayPrice").val(payPrice+"원");
     }
      
      } else if(payPrice < 0){
      alert("포인트 사용 금액은 결제 금액을 초과할 수 없습니다.");
      $("#usePoint").val("0");
      let allTotalPrice_2 = allTotalPrice.toLocaleString();
      $("#payPrice").val(allTotalPrice_2+"원");
      $("#payPrice_2").val(allTotalPrice_2+"원");
      if($("input:radio[name=o_buy]:checked").val()=='배달'){
      let payPrice = $("#payPrice").val();
      payPrice = payPrice.replace("원","").replace(",", "");
      payPrice = parseInt(payPrice);
      
      payPrice = payPrice + 3000;
      let payPrice_3 = payPrice.toLocaleString();
      $("#totalPayPrice").val(payPrice_3+"원");
     }
      }
   }
   else{
      alert("사용가능 포인트를 초과하였습니다.");
      $("#usePoint").val('0');
      let allTotalPrice_3 = allTotalPrice.toLocaleString();
      $("#payPrice").val(allTotalPrice_3+"원");
      $("#payPrice_2").val(allTotalPrice_3+"원");
      $("#totalPayPrice").val(allTotalPrice_3+"원");
      
       if($("input:radio[name=o_buy]:checked").val()=='배달'){
      let payPrice = $("#payPrice").val();
      payPrice = payPrice.replace("원","").replace(",", "");
      payPrice = parseInt(payPrice);
      
      payPrice = payPrice + 3000;
      let payPrice_4 = payPrice.toLocaleString();
      $("#totalPayPrice").val(payPrice_4+"원");
     }
      }
}
    


 function plus(c_no){
    let total = document.getElementById(c_no);
    let totalVal = parseInt(total.value);
    if (!isNaN(totalVal) && totalVal < 99) {
       total.value = totalVal + 1;
        
      let number = document.getElementById(c_no).value; // 갯수
      total= parseInt(number);
      let number_2 = document.getElementsByName(c_no);
      let number_3 = document.getElementsByClassName(c_no);
      
      for(let i =0 ; i < number_2.length ; i++){
         
         if(number_2[i].name === c_no){
           let totalWitch = number_2[i];
           let totalPrice = number_2[i].value;
           
           for(let j = 0 ; j < number_3.length ; j++){
              if(number_3[j].className === c_no){
                 
              let priceWitch = number_3[j].value;
              let originPrice = number_3[j].value;
              originPrice = originPrice.replace("원","").replace(",","");
              originPrice = parseInt(originPrice);
              
              totalPrice = originPrice * total;
              totalPrice = totalPrice.toLocaleString();
              
              totalWitch.value = totalPrice + "원"; // 총 가격
              
              let number_4 = document.getElementsByClassName("cartMenuPrice");
              let eachTotalPrice = 0;
              for(let k = 0 ; k < number_4.length ; k++){
                 let eachPrice = number_4[k].value;
                 eachPrice = eachPrice.replace("원", "").replace(",","");
                 eachPrice = parseInt(eachPrice);
                 eachTotalPrice += eachPrice;
              }
              let eachTotalPrice_2 = eachTotalPrice.toLocaleString();
              $("#allTotalPrice").val(eachTotalPrice_2+"원"); // 총 금액
              $("#payPrice_2").val(eachTotalPrice_2+"원");
              let usePoint = $("#usePoint").val();
              
              alltotalPrice = eachTotalPrice - usePoint;
              alltotalPrice = alltotalPrice.toLocaleString();
              $("#payPrice").val(alltotalPrice+"원");  // 결제금액
              $("#payPrice_2").val(alltotalPrice+"원");
              $("#totalPayPrice").val(alltotalPrice+"원");
              
              if($("input:radio[name=o_buy]:checked").val()=='배달'){
                 let payPrice_2 = $("#payPrice_2").val();
                 payPrice_2 = payPrice_2.replace("원","").replace(",", "");
                 payPrice_2 = parseInt(payPrice_2);
                 payPrice_2 = payPrice_2 + 3000;
                 payPrice_2 = payPrice_2.toLocaleString();
                 $("#totalPayPrice").val(payPrice_2+"원");
              }
                    
            }
              }
           }
         }
      }
    }
function miu(c_no) {
    
    let inputElement = document.getElementById(c_no);
    let currentValue = parseInt(inputElement.value);
     if (!isNaN(currentValue) && currentValue > 1) {
         inputElement.value = currentValue - 1;
         
       let number = document.getElementById(c_no).value; // 갯수
       total= parseInt(number);
       let number_2 = document.getElementsByName(c_no);
       let number_3 = document.getElementsByClassName(c_no);
       
       for(let i =0 ; i < number_2.length ; i++){
          if(number_2[i].name === c_no){
             let totalWitch = number_2[i];
            let totalPrice = number_2[i].value; // 기존 가격
            for(let j = 0 ; j < number_3.length ; j++){
               if(number_3[j].className === c_no){
                  
               let priceWitch = number_3[j];
               let originPrice = number_3[j].value;
               originPrice = originPrice.replace("원","").replace(",","");
               originPrice = parseInt(originPrice);
               totalPrice = originPrice * total;
               totalPrice = totalPrice.toLocaleString();
               totalWitch.value = totalPrice + "원"; // 총 가격
               let number_4 = document.getElementsByClassName("cartMenuPrice");
               let eachTotalPrice = 0;
               for(let k = 0 ; k < number_4.length ; k++){
                  let eachPrice = number_4[k].value;
                  eachPrice = eachPrice.replace("원", "").replace(",", "");
                  eachPrice = parseInt(eachPrice);
                  eachTotalPrice += eachPrice;
               }
               let eachTotalPrice2= eachTotalPrice.toLocaleString();
               $("#allTotalPrice").val(eachTotalPrice2+"원");
               $("#payPrice_2").val(eachTotalPrice2+"원");
               let usePoint = $("#usePoint").val();
               alltotalPrice = eachTotalPrice - usePoint;
               let alltotalPrice_2 = alltotalPrice.toLocaleString();
               $("#payPrice").val(alltotalPrice_2+"원");
               $("#payPrice_2").val(alltotalPrice_2+"원");
               $("#totalPayPrice").val(alltotalPrice_2+"원");
               
               if(alltotalPrice >= 0){
               if($("input:radio[name=o_buy]:checked").val()=='배달'){
                  let payPrice_2 = $("#payPrice_2").val();
                  payPrice_2 = payPrice_2.replace("원","").replace(",", "");
                  payPrice_2 = parseInt(payPrice_2);
                  payPrice_2 = payPrice_2 + 3000;
                  payPrice_2 = payPrice_2.toLocaleString();
                  $("#totalPayPrice").val(payPrice_2+"원");
               }
               }else {
                  usePoint = parseInt(usePoint);
                  alltotalPrice = parseInt(alltotalPrice);
                  
                  alltotalPrice = usePoint + alltotalPrice ;
                  
                  $("#usePoint").val(alltotalPrice);
                  $("#payPrice").val('0원');
                  $("#payPrice_2").val('0원');
                  $("#totalPayPrice").val('0원');
                  if($("input:radio[name=o_buy]:checked").val()=='배달'){
                     $("#totalPayPrice").val("3,000원");
                    }
               }
               }
            }
          }
       }
     }
 }

// 장바구니에서 메뉴 삭제
function deleteMenu(c_no, c_id){
   let no = c_no;
   let id = c_id;
   let value = {
      c_no : no
   }
   $.ajax({
      url : "deleteCart.san",
      type : "POST",
      data : value,
      
      success: function(){
         location.href="getCartList.san?c_id="+id;
         
      },error: function(){
         location.href="getCartList.san?c_id="+id;
      }
   });
}