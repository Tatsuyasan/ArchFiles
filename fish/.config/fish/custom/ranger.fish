function rg --description "Track last directory when leaving ranger"
  command ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd $(head -1 $HOME/.config/ranger/.rangerdir)
end
