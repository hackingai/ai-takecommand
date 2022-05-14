import pyautogui
from bs4 import BeautifulSoup
import psutil
import speedtest
import cv2
import pywhatkit as kit
import webbrowser
import pyjokes 
import os
from ctypes import oledll


elif "open command prompt" in query:
            os.system("start cmd")

        elif "open camera" in query:
            cap = cv2.VideoCapture(0)
            while True:
                ret, img = cap.read()
                cv2.imshow('webcam', img)
                k = cv2.waitKey(50)
                if k==27:
                    break;
            cap.release()
            cv2.destroyAllWindows()
        
        #to close application
        elif"close notepad" in query:
            speak("okay sir, closing notepad")
            os.system("taskkill /f /im notepad.exe")

        elif"temperature" in query:
           search = "temperature in telangana"
           url = f"http://www.google.com/search?q={search}"
           r = requests.get(url)
           data = BeautifulSoup(r.text,"html.parser")
           temp = data.find("div",class_="BNeawe").text
           speak(f"current {search} is {temp}")

        elif "how much power left" in query or "battery" in query:
            battery = psutil.sensors_battery()
            percentage = battery.percent
            speak(f"sir our system have {percentage} percent battery")

        elif "internet speed" in query:
            st = speedtest.Speedtest()
            dl = st.download()
            up = st.upload()
            speak(f"sir we have {dl} bit per second downloading speed and {up} bit per second uploading speed")

        elif "volume up" in query:
            pyautogui.press("volumeup")

        elif "volume down" in query:
            pyautogui.press("volumedown")

        elif "mute" in query:
            pyautogui.press("volumemute")

        elif "un mute" in query:
            pyautogui.press("volumeunmute")

        elif "activate helping mode" in query:
            speak("helping mode is activated please tell me what help do you want")
            how = takeCommand()
            max_results = 1
            how_to = search_wikihow(how, max_results)
            assert len(how_to) == 1
            how_to[0].print()
            speak(how_to[0].summary)

        elif "what are you doing" in query:
            speak("I am waiting for your command")

        elif 'switch the window' in query:
            pyautogui.keyDown("alt")
            pyautogui.press("tab")
            time.sleep(1)
            pyautogui.keyUp("alt")

        #-----------------To find my location using IP Address-----------------

        elif "where i am" in query or "where we are" in query:
            speak("wait sir, let me check")
            try:
                ipAdd = requests.get('http://api.ipify.org').text
                print(ipAdd)
                url = 'http://get.geojs.io/v1/ip/geo/'+ipAdd+'.json'
                geo_requests = requests.get(url)
                geo_data = geo_requests.json()
                # print(geo_data)
                city = geo_data['city']
                # state = geo_data['state']
                country = geo_data['country']
                speak(f"sir i think we are in {city} city of {country} country")
            except Exception as e:
                speak("sorry sir, Due to network issue i am not able to find exactly where we are.")
                pass

        #----------------------To check a instagram profile----
        elif "instagram profile" in query:
            speak("sir please enter username correctly.")
            name = input("enter username here:")
            webbrowser.open(f"www.instagram.com/{name}")
            speak(f"Sir here is the profile of the user {name}")
            time.sleep(5)
            speak("Sir do you want download the profile pictureof the user.")
            condition = takeCommand().lower()
            if "yes" in condition:
                mod = instaloader.Instaloader()
                mod.download_profile(name,profile_pic_only=True)
                speak("i am done sir, profile picture is saved in our main folder. now i am ready for next command")
            else:
                pass

#----------------------------To take screenshot -----------

        elif "take screenshot" in query:
            speak("sir were should i upload this screenshot")
            name=takeCommand().lower()
            speak("please hold the screen for few seconds sir")
            time.sleep(3)
            img = pyautogui.screenshot()
            img.save(f"{name}.png")

        elif "ip address" in query:
            ip = get ("https://api.ipify.org").text
            speak(f"your IP address is {ip}")

        elif "send message" in query:
            kit.sendwhatmsg("phonenumber", "this is testing protocol" ,2,25)
