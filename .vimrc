let OS=substitute(system('uname -s'),"\n","","")
if (OS == "Darwin")
elseif (OS == "Linux" )
endif
