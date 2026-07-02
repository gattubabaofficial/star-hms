import sys
import os

try:
    from PIL import Image
    print("PIL is available")
except ImportError:
    print("PIL is NOT available")

try:
    import pytesseract
    print("pytesseract is available")
except ImportError:
    print("pytesseract is NOT available")

try:
    import cv2
    print("OpenCV (cv2) is available")
except ImportError:
    print("OpenCV (cv2) is NOT available")
