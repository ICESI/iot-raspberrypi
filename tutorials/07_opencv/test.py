import numpy as np
import cv2
import sys
import pdb

if len(sys.argv) < 2:
    print("USAGE: {} img-file".format(sys.argv[0]))
    sys.exit(1)

# Load an color image in grayscale
pdb.set_trace()
img = cv2.imread(sys.argv[1],0)
cv2.imshow('image',img)
cv2.waitKey(5000)
cv2.destroyAllWindows()
