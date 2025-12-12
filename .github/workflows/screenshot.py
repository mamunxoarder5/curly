import time
import requests
from PIL import ImageGrab

img_filename = 'AvicaScreenshot.png'

print("Capturing screen...")
time.sleep(5)
img = ImageGrab.grab()
img.save(img_filename)
print(f"Screenshot saved as {img_filename}")

def upload_image_to_gofile(filename):
    url = 'https://api.gofile.io/uploadFile'
    try:
        with open(filename, 'rb') as img_file:
            files = {'file': img_file}
            response = requests.post(url, files=files)
            response.raise_for_status()
            result = response.json()
            if result['status'] == 'ok':
                return result['data']['downloadPage']
            else:
                print("Upload error:", result.get('status'))
                return None
    except Exception as e:
        print(f"Failed to upload image: {e}")
        return None

gofile_link = upload_image_to_gofile(img_filename)
if gofile_link:
    print(f"Image uploaded successfully. Link: {gofile_link}")
else:
    print("Failed to upload the image.")