$(document).on('DOMContentLoaded', ()=> {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][src]"
                    id="item_images_attributes_${num}_src"><br>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div class="preview-block">
                    <img data-index="${index}"
                    class="preview-box"
                    src="${url}"
                    width="125px" height="125px">
                    <div class="js-remove">削除</div>`;
    return html;
  }


  //ラベルの調整
  function setLabel() {
    //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
    var prevContent = $('.inputArea').prev();
    labelWidth = (640 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.inputArea').css('width', labelWidth);
  }

  let labelIndex = $('.js-file_group').last().data('index');
  console.log(labelIndex);
  // fileIndexの0番目=1〜５を活用
  $('.label-box').attr({id: `label-box--${labelIndex}`,for: `item_images_attributes_${labelIndex}_src`});
  $('.js-file').hide();
  

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    setLabel();

    // let labelIndex = $('.js-file_group').last().data('index');
    // newlabelIndex = labelIndex + 1
    // console.log(newlabelIndex);
    // fileIndexの0番目=1〜５を活用
    // $('.label-box').attr({id: `label-box--${newlabelIndex}`,for: `item_images_attributes_${newlabelIndex}_src`});
    // $('.js-file').hide

    // $('.js-file_group').hide();
  

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('.previewArea').append(buildImg(targetIndex, blobUrl));
      $('.inputArea').append(buildFileField(fileIndex[0]));
      $('.label-box').attr({id: `label-box--${fileIndex[0]}`,for: `item_images_attributes_${fileIndex[0]}_src`});
      $('.js-file_group').hide();
      // console.log(fileIndex[0]);
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('.previewArea').on('click', '.js-remove', function() {
    const targetIndex = $(this).prev().data('index');
    // console.log(targetIndex)
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`input[id="item_images_attributes_${targetIndex}_src"]`).remove();


    if ($('.js-file').length == 0) 
      $('.label-box').append(buildFileField(fileIndex[0]));
      // $('.label-box').attr({id: `label-box--${fileIndex[0]}`,for: `item_images_attributes_${fileIndex[0]}_src`});

  });
}); 