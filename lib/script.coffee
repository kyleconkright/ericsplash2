$ ->

	$('h2.trigger').on 'click', (e) ->
		e.preventDefault()
		if $(@).hasClass 'open'
			$('#items')
				.animate
					'right':'-100%', 100
			$(@).removeClass 'open'
			$(@).html('<img src="assets/img/ehpf.jpg">')
		else
			$('#items')
				.animate
					'right':'0', 100
			$(@).addClass 'open'
			$(@).html('<i class="fa fa-chevron-right"></i>')


	$('#video div').fitVids()
	$('#video div').on 'click', ->
		$(@).html('<iframe width="853" height="480" src="//www.youtube.com/embed/GSvjmxFnmh0?autoplay=1" frameborder="0" allowfullscreen></iframe>')
		$(@).fitVids()

	

	$.ajax
		url: 'http://api.bandsintown.com/artists/Eric%20Hutchinson/events.json?artist_id=fbid_14824581139&api_version=2.0&app_id=eh'
		type: 'GET'
		dataType: 'jsonp'
		success: (results) ->
			console.log 'success'
			$.each results, ->
				date = this.datetime.split 'T'
				show = date[0].split '-'
				vip = ' <a href="https://www.applauze.com/tours/erichutchinson" class="tickets">VIP</a> '
				if this.ticket_type is 'Sold Out'
					ticketText = 'Sold Out'
				else
					ticketText = 'Tickets'
				if this.venue.city is 'Philadelphia'
					vip = '<a class="tickets" style="background: #ccc">VIP Soldout</a> '
				$('<li>
					<span class="date">'+show[1]+'.'+show[2]+'.'+show[0]+'</span>
					<span class="city">' + this.venue.city + ', ' + this.venue.region + '</span>
					<span class="venue">' + this.venue.name + '</span>
					<div class="links"> 
						' + vip + '
						<a href="' + this.ticket_url + '" class="tickets">' + ticketText + '</a>
					</div>
				</li>')
				.appendTo('#shows ul')

				
	# $.ajax
	# 	url: 'data/data.json'
	# 	type: 'GET'
	# 	dataType: 'json'
	# 	success: (results) ->