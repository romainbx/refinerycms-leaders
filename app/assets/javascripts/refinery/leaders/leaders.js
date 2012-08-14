$(document).ready(function(){

  if(typeof map_links != 'undefined')
  {
    for (i=0; i<map_links.length; i++)
    {
      img = $("#map img")[0];
      ratio = img.width / img.naturalWidth;

      thiss = map_links[i];
      topX = (thiss['top'] * ratio)-(thiss['height'] * ratio/2)+3;
      left = (thiss['left'] * ratio)-(thiss['width'] * ratio/2)+2;
      width = (thiss['width'] * ratio);
      height = (thiss['height'] * ratio);
      $('#map').append('<a href="/leaders/groups/'+thiss['group_id']+'"><div class="link-on-map"style="font-size:10px;width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;">&nbsp</div></a>');
    };
  }

  if(typeof admin_map_links != 'undefined')
  {
    for (i=0; i<admin_map_links.length; i++)
    {
      img = $("#map img")[0];
      ratio = img.width / img.naturalWidth;

      thiss = admin_map_links[i];
      topX = (thiss['top'] * ratio)-(thiss['height'] * ratio/2)+3;
      left = (thiss['left'] * ratio)-(thiss['width'] * ratio/2)+2;
      width = (thiss['width'] * ratio);
      height = (thiss['height'] * ratio);

      $('#click-map').append('<div class="link-on-map-admin" style="font-size:10px;width:'+width+'px;height:'+height+'px;top:'+topX+'px;left:'+left+'px;position:absolute;"></div>');
      $('.link-on-map-admin').resizable({
        stop: function(e, ui) {

          img = $("#map img")[0];
          ratio = img.width / img.naturalWidth;

          $('input[id=map_link_width]').val(Math.floor(ui.size.width / ratio));
          $('input[id=map_link_height]').val(Math.floor(ui.size.height / ratio));
        }
      });

      $('.link-on-map-admin').draggable({
        stop: function(e, ui) {

          img = $("#map img")[0];
          ratio = img.width / img.naturalWidth;

          var parentOffset = $(this).parent().offset();
          var unrelX = e.pageX - parentOffset.left;
          var unrelY = e.pageY - parentOffset.top;
          var relX = unrelX / ratio;
          var relY = unrelY / ratio;
          $('input[id=map_link_top]').val(Math.floor(relY));
          $('input[id=map_link_left]').val(Math.floor(relX));
        }
      });
    };
  }

  $('#click-map').click(function(e){

    $('.link-on-map-admin').remove();

    img = $("#map img")[0];
    ratio = img.width / img.naturalWidth;

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
    $('.link-on-map-admin').resizable({
      stop: function(e, ui) {

        img = $("#map img")[0];
        ratio = img.width / img.naturalWidth;

        $('input[id=map_link_width]').val(Math.floor(ui.size.width / ratio));
        $('input[id=map_link_height]').val(Math.floor(ui.size.height / ratio));
      }
    });

    $('.link-on-map-admin').draggable({
      stop: function(e, ui) {

        img = $("#map img")[0];
        ratio = img.width / img.naturalWidth;

        var parentOffset = $(this).parent().offset();
        var unrelX = e.pageX - parentOffset.left;
        var unrelY = e.pageY - parentOffset.top;
        var relX = unrelX / ratio;
        var relY = unrelY / ratio;
        $('input[id=map_link_top]').val(Math.floor(relY));
        $('input[id=map_link_left]').val(Math.floor(relX));
      }
    });
  });
});
