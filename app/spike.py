from wand.image import Image as PDF
from PIL import ImageEnhance, ImageFilter
from PIL import Image
import pytesseract
import io
import numpy


def enhance(image):
    image = image.filter(ImageFilter.MedianFilter())
    enhancer = ImageEnhance.Contrast(image)
    image = enhancer.enhance(2)
    return image.convert('1')

def wand_to_pil(wand_image):
    img_buffer = numpy.asarray(bytearray(wand_image.make_blob(format='png')), dtype='uint8')
    bytesio = io.BytesIO(img_buffer)
    return Image.open(bytesio)


# image = Image.open('sample_images/bus_value.png', 'r')
result = 'FAILED TO CONVERT'


with PDF(filename='sample_images/2018-03-26 Approved Transaction.pdf', resolution=400) as image:
    image = wand_to_pil(image)
    result = pytesseract.image_to_string(enhance(image), lang='eng')


# result = pytesseract.image_to_string(enhance(image), lang='eng')
with open('sample_output.txt', 'w+', encoding='utf-8') as f:
    f.write(result)
