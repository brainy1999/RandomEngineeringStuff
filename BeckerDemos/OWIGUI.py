import tkinter
import tkinter.messagebox
import customtkinter
from PIL import Image, ImageTk
import os
import cv2
import serial
import time

customtkinter.set_appearance_mode("dark")  # Modes: "System" (standard), "Dark", "Light"
customtkinter.set_default_color_theme("blue")  # Themes: "blue" (standard), "green", "dark-blue"

WIDTH = 810
HEIGHT = 525
app = customtkinter.CTk()
app.geometry(f"{WIDTH}x{HEIGHT}")
app.title("OWI GUI")
ser = serial.Serial('com6', 9600)

def set_buttonM1L_state():
        ser.write(bytes('1', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM1R_state():
        ser.write(bytes('4', 'utf-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM2L_state():
        ser.write(bytes('2', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM2R_state():
        ser.write(bytes('5', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM3L_state():
        ser.write(bytes('3', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM3R_state():
        ser.write(bytes('6', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM4L_state():
        ser.write(bytes('7', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM4R_state():
        ser.write(bytes('8', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM5L_state():
        ser.write(bytes('9', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def set_buttonM5R_state():
        ser.write(bytes('*', 'UTF-8'))
        time.sleep(.1)
        textbox.insert("0.0", ser.readline().decode() + "\n")
        ser.write(bytes('0', 'UTF-8'))
def get_input():
        text = entry.get()
        ser.write(text.encode())
        time.sleep(.1)
        ser.write(bytes('0', 'UTF-8'))
        time.sleep(.5)
        entry.delete(0,100)



frame_1 = customtkinter.CTkFrame(master=app,padx=50, pady= 50,)
frame_1.grid(row=0, column=0,)

frame_2 = customtkinter.CTkFrame(master=app,)
frame_2.grid(row=0, column=1,)

frame_3 = customtkinter.CTkFrame(master=app,)
frame_3.grid(row=1, column=0,)

frame_4 = customtkinter.CTkFrame(master=app,)
frame_4.grid(row=1, column=1,)



label_1 = customtkinter.CTkLabel(master=frame_1, text = "M1", )
label_1.grid(row = 0, column = 0)
label_2 = customtkinter.CTkLabel(master=frame_1, text = "M2", )
label_2.grid(row = 1, column = 0)
label_3 = customtkinter.CTkLabel(master=frame_1, text = "M3", )
label_3.grid(row = 2, column = 0)
label_4 = customtkinter.CTkLabel(master=frame_1, text = "M4", )
label_4.grid(row = 3, column = 0)
label_5 = customtkinter.CTkLabel(master=frame_1, text = "M5", )
label_5.grid(row = 4, column = 0)

button_1 = customtkinter.CTkButton(master=frame_1, text="Right",command=set_buttonM1R_state)
button_1.grid(row=0, column=2, pady = 5, padx = 5)

button_2 = customtkinter.CTkButton(master=frame_1, text="Left",command=set_buttonM1L_state)
button_2.grid(row=0, column=1, pady = 5, padx = 5)

button_3 = customtkinter.CTkButton(master=frame_1, text="Right",command=set_buttonM2R_state)
button_3.grid(row=1, column=2, pady = 5, padx = 5)

button_4 = customtkinter.CTkButton(master=frame_1, text="Left",command=set_buttonM2L_state)
button_4.grid(row=1, column=1, pady = 5, padx = 5)

button_5 = customtkinter.CTkButton(master=frame_1, text="Right",command=set_buttonM3R_state)
button_5.grid(row=2, column=2, pady = 5, padx = 5)

button_6 = customtkinter.CTkButton(master=frame_1, text="Left",command=set_buttonM3L_state)
button_6.grid(row=2, column=1, pady = 5, padx = 5)

button_7 = customtkinter.CTkButton(master=frame_1, text="Right",command=set_buttonM4R_state)
button_7.grid(row=3, column=2, pady = 5, padx = 5)

button_8 = customtkinter.CTkButton(master=frame_1, text="Left",command=set_buttonM4L_state)
button_8.grid(row=3, column=1, pady = 5, padx = 5)

button_7 = customtkinter.CTkButton(master=frame_1, text="Right",command=set_buttonM5R_state)
button_7.grid(row=4, column=2, pady = 5, padx = 5)

button_8 = customtkinter.CTkButton(master=frame_1, text="Left",command=set_buttonM5L_state)
button_8.grid(row=4, column=1, pady = 5, padx = 5)

entry = customtkinter.CTkEntry(master=frame_3,
                                            width = 240,)
entry.grid(row=0, column=0, pady=20, padx=20)

button = customtkinter.CTkButton(master=frame_3, text="Enter",command=get_input)
button.grid(row=1, column=0, pady = 5, padx = 5)

textbox = customtkinter.CTkTextbox(master=frame_4, width=250)
textbox.grid(row=0, column=0, padx=20, pady=20)
textbox.insert("0.0", ser.readline().decode() + "\n")

label =tkinter.Label(master=frame_2)
label.grid(row=0, column=0)
cap= cv2.VideoCapture(0)

# Define function to show frame
def show_frames():
   # Get the latest frame and convert into Image
   cv2image= cv2.cvtColor(cap.read()[1],cv2.COLOR_BGR2RGB)
   img = Image.fromarray(cv2image).resize((300, 300))
   # Convert image to PhotoImage
   imgtk = ImageTk.PhotoImage(image = img)
   label.imgtk = imgtk
   label.configure(image=imgtk)
   # Repeat after an interval to capture continiously
   label.after(20, show_frames)

show_frames()


app.mainloop()