// /*globals $*/
// 'use strict';

// var CatsCuties = {

//   updateLineItem: function(data) {
//     $('#line_item_total_price').innerHTML = data;
//   },

//   callAjax: function(id, quantity) {
//     $.ajax({
//       url: '/line_items/' + id + '.json',
//       type: 'post',
//       dataType: 'json',
//       success: function(data) {
//         CatsCuties.updateLineItem(data);
//       }
//     });
//   },

//   setChangeEvent: function() {
//     $( '#exampleInputEmail1' ).change(function() {
//       var quantity = $('#exampleInputEmail1').val(),
//         id = $('#exampleInputEmail1').attr('data_id');
//       CatsCuties.callAjax(id, quantity);
//     });
//   }

// };

// $( document ).ready(function() {

//   CatsCuties.setChangeEvent();
// });