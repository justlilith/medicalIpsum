const fs = require('node:fs')

const src = "./app/lib/assets/static"
const dest = `./dist/public`

let files = deepRead(src)
files = files.flat()
console.log(files)

// fs.mkdirSync(dest)

const ops = files.map(async file => {
  return new Promise((resolve, reject) => {
    fs.copyFile(file, dest, (e)=>{
      if (e) {
        console.log(e)
        reject()
      } else {
        resolve()
      }
    })
  })
})

Promise.all(ops)
.then(()=> console.log(`Assets copied! ✨`))
.catch(() => console.log(`Assets not copied! 🥲`))


function deepRead (path) {
  const files = fs.readdirSync(path)
  if (files) {
    const newFiles = files.map(file => {
      deepRead(file)
    })
    return newFiles
  } else {
    return path
  }
}