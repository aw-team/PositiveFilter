(function() {
   var convTable = [{
     key: 'もう使わない', filtered: 'しばらく温存させたい'
   }];
 
   convTable.forEach(function(conv) {
     $('header .title:eq(0)').text($('header .title:eq(0)').text().replace(conv.key, conv.filtered));
   });
})();

