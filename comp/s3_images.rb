s3_base_url = File.read("config/s3_images_path.txt").strip


images = %w(
  blockchain_rings1_cc.jpg
  blockchain_rings1_cc2.jpg
  blockchain_rings1.jpg
  blockchain_rings2_cc.jpg
  blockchain_rings2.jpg
  blockchain_rings3.jpg
  blockchain_rings4.jpg
  blockchain_rings5.jpg
  File%2028-10-2016%2C%2012%2023%2006.jpeg
  File%2028-10-2016%2C%2012%2025%2018%20CC.jpeg
  File%2028-10-2016%2C%2012%2025%2018.jpeg
  File%2028-10-2016%2C%2012%2027%2020.jpeg
  IMG_20160725_093520_1.jpg
  IMG_20160725_093614.jpg
  IMG_20161029_145257.jpg
  IMG_7698.JPG
  IMG_7702.JPG
  IMG_7714.JPG
  IMG_7722.JPG
  IMG_7732.JPG
  IMG_7745.JPG
  IMG_7751.JPG
  IMG_7753.JPG
  IMG_7754.JPG
  IMG_7755.JPG
  IMG_7763.JPG
  IMG_7767.JPG
  IMG_7768.JPG
  IMG_7769.JPG
  IMG_7770.JPG
  IMG_7771.JPG
  IMG_7772.JPG
  IMG_7773.JPG
  IMG_7774.JPG
  IMG_7775.JPG
  IMG_7776.JPG
  IMG_7777.JPG
  IMG_7778.JPG
  IMG_7779.JPG
  IMG_7780.JPG
  IMG_7781.JPG
  IMG_7782.JPG
  IMG_7783.JPG
  IMG_7784.JPG
  IMG_7785.JPG
  IMG_7786.JPG
  IMG_7787.JPG
  IMG_7788.JPG
  IMG_7789.JPG
  IMG_7790.JPG
  IMG_7791.JPG
  IMG_7792.JPG
  IMG_7793.JPG
  IMG_7794.JPG
  IMG_7796.JPG
)

images.map! do |item|
  s3_base_url % item
end

S3Images = images

# items = images

view = {
# View = {
  items: images,
  # items: items,
}

S3ImagesView = view
