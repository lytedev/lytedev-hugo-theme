document.documentElement.classList.remove 'no-js'

log = ->
	if not console? then return false
	args = [].slice.apply arguments
	console.log.apply console, args

log 'Thanks for checking out my site\'s code!'
log 'The raw source is available on my GitHub at https://github.com/lytedev'
