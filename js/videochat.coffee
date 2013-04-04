class VideoChat
  constructor: ->
    @video = document.querySelector 'video'

    @canvas = document.querySelector 'canvas'
    @ctx = @canvas.getContext '2d'
    @width = @canvas.width
    @height = @canvas.height

    # Ask the user for permission to use the webcam
    navigator.webkitGetUserMedia {video: yes}, @webcamWorks, @webcamHasError
  webcamHasError: (e) -> console.log e
  webcamWorks: (localMediaStream) =>
    @video.src = window.URL.createObjectURL localMediaStream
    @init()
  init: ->
    # Right now we're just forwarding the webcam data to our canvas
    # to simulate some test data.
    window.requestAnimationFrame => 
      @renderOtherPerson()
  renderOtherPerson: ->
    @ctx.drawImage @video, 0, 0, @width, @height


window.chat = new VideoChat()