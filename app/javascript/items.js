$(document).on('turbolinks:load', ()=> {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][src]"
                    id="item_images_attributes_${num}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}"
                  class="preview-box"
                  src="${url}"
                  width="125px" height="125px">`;
    return html;
  }

  // var count = $('.preview-box').length;
  // if (count == 0) {
  //   $('.js-remove').hide();
  // }

  //ラベルの調整
  function setLabel() {
    //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
    var prevContent = $('.inputArea').prev();
    labelWidth = (640 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.inputArea').css('width', labelWidth);
  }
  

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    setLabel();
    
    labelIndex = $('.js-file_group').last().data('index');
    console.log(labelIndex);

    // fileIndexの0番目=1〜５を活用
    $('.label-box').attr({id: `label-box--${lastIndex}`,for: `item_images_attributes_${lastIndex}_src`});
    // $('.js-file').hide

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('.previewArea').append(buildImg(targetIndex, blobUrl));
      $('.label-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // if ($('.js-file').length == 0) 
    // var fileIndex2 = [1,2,3,4,5,6,7,8,9,10];
    // var resetIndex = fileIndex2[0];
    // $('#image-box').append(buildFileField(resetIndex));
    // $('label-box').attr('id', 'label-box--#{resetIndex}');
      
  });
});