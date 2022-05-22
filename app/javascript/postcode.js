const priceInput = document.getElementById("new_user");
function initPostcodeJp() {
  const API_Key = process.env.POSTAL_CODE_KEY;
  const postcodeBox = document.getElementById('postal_code');
  const searchBtn = document.getElementById('search_btn')
  const prefBox = document.getElementById('pref');
  const cityBox = document.getElementById("city")
  const townBox = document.getElementById("town")

  // APIキー取得とサービスオブジェクトの作成
  var postcodeJp = new postcodejp.address.AutoComplementService(API_Key);

  // 郵便番号テキストボックスを設定
  postcodeJp.setZipTextbox(postcodeBox);

  // 住所補完対象フィールドの追加
  postcodeJp.add(new postcodejp.address.StateTextbox(prefBox));
  postcodeJp.add(new postcodejp.address.TownTextbox(cityBox));
  postcodeJp.add(new postcodejp.address.StreetTextbox(townBox))

  // 自動補完を無効にする。
  postcodeJp.setAutoComplement(false);

  // 検索ボタンのidまたはエレメントを設定する
  postcodeJp.setComplementButton(searchBtn);

  postcodeJp.observe();
};



if(window.addEventListener){
  window.addEventListener('load', initPostcodeJp)
}else{
  window.attachEvent('onload', initPostcodeJp)
}