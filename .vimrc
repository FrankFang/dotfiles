set expandtab   " 将 tab 转换为空格
set tabstop=4   " 一个 tab 显示为 4 个空格的宽度
set shiftwidth=4 " 使用 4 个空格的宽度进行自动缩进


let OS=substitute(system('uname -s'),"\n","","")


if (OS == "Darwin")
elseif (OS == "Linux" )
endif
