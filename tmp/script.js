(function() {
  $(function() {
    $('h2.trigger').on('click', function(e) {
      e.preventDefault();
      if ($(this).hasClass('open')) {
        $('#items').animate({
          'right': '-100%'
        }, 100);
        $(this).removeClass('open');
        return $(this).html('<img src="assets/img/ehpf.jpg">');
      } else {
        $('#items').animate({
          'right': '0'
        }, 100);
        $(this).addClass('open');
        return $(this).html('<i class="fa fa-chevron-right"></i>');
      }
    });
    $('#video div').fitVids();
    $('#video div').on('click', function() {
      $(this).html('<iframe width="853" height="480" src="//www.youtube.com/embed/GSvjmxFnmh0?autoplay=1" frameborder="0" allowfullscreen></iframe>');
      return $(this).fitVids();
    });
    return $.ajax({
      url: 'http://api.bandsintown.com/artists/Eric%20Hutchinson/events.json?artist_id=fbid_14824581139&api_version=2.0&app_id=eh',
      type: 'GET',
      dataType: 'jsonp',
      success: function(results) {
        console.log('success');
        return $.each(results, function() {
          var date, show, ticketText, vip;
          date = this.datetime.split('T');
          show = date[0].split('-');
          vip = ' <a href="https://www.applauze.com/tours/erichutchinson" class="tickets">VIP</a> ';
          if (this.ticket_type === 'Sold Out') {
            ticketText = 'Sold Out';
          } else {
            ticketText = 'Tickets';
          }
          if (this.venue.city === 'Philadelphia') {
            vip = '<a class="tickets" style="background: #ccc">VIP Soldout</a> ';
          }
          return $('<li> <span class="date">' + show[1] + '.' + show[2] + '.' + show[0] + '</span> <span class="city">' + this.venue.city + ', ' + this.venue.region + '</span> <span class="venue">' + this.venue.name + '</span> <div class="links">' + vip + '<a href="' + this.ticket_url + '" class="tickets">' + ticketText + '</a> </div> </li>').appendTo('#shows ul');
        });
      }
    });
  });

}).call(this);
