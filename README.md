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
        a = "Good morning rakshith", "Good morning rakshith", "Hello rakshith Good Morning", "O, Good morning rakshith", "O, good morning rakshith", "Wow! Welcome back rakshith rakshith"
        speak(random.choice(a))
    elif hour>= 12 and hour< 18:
        b = "Good Afternoon rakshith", "Good Afternoon rakshith", "Hello rakshith Good Afternoon", "O, Good Afternoon rakshith", "O, good Afternoon rakshith", "Wow! Welcome back rakshith rakshith"   
        speak(random.choice(b))
    elif hour>= 18 and hour< 20:
        c = "Good Evening rakshith", "Good Evening rakshith", "Hello rakshith Good Evening", "O, Good Evening rakshith", "O, good Evening rakshith", "Wow! Welcome back rakshith rakshith"
        speak(random.choice(c))

    elif hour>=20 and hour<0:
        d = "Good Night rakshith Have a good dream"

wishMe()
wel = "So, how can i help you rakshith!", "How can i help", "Give me a command rakshith", "Online and ready rakshith", "What can i do for you", "Please give me a command rakshith"
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
