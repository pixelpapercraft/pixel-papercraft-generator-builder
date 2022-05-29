open Dom2

let makeFromUrl = url => {
  Promise.make((resolve, reject) => {
    let image = Image.make()
    image->Image.onLoad(() => resolve(. image))
    image->Image.onError(error => reject(. error))
    image->Image.src(url)
  })
}
