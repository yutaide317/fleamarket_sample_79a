$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='FormGroup__content__category__added' id= 'children_wrapper'>
                          <div class='FormGroup__content__category1'>
                            <i class='fas fa-chevron-down FormGroup__content__category--arrow-down'></i>
                            <select class="FormGroup__content__category--select" id="child_category" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.FormGroup__content__category').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchildrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='FormGroup__content__category__added' id= 'grandchildren_wrapper'>
                                <div class='FormGroup__content__category2'>
                                  <i class='fas fa-chevron-down FormGroup__content__category--arrow-down'></i>
                                  <select class="FormGroup__content__category__box--select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.FormGroup__content__category').append(grandchildSelectHtml);
    }

    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      const parent_category_id = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      // console.log(parent_category_id)
      if (parent_category_id != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(children){
          // console.log(childeren)
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('#grandchildren_wrapper').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $('.FormGroup__content').on('change', '#child_category', function(){
      const child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      // console.log(child_category_id)
      if (child_category_id != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/items/category/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        .fail(function(grandchildren){
          // console.log(grandchildren)
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
  });
});