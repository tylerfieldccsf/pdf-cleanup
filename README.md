# pdf cleanup
Attempt to cleanup scanned pdfs and do OCR

Written for an Ubuntu system; if you run this on Windows you might need to 
modify the extract_and_ocr.sh script



## requirements
have these installed on your system:
[imagemagick](https://imagemagick.org/index.php)
[tesseract](https://github.com/tesseract-ocr/tesseract)


## how to run
change script to add run permissions:
"""sh
chmod 755 extract_and_ocr.sh
"""

add the pdf files to the input file:
"""sh
find pdf -type f > files.txt
"""

run the script:
"""sh
./extract_and_ocr.sh files.txt
"""

see the extracted text in the "output" folder


## tweaks/improvements
This line in **extract_and_ocr.sh** can be tweaked to improve the image processing:
"""sh
convert -density 150 $file -normalize -threshold 90% -blur 5 temp/$filename-%03d.jpg
"""
Modifiying the densith/threshold/blur values might improve the results.  See the reference links for more

## reference links
* https://superuser.com/questions/622950/is-there-a-way-to-increase-the-contrast-of-a-pdf-that-was-created-by-scanning-a
* https://superuser.com/questions/693339/batch-processing-images-of-documents-to-look-like-a-fax

* https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

* https://stackoverflow.com/questions/17029360/making-text-more-readable-imagemagick
* https://stackoverflow.com/questions/9608279/cleaning-scanned-grayscale-images-with-imagemagick
* https://stackoverflow.com/questions/74526922/gray-scale-to-text-scan-image-to-black-white-image-with-higher-resolution
* https://stackoverflow.com/questions/70444935/imagemagick-improve-text-quality-in-scanned-image

