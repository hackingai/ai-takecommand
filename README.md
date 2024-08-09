# ai-takecommand
import pyttsx3
import speech_recognition as sr
import datetime

engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[0].id)
engine.setProperty('rate', 200)


def speak(audio):
    print(audio)
    engine.say(audio)
    engine.runAndWait()

def time(): #to tell the user time
    CurrentTime = datetime.datetime.now().strftime("%I %M %S")
    speak("The current time is " + CurrentTime)
    
def date(): # to tell the user date 
    CurrentDate = datetime.datetime.now().strftime("%A %d : %b : %Y")
    speak("The current date is " + CurrentDate)

def wishMe():
    hour = int(datetime.datetime.now().hour)
    if hour>= 0 and hour< 12:
        a = "Good morning ", "Good morning ", "Hello  Good Morning", "O, Good morning ", "O, good morning ", "Wow! Welcome back"
        speak(random.choice(a))
    elif hour>= 12 and hour< 18:
        b = "Good Afternoon ", "Good Afternoon ", "Hello  Good Afternoon", "O, Good Afternoon ", "O, good Afternoon ", "Wow! Welcome back rakshith"   
        speak(random.choice(b))
    elif hour>= 18 and hour< 20:
        c = "Good Evening rakshith", "Good Evening ", "Hello  Good Evening", "O, Good Evening ", "O, good Evening ", "Wow! Welcome back"
        speak(random.choice(c))

    elif hour>=20 and hour<0:
        d = "Good Night Have a good dream"

wishMe()
wel = "So, how can i help you!", "How can i help", "Give me a command ", "Online and ready ", "What can i do for you", "Please give me a command "
speak(random.choice(wel)) 



**def takeCommand():
    r = sr.Recognizer()
    with sr.Microphone() as source:
         print("Listening...")
         r.pause_threshold = 1
         audio = r.listen(source)

    try:
        print("....")
        query = r.recognize_google(audio, language = 'en-in')
    except Exception as e:
        print(e)
        return "None"
    return query**
