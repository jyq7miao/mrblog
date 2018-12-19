#!/usr/local/bin/python2

import glob
import os
from PIL import Image

content_dir = os.environ['MRBLOG_CONTENT']
paths = glob.glob(content_dir + '/pics/*.jpg')
morepaths = glob.glob(content_dir + '/pics/*.png')
paths.extend(morepaths)

for path in paths:
    img = Image.open(path)
    w, h = img.size
    if (w>800 or h>600):
        cmd='magick "'+path+'" -resize "800x600>" "'+path+'"'
        os.system(cmd)

print('resized large images')
