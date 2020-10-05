# index is a symlink to the actual hosts file on the computer
ln -s /etc/hosts ~//dotfiles/.hosts/index

python ~//dotfiles/.hosts/generate.py --auto --nogendata --replace --extensions fakenews gambling
rm -rf ~//dotfiles/.hosts/hosts
