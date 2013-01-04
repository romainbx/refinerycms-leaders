//
//= require chosen-jquery

$(document).ready(function(){

  $('#edit_role_individuals').sortable({
    handle:".handle",
    update: function() {
      var positions = $(this).sortable('toArray');

      for (var i=0; i<positions.length; i++)
      {
        gi_id = positions[i].substr(positions[i].indexOf('_')+1);
        $('input#'+gi_id+'_position').val(i);
      }
    }
  });

  $('.button_orga_little').mouseover(function(){
    $('.floating-menu[rel="'+$(this).attr('rel')+'"]').css('top', $(this).position().top + parseInt($(this).css('height').replace('px', '')));
    $('.floating-menu[rel="'+$(this).attr('rel')+'"]').css('left', $(this).position().left);
    $('.floating-menu[rel="'+$(this).attr('rel')+'"]').css('display', 'block');
  });

  $('.floating-menu').mouseover(function(){
    $(this).css('display', 'block');
    $('.button_orga_little[rel="'+$(this).attr('rel')+'"]').css('opacity', '1');
  });

  $('.button_orga_little').mouseout(function(){
    $('.floating-menu').css('display', 'none');
  });

  $('.floating-menu').mouseout(function(){
    $(this).css('display', 'none');
    if ($('.directory-content').attr('rel') != $(this).attr('rel'))
      $('.button_orga_little[rel="'+$(this).attr('rel')+'"]').css('opacity', '.5');
  });

  $(".chzn-select").chosen();

  var img = $("#map img")[0];
  if (img != undefined) {
    img.onload = function() {
      if(typeof map_links != 'undefined')
      {
        ratio = getRatio();

        for (i=0; i<map_links.length; i++)
        {

          thiss = map_links[i];

          topX = (thiss['top'] * ratio);
          left = (thiss['left'] * ratio);
          width = (thiss['width'] * ratio)+2;
          height = (thiss['height'] * ratio)+2;

          $div = $('<div class="link-on-map" style="border:1px solid white;font-size:10px;width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;">&nbsp</div>');
          $link = $('<a style="left:0;position:absolute;top:0;display:block;width:'+width+'px;height:'+height+'px;" href="/leaders/groups/'+thiss['group_id']+'"></a>');
          $div.append($link);
          $('#map').append($div);
        };
      }
      if (typeof static_map_links != 'undefined')
        putStaticMapLinks (static_map_links);

      if(typeof admin_map_links != 'undefined')
      {
        ratio = getRatio();

        for (i=0; i<admin_map_links.length; i++)
        {

          thiss = admin_map_links[i];
          topX = (thiss['top'] * ratio);
          left = (thiss['left'] * ratio);
          width = (thiss['width'] * ratio);
          height = (thiss['height'] * ratio);

          $('#click-map').append('<div class="link-on-map-admin" style="font-size:10px;width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;"></div>');
          addEvents('.link-on-map-admin');
        };
      }
    }
  }

  $('#click-map').click(function(e){

    $('.link-on-map-admin').remove();

    ratio = getRatio();

    var parentOffset = $(this).parent().offset();
    var unrelX = e.pageX - parentOffset.left;
    var unrelY = e.pageY - parentOffset.top;
    var relX = unrelX / ratio;
    var relY = unrelY / ratio;

    $('input[id=map_link_top]').val(Math.floor(relY));
    $('input[id=map_link_left]').val(Math.floor(relX));

    var width = $('input[id=map_link_width]').val() * ratio;
    var height = $('input[id=map_link_height]').val() * ratio;

    unrelX = unrelX - (width / 2);
    unrelY = unrelY - (height / 2)

    $('#click-map').append('<div class="link-on-map-admin" style="font-size:10px;width:'+width+'px;height:'+height+'px;top:'+unrelY+'px;left:'+unrelX+'px;position:absolute;"></div>');
    addEvents('.link-on-map-admin');
  });

  $('#map_link_map_id').change(function(e){
    for (i=0; i<maps.length; i++)
    {
      if (maps[i].id == $(this).val()) {
        $.post('/refinery/maps/getImageUrl', {map_id : $(this).val()}, function(result) {
          $('#map > img').remove();
          $('#map').append('<img src="'+result+'">');
          img = $("#map img")[0];
          if (typeof static_map_links != 'undefined')
            putStaticMapLinks (static_map_links);
        });
      }
    }
  });

  var putStaticMapLinks = function(list) {

    $('.link-on-map-admin-static').remove();
    if(typeof list != 'undefined')
    {
      ratio = getRatio();

      for (i=0; i<list.length; i++)
      {
        thiss = list[i];

        if (thiss['map_id'] == $('#map_link_map_id').val())
        {
          topX = (thiss['top'] * ratio);
          left = (thiss['left'] * ratio);
          width = (thiss['width'] * ratio)+4;
          height = (thiss['height'] * ratio)+4;

          $('#click-map').append('<div class="link-on-map-admin-static" style="width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;">'+thiss['name']+'</div>');
        }
      };
    }
  }

  function getNatural (DOMelement) {
      var img = new Image();
      img.src = DOMelement.src;
      return {width: img.width, height: img.height};
  }

  var getRatio = function() {
    naturalWidth = img.naturalWidth;
    if(typeof naturalWidth == "undefined")
    {
      natural = getNatural(img);
      naturalWidth = natural.width;
    }
    ratio = img.width / naturalWidth;
    return ratio;
  }

  var addEvents = function(add_to) {
    $(add_to).resizable({
      stop: function(e, ui) {

        ratio = getRatio();

        $('input[id=map_link_width]').val(Math.floor(ui.size.width / ratio));
        $('input[id=map_link_height]').val(Math.floor(ui.size.height / ratio));
      }
    });
    $(add_to).draggable({
      stop: function(e, ui) {

        ratio = getRatio();

        //var parentOffset = $(this).parent().offset();
        var unrelX = ui.position.left;//e.pageX - parentOffset.left;
        var unrelY = ui.position.top;//e.pageY - parentOffset.top;
        var relX = unrelX / ratio;
        var relY = unrelY / ratio;
        $('input[id=map_link_top]').val(Math.floor(relY));
        $('input[id=map_link_left]').val(Math.floor(relX));
      }
    });
  }
});
