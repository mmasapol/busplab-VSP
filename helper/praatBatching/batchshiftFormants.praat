############################
#  Resynthesizes all the sound files in the
#  specified directory to have flat pitch
#  of the specified frequency.  Files are
#  saved in a specified directory.
############################

form Resynthize files to have flat pitch
	text tokenDir
	sentence Sound_file_extension
	sentence targetPertName
        real targetF1Pert
	real targetF2Pert
	positive curToken
	positive numTokens
endform

#Here, you make a listing of all the sound files in a directory.
Create Strings as file list... list 'tokenDir$'/*'sound_file_extension$'

filename$ = Get string... 1

#A sound file is opened from the listing:
Read from file... 'tokenDir$'/'filename$'
sound_one$ = selected$ ("Sound")

execute C:\Users\djsmith\Praat\plugin_VocalToolkit\changeformants.praat 'targetF1Pert' 'targetF2Pert' 0 0 0 5000 no yes

select Sound 'sound_one$'_changeformants

Write to WAV file... 'tokenDir$''targetPertName$''sound_file_extension$'

select all
Remove

if curToken = numTokens
Quit
endif