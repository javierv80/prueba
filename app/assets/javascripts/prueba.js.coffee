Prueba = {}

Prueba.autoSelectSearch = ->
	window.onload = ->
		keyword = document.getElementById 'keyword'
		keyword.onclick = ->
		@select()

Prueba.autoSelectSearch()