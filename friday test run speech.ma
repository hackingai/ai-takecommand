import pyttsx3
import speech recognition as sr


speech = sr.Recognizer()

try:
    engine = pyttsx3.init()
except ImportError:
    print("requested driver is not found")
except RuntimeError:
    print("driver falls to initialize")

voices = engine.getProperty('voices')

for voice in voices:
    print(voice.id)
engine.setProperty('voice','HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_EN-US_ZIRA_11.0')
rate = engine.getProperty('rate')
engine.setProperty('rate',rate)

def speak_text_cmd(cmd):
    engine.say(cmd)
    engine.runAndWait()


def read_voice_cmd():
    voice_text = ''
    with sr.Microphone() as source:
        audio = speech.listen(source)
    try:
        voice_text = speech.recognize_google(audio)
    except sr.UnknownValueError:
        pass
    except sr. RequestError as e:
        print('Network error')
    return voice_text


if __name__ == '__main__':

    speak_text_cmd('Hello Sir. This is Friday your personal Artificial Intelligence')
    
    
