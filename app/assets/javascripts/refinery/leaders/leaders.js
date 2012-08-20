
$(document).ready(function(){

  var img = $("#map img")[0];
  if (img != undefined) {
    img.onload = function() {
      if(typeof map_links != 'undefined')
      {
        for (i=0; i<map_links.length; i++)
        {
          ratio = getRatio();

          thiss = map_links[i];
          topX = (thiss['top'] * ratio);
          left = (thiss['left'] * ratio);
          width = (thiss['width'] * ratio)+2;
          height = (thiss['height'] * ratio)+2;

          $('#map').append('<a href="/leaders/groups/'+thiss['group_id']+'"><div class="link-on-map"style="font-size:10px;width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;">&nbsp</div></a>');
        };
      }

      if(typeof admin_map_links != 'undefined')
      {
        for (i=0; i<admin_map_links.length; i++)
        {
          ratio = getRatio();

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
        });
      }
    }
  });

  var getRatio = function() {
    ratio = img.width / img.naturalWidth;
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
