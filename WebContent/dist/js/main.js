/* 画像スライダー */
function imageSlide (id, options) {
    var resizeTimer = null,
        extra = options.extra || 2,
        wrapper = document.getElementById(id),
        items =  document.getElementsByClassName(options.itemClassName||'js-slide-item'),
        points = document.getElementsByClassName(options.pointClassName||'js-slide-point'),
        duration = options.duration || 350,
        maxPoint = items.length+(extra),
        flipsnap = null;

    if(!wrapper || !items || !points) return;

    // 要素が2つ以下の場合、インジケーターを消して処理を停止
    if(items.length < 2) {
        items[0].style.margin = '0 auto';
        Array.prototype.slice.call(points).map(function(point, i) {
            point.style.display = 'none';
        });
        return;
    } else {
        // ダミーを作成
        var dummies =createDummy(items, extra);
        wrapper.innerHTML='';
        wrapper.appendChild(dummies);

        init();

        // リサイズされたら計算し直し
        window.addEventListener('resize', init, false);
    }


    // センタリングして、再計算
    function init () {
        if(!resizeTimer) {
            resizeTimer = setTimeout(function(){
                // タイマーを戻す
                resizeTimer = null;

                // センタリングする
                wrapper.style.position = 'relative';
                wrapper.style.left = 0;

                // ポインタをセット
                activePoint(0);

                // カルーセルを起動
                flipsnap = Flipsnap(wrapper, {
                    distance: items[0].clientWidth,
                    maxPoint: maxPoint,
                    duration: duration
                });
                // 実際は1-3の範囲で動かすため、初期位置を移動
                flipsnap.moveToPoint(extra,0);

                // スライドが動いたら次を計算する
                flipsnap.element.addEventListener('fspointmove', move );

                // ポインタで動かせるようにする
                Array.prototype.slice.call(points).forEach(function(point, i){
                    point.addEventListener('click', function(e){
                        console.log(i+extra);
                        flipsnap.moveToPoint(i+extra);
                    }, false)
                })
            }, 66);
        }
    }


    // 挙動を管理する
    function move (evt) {
        // 右端1つ手前を動かしたら最初に戻る
        if(flipsnap.currentPoint > flipsnap.maxPoint - 1) {
            backTo(true);

        // 左端1つ手前を動かしたら最後に戻る
        } else if (flipsnap.currentPoint < extra) {
            backTo();

        // 通常の移動ではポインタだけを移動
        } else {
            activePoint(flipsnap.currentPoint-extra);
        }
    }

    // 端の要素に来たらこっそり戻す
    function backTo (isStart) {
        var temp, ind;
        if(isStart) {
            temp=flipsnap.maxPoint; ind=extra;
        } else {
            temp=1; ind=flipsnap.maxPoint-1;
        }
        //一旦イベントを削除しておく
        flipsnap.element.removeEventListener('fspointmove', move);

        // ダミー要素に普通に動かす
        flipsnap.moveToPoint(temp);

        // ダミー要素の移動が完了しおわってから、こっそり位置を本来の要素に戻す
        timer = setTimeout(function(){
            flipsnap.moveToPoint(ind, 0);
            // ポインタも移動する
            activePoint(ind-extra);
            flipsnap.element.addEventListener('fspointmove', move);
            clearTimeout(timer);
        }, duration+3);
    }

    // ダミー作成
    function createDummy (elms, extra) {
        var res = document.createDocumentFragment(),
            len = elms.length,
            arr=[];

        _.range(len+(extra*2)).forEach(function(x, i){
            var ind = (i%len+1)%len;
            res.appendChild( elms[ind].cloneNode(true) );
        });
        return res;
    }

    // ポインタを動かす
    function activePoint (ind) {
        Array.prototype.slice.call(points).forEach(function(point, i){
            if(i === ind && !point.className.match('isActive')) {
                point.className += ' isActive';
            } else if(i !== ind && point.className.match('isActive')) {
                point.className = point.className.replace(' isActive', '');
            }
        })
    }
}

/* 画像ギャラリー */
$(function() {
  $("#navi a").click(function() {
    $("#main img").attr("src",  $(this).attr("href"));

    return false;
  });
});

/* ページ上部へ戻る */
$(function() {
  var topBtn = $("#page-top");
  topBtn.click(function() {
    $("body,html").animate({
      scrollTop: 0
    }, 500);
  });
});

/* アコーディオンパネル */
$(function(){
	$('.Categorys__title').click(function(){
    $(this).next().slideToggle();
    $('.Categorys__titleArrow').toggleClass("rotated");
	});
});

/* 画像スライダー */
$(function() {
  //liの個数を取得しておく
  var listContents = $("#entry_list_more li").length;

  $("#entry_list_more").each(function(){
    //最初に表示させるアイテムの数
    var Num = 3;
    //もともと3つより少ない場合はもっと見るボタンを出さない
    if(listContents <= Num){
      $('#more_btn').hide();
    } else {
      $(this).find('#more_btn').show();
    }

    //3行目まで表示
    $(this).find("li:not(:lt("+Num+"))").hide();

    //moreボタンがクリックされた時
    $('#more_btn').click(function(){
    //Numに+3ずつしていく = 3行ずつ追加する
      Num +=3;
      $(this).parent().find("li:lt("+Num+")").slideDown();

      //liの個数よりNumが多い時、
      if(listContents <= Num){
        $('#more_btn').hide();
      }
    });
  });
});

/* アップロードサムネイル */
$(function(){
  $('#file').change(function(){
    $('img').remove();
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
        $('#result').html('<img src="' + fileReader.result + '"/>');
    }
    fileReader.readAsDataURL(file);
  });
});
