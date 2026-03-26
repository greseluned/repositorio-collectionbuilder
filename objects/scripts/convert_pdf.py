import sys
from pdf2image import convert_from_path

pdf_file = sys.argv[1]
image_prefix = sys.argv[2]

imgs = convert_from_path(pdf_file)
for i, img in enumerate(imgs):
    img.save(f"{image_prefix}-{i+1}.jpg", "JPEG")