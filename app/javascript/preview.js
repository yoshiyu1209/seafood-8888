// HTMLが読み込まれたときに動作する関数
document.addEventListener('DOMContentLoaded', function(){
  // HTMLの要素をJavaScript側で取得
  const ImageList = document.getElementById('image-list');

  // 選択した画像を配列に格納
  document.getElementById('item-image').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    // 画像情報を変数に格納
    const file = e.target.files[0];
    // 画像のURLを生成
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    // 画像URLをimg要素のsrc属性に設定
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class', 'img-image');

    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  });
});