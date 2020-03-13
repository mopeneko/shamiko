import asynchttpserver, asyncdispatch, random

var server = newAsyncHttpServer()
randomize()

const lines = [
  "シャミ子が悪いんだよ",
  "シャミ子は悪くないよ"
]

proc cb(req: Request) {.async.} =
  if req.url.path == "/":
    var index = rand(1)
    await req.respond(Http200, lines[index])
  else:
    await req.respond(Http404, "Not Found")

waitFor server.serve(Port(8080), cb)
