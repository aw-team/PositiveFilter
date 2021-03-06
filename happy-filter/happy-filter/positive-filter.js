(function() {
   var convTable = [
     {key: '打たれた', filtered: '打たせてあげた'},
     {key: '敗戦', filtered: '惜敗'},
     {key: '最下位', filtered: '追う立場'},
     {key: '暴投', filtered: '惜しい投球'},
     {key: '負けっぷり', filtered: '清々しい負け'},
     {key: '力不足', filtered: '力不足は否めないが今後に期待'},
     {key: '落胆', filtered: '反省を次回へ持ち越した'},
     {key: '凡ミス', filtered: 'だれにでも起こりうるミス'},
     {key: '目立ちすぎ', filtered: '見栄えがいい'},
     {key: '厳しい', filtered: '愛くるしい'},
     {key: 'ワイルドピッチ', filtered: '気持ちズレた球'},
     {key: 'DeNA', filtered: 'あの天下のDeNA'},
     {key: 'ＤｅＮＡ', filtered: 'あの天下のＤｅＮＡ'},
     {key: 'ワースト', filtered: '逆1位'},
     {key: '転落', filtered: '移動'},
     {key: '不名誉', filtered: '煌びやか'},
     {key: 'スライダー', filtered: '切れ味鋭いスライダー'},
     {key: '代打', filtered: '代打のリーサルウェポン'},
     {key: 'エラー', filtered: 'どんまい'},
     {key: '監督', filtered: 'スーパーバイザー'},
     {key: 'ギブアップ', filtered: 'バンザイ'}               
   ];
 
   convTable.forEach(function(conv) {
     $('.text').each(function(index, elem) {
       $(elem).html($(elem).html().replace(new RegExp(conv.key, 'g'), conv.filtered));
     });

     $('.title').each(function(index, elem) {
       $(elem).html($(elem).html().replace(new RegExp(conv.key, 'g'), conv.filtered));
     });
   });
})();

