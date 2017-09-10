// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//modal
$(function(){

 $("#create_event").click(function(){
     $("body").append('<div class="modal-bg" id="bg-create"></div>');
     //画面中央を計算する関数を実行
     modalResize();

     //モーダルウィンドウを表示
     $("#bg-create,.modal-main").fadeIn("slow");

     //クリックしてモーダルを閉じる
      $("#return").click(function(){
           $("#create,#bg-create").fadeOut("slow",function(){
          //挿入した<div id="modal-bg"></div>を削除
               $('#bg-create').remove() ;
          });

         });

     //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
      $(window).resize(modalResize);
       function modalResize(){

             var w = $(window).width();
           var h = $(window).height();

             var cw = $(".modal-main").outerWidth();
            var ch = $(".modal-main").outerHeight();

         //取得した値をcssに追加する
             $(".modal-main").css({
                 "left": ((w - cw)/2) + "px",
                 "top": ((h - ch)/2) + "px"
           });
      }

 });


 $(window).load(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     if (gon.count!=0) {
         $("body").append('<div class="modal-bg" id="bg-suggest"></div>');
         console.log(gon.count);

         //画面中央を計算する関数を実行
         modalResize();

         //モーダルウィンドウを表示
         $("#bg-suggest,#suggest").fadeIn("slow");

         //画面のどこかをクリックしたらモーダルを閉じる
          $("#bg-suggest,.modal-main").click(function(){
               $("#bg-suggest,#suggest").fadeOut("slow",function(){
              //挿入した<div id="modal-bg"></div>を削除
                   $('#bg-suggest').remove() ;
              });

             });

         //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
          $(window).resize(modalResize);
           function modalResize(){

                 var w = $(window).width();
               var h = $(window).height();

                 var cw = $(".modal-main").outerWidth();
                var ch = $(".modal-main").outerHeight();

             //取得した値をcssに追加する
                 $(".modal-main").css({
                     "left": ((w - cw)/2) + "px",
                     "top": ((h - ch)/2) + "px"
               });
          }
     }


   });
});
