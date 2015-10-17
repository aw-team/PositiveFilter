(function() {
   var convTable = [
     {key: '打たれた', filtered: '打たせてあげた'},
     {key: '敗戦', filtered: '惜敗'},
     {key: '最下位', filtered: '追う立場'},
     {key: '暴投', filtered: '惜しい投球'},
     {key: '成功', filtered: '大成功'},
     {key: '負けっぷり', filtered: '清々しい負け'},
     {key: '力不足', filtered: '力不足は否めないが今後に期待'},
     {key: '落胆', filtered: '反省を次回へ持ち越した'},
     {key: '凡ミス', filtered: 'だれにでも起こりうるミス'},
     {key: '目立ちすぎ', filtered: '見栄えがいい'},
     {key: '厳しい', filtered: '愛くるしい'},
     {key: 'ワイルドピッチ', filtered: '気持ちズレた球'},
     {key: 'DeNA', filtered: 'あの天下のDeNA'},
     {key: 'ワースト', filtered: 'スタートライン'},
     {key: 'タイ', filtered: 'トムヤムクン'},
     {key: '転落', filtered: 'スライド'},
     {key: '不名誉', filtered: '煌びやかな'},
     {key: '記録', filtered: '大記録'},
     {key: 'スライダー', filtered: '切れ味鋭いスライダー'},
     {key: '代打', filtered: '代打のリーサルウェポン'},
     {key: 'エラー', filtered: 'どんまい'},
     {key: '監督', filtered: 'スーパーバイザー'},
     {key: 'ギブアップ', filtered: 'ユースケサンタマリア'}
   ];
 
   convTable.forEach(function(conv) {
     $('.text').each(function(index, elem) {
       $(elem).html($(elem).html().replace(conv.key, conv.filtered));
     });

     $('.title').each(function(index, elem) {
       $(elem).html($(elem).html().replace(conv.key, conv.filtered));
     });
   });
})();

