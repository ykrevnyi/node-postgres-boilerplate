
const express = require('express')
const app = express()

console.log('starting app..')

app.get('/', (req, res) => {
  res.send('hello world')
})

app.listen(process.env.PORT)
