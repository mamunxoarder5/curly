import time
import requests
from PIL import ImageGrab

# ============================
# USER CREDENTIALS
# ============================
USERNAME = "ME2008"
PASSWORD = "MR.English2008"

print(f"Username: {USERNAME}")
print(f"Password: {PASSWORD}")

# ============================
# SCREENSHOT CAPTURE
# ============================
filename = "AvicaScreenshot.png"

print("Capturing screen in 5 seconds...")
time.sleep(5)

try:
    img = ImageGrab.grab()
    img.save(filename)
    print(f"Screenshot saved as {filename}")
except Exception as e:
    print("Failed to capture screenshot:", e)
    exit(1)

# ============================
# GOFILE UPLOAD FUNCTION
# ============================
def upload_to_gofile(path):
    url = "https://api.gofile.io/uploadFile"

    try:
        with open(path, "rb") as f:
            res = requests.post(url, files={"file": f})
            res.raise_for_status()
            data = res.json()

            if data["status"] == "ok":
                return data["data"]["downloadPage"]
            else:
                print("Error from GoFile:", data)
                return None
    except Exception as e:
        print("Upload failed:", e)
        return None

# ============================
# UPLOAD EXECUTION
# ============================
print("Uploading to GoFile...")
link = upload_to_gofile(filename)

if link:
    print(f"Image uploaded successfully.")
    print(f"Download Link: {link}")
else:
    print("Failed to upload image.")
