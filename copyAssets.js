const fs = require('node:fs')
const glob = require('glob')

const src = "./app/lib/assets/static"
const dest = `./dist/public`

let files = glob.sync(`${src}/**/*`)
// let { files } = deepRead({src})
console.log(files)

// fs.mkdirSync(dest)

const ops = files.map(async file => {
  console.log(file)
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


function deepRead (args) {
  try {
    const fileDirectory = fs.opendirSync(args.src)
    for (let i in fileDirectory) {
      const fileName = i.readSync()

    }
    const newFiles = files.map(file => {
      return deepRead({src:file, files: args.files})
    })
    return newFiles.flat()
  } catch (e) {
    console.warn(e)
    console.warn(args)
    return args.files ? {files: args.files} : {files: []}
  }
}