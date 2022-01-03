import * as Constants from '$lib/constants'

const regex = new RegExp(/\w+/g)

function generateIpsum(args:any) {
  let length:number = args.length
  const coeff:number = args.medAmount
  let outBlock:string = ""
  
  while (length > 0) {
    outBlock = outBlock.concat(generateSentence(coeff), " ")
    length -= 1
  }
  
  return outBlock
  
}

// impure! generates random sentences -L6
function generateSentence(coeff:number) {
  // console.log(Constants.loremBOW)
  // Constants.medicalBOW
  // Constants.medicalPhraseBOW
  
  let length = Math.floor(Math.random() * 10)
  
  const structures = [
    `${Constants.loremBOW}`
    , `${Constants.loremBOW}`
    , `${Constants.loremBOW}`
  ]
  
  let sentence:string = ""
  while (length > 0) {
    let odds = Math.floor(Math.random() * coeff) //e.g. 71.2 w/ coeff of 100
    /**
    * if coeff is 100, then def grab from medical
    * if it's 1, don't.
    * odds could be 63. Then what? What if 11?
    * coin flip! switch case!
    * 
    */
    
    switch (odds > 30) {
      case true:
      switch (odds > 60) {
        case true:
        const indexP = Math.floor(Math.random() * Constants.medicalPhraseBOW.length)
        sentence = sentence.concat(Constants.medicalPhraseBOW[indexP], " ")
        break
        case false:
        default:
        const index = Math.floor(Math.random() * Constants.medicalBOW.length)
        sentence = sentence.concat(Constants.medicalBOW[index], " ")
      }
      break
      case false:
      default:
      const index = Math.floor(Math.random() * Constants.loremBOW.length)
      sentence = sentence.concat(Constants.loremBOW[index], " ")
    }
    length--
  }
  sentence = (sentence.slice(0,1).toUpperCase())
  .concat(sentence.slice(1, sentence.length - 1))
  .concat(".")
  return `${sentence}`
}

export {
  generateIpsum
  , generateSentence
}