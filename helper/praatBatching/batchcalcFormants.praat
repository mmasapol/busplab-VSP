############################
#  Resynthesizes all the sound files in the
#  specified directory to have flat pitch
#  of the specified frequency.  Files are
#  saved in a specified directory.
############################

form Resynthize files to have flat pitch
	text wavFileLoc
	text txtFileLoc
endform

#A sound file is opened from the listing:
Read from file... 'wavFileLoc$'
sound_one$ = selected$ ("Sound")

start = Get start time
end   = Get end time

To Formant (burg)... 0.0 5.0 5500 0.025 50

for i to (end - start)/0.005
    time = start + i * 0.005
    select Formant 'sound_one$'
    formant1 = Get value at time... 1 time Hertz Linear
    formant2 = Get value at time... 2 time Hertz Linear
    appendInfoLine: fixed$ (time, 3), " ", fixed$ (formant1, 3), " ", fixed$ (formant2, 3)
endfor
	
fappendinfo 'txtFileLoc$'

select all
Remove
clearinfo

Quit